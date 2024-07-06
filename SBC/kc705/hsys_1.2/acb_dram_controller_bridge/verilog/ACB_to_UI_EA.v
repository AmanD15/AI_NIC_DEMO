`timescale 1ns / 1ps

 module ACB_to_UI_EA(
  input ui_clk,
  input sys_rst,
  input init_calib_complete,
  output [27:0]       app_addr,
  output [2:0]       app_cmd,
  output             app_en,
  output  reg [511:0]        app_wdf_data,
  output             app_wdf_end,
  output reg[63:0]        app_wdf_mask,
  output             app_wdf_wren,
  input [511:0]       app_rd_data,
  //output reg[63:0]      t_app_rd_data,
  input            app_rd_data_end,
  input            app_rd_data_valid,
  input            app_rdy,
  input            app_wdf_rdy,
  output        app_sr_req,
  output        app_ref_req,
  output        app_zq_req,
  input            app_sr_active,
  input            app_ref_ack,
  input            app_zq_ack,
  input            ui_clk_sync_rst,
  output          DRAM_REQUEST_pipe_write_ack,
  input           DRAM_REQUEST_pipe_write_req,
  input [109:0]   DRAM_REQUEST_pipe_write_data,
  input           DRAM_RESPONSE_pipe_read_req,
  output          DRAM_RESPONSE_pipe_read_ack,
  output [64:0]   DRAM_RESPONSE_pipe_read_data,
  output reg      fatal_error,
  output [3:0]    cdebug,
  output [3:0]    ddebug,
  output [4:0]    rdebug
    );
    

    

      assign          app_sr_req=0;
      assign          app_ref_req=0;
      assign          app_zq_req=0;
      assign          app_wdf_end=1;
      //assign          app_wdf_mask=0;
      
      
reg ready;
//reg[31:0] count;
always@(posedge ui_clk) begin
    if(sys_rst) begin
        ready<=0;
    end
    else begin
        if(init_calib_complete) begin
            ready<=1;
        end
   end
end


    
wire block_in;
wire read_resf_deq,read_resf_full,read_resf_empty,read_resf_pfull;
wire [63:0] read_resf_dout;
wire [1:0] tagf_dout;
reg [1:0] tagf_din;
reg tagf_enq,tagf_deq;
wire tagf_full,tagf_empty,tagf_pfull;
wire read_res_type,write_res_type;


//C CHANNEL 
wire C_enq,C_deq,C_full,C_empty;
wire [28:0] C_din,C_dout;
assign C_din[28]=DRAM_REQUEST_pipe_write_data[108]; //1=read cmd=001 0=write cmd=000
assign C_din[27:0]=DRAM_REQUEST_pipe_write_data[94:67];
assign app_addr=C_dout[27:0];
assign app_cmd=C_dout[28]? 3'b001: 3'b000;

//D CHANNEL
wire D_enq,D_deq,D_full,D_empty;
wire [74:0] D_din,D_dout;
assign D_din[63:0]=DRAM_REQUEST_pipe_write_data[63:0];  //write data
assign D_din[71:64]=DRAM_REQUEST_pipe_write_data[107:100]; //datamask
assign D_din[74:72]=DRAM_REQUEST_pipe_write_data[69:67];

//Response channel



//assign app_wdf_mask={56'd0,D_dout[71:64]};
//assign app_wdf_mask=0;
wire [0:63] Data_rev;
wire [0:7]  Data_mask_rev;
wire [2:0] add_offset;
assign Data_rev=D_dout[63:0];
assign Data_mask_rev=D_dout[71:64];
assign add_offset=D_dout[74:72];
//assign Data_mask_rev=1;
always@(*) begin
    case(add_offset) 
        3'b000: begin
            app_wdf_data={448'd0,Data_rev};
            app_wdf_mask={56'hffffffffffffff,~Data_mask_rev};
        end
        3'b001: begin
            app_wdf_data={384'd0,Data_rev,64'd0};
            app_wdf_mask={48'hffffffffffff,~Data_mask_rev,8'hff};
        end
        3'b010: begin
            app_wdf_data={320'd0,Data_rev,128'd0};
            app_wdf_mask={40'hffffffffff,~Data_mask_rev,16'hffff};
        end
        3'b011: begin
            app_wdf_data={256'd0,Data_rev,192'd0};
            app_wdf_mask={32'hffffffff,~Data_mask_rev,24'hffffff};
        end
        3'b100: begin
            app_wdf_data={192'd0,Data_rev,256'd0};
            app_wdf_mask={24'hffffff,~Data_mask_rev,32'hffffffff};
        end
        3'b101: begin
            app_wdf_data={128'd0,Data_rev,320'd0};
            app_wdf_mask={16'hffff,~Data_mask_rev,40'hffffffffff};
        end
        3'b110: begin
            app_wdf_data={64'd0,Data_rev,384'd0};
            app_wdf_mask={8'hff,~Data_mask_rev,48'hffffffffffff};
        end
        3'b111: begin
            app_wdf_data={Data_rev,448'd0};
            app_wdf_mask={~Data_mask_rev,56'hffffffffffffff};
        end
        default: begin
            app_wdf_data={448'd0,Data_rev};
            app_wdf_mask={56'hffffffffffffff,~Data_mask_rev};
        end
     endcase
end     
        

//CONTROL SIGNALS
assign DRAM_REQUEST_pipe_write_ack=(~C_full) & (~D_full) & (~block_in) & ready ; //Accept pipe data if both pipe have space

assign app_en=(~C_empty);
assign C_deq=app_rdy ; //changed
assign C_enq=DRAM_REQUEST_pipe_write_ack & DRAM_REQUEST_pipe_write_req & ready;

assign app_wdf_wren=(~D_empty);
assign D_deq=app_wdf_rdy ;  //changed
assign D_enq=DRAM_REQUEST_pipe_write_ack & DRAM_REQUEST_pipe_write_req & (~DRAM_REQUEST_pipe_write_data[108]) & ready;



assign cdebug={C_full,C_empty,C_enq,C_deq};
assign ddebug={D_full,D_empty,D_enq,D_deq};
fifo_generator_1 fifo_c_channel (
              .clk (ui_clk),
              .srst (sys_rst),
              .din (C_din),
              .wr_en (C_enq),
              .rd_en (C_deq),
              .dout (C_dout),
              .full (C_full),
              .empty (C_empty)
            );  
fifo_generator_2 fifo_d_channel (
                          .clk (ui_clk),
                          .srst (sys_rst),
                          .din (D_din),
                          .wr_en (D_enq),
                          .rd_en (D_deq),
                          .dout (D_dout),
                          .full (D_full),
                          .empty (D_empty)
                        ); 

assign block_in=tagf_pfull | read_resf_pfull;

always@(posedge ui_clk) begin
    if(sys_rst | (~ready)) begin
        tagf_din<=2'b00;
        tagf_enq<=1'b0;
    end
    else begin
        if(app_rdy & app_en) begin
            if(C_dout[28]) 
                tagf_din<=2'b10;
            else
                tagf_din<=2'b01;
            tagf_enq<=1'b1;
        end
        else begin
            tagf_din<=2'b00;
            tagf_enq<=1'b0;
        end           
   end
end


assign read_res_type=(tagf_dout==2'b10)?(~tagf_empty):1'b0;
assign write_res_type=(tagf_dout==2'b01)?(~tagf_empty):1'b0;
assign DRAM_RESPONSE_pipe_read_data[64]=1'b0;
assign DRAM_RESPONSE_pipe_read_data[63:0]=(read_res_type==1'b1)?(read_resf_dout):64'b0;
//assign tagf_deq=(write_res_type==1'b1)?DRAM_RESPONSE_pipe_read_req:(  (read_res_type==1'b1) ? (DRAM_RESPONSE_pipe_read_req & (~read_resf_empty)):1'b0   );
always@(*) begin
    if(write_res_type==1'b1 & DRAM_RESPONSE_pipe_read_req==1'b1) 
        tagf_deq=1'b1;
    else if((read_res_type==1'b1) & (~read_resf_empty) & DRAM_RESPONSE_pipe_read_req)
        tagf_deq=1'b1;
    else
        tagf_deq=1'b0;
end
assign read_resf_deq=read_res_type & (~read_resf_empty) & DRAM_RESPONSE_pipe_read_req;
//assign DRAM_RESPONSE_pipe_read_req=tagf_deq; 
//assign DRAM_RESPONSE_pipe_read_ack= 
reg read_ack;
always@(*) begin
    if(write_res_type==1'b1)
        read_ack=1'b1;
    else if(read_res_type==1'b1 & (~read_resf_empty) )
        read_ack=1'b1;
    else
        read_ack=1'b0;
end
assign DRAM_RESPONSE_pipe_read_ack=read_ack;
fifo_generator_3 fifo_read_res_channel(
                          .clk(ui_clk),        // input wire clk
                          .srst(sys_rst),    // input wire srst
                          .din(app_rd_data[63:0]),              // input wire [63 : 0] din
                          .wr_en(app_rd_data_valid),          // input wire wr_en
                          .rd_en(read_resf_deq),          // input wire rd_en
                          .dout(read_resf_dout),            // output wire [63 : 0] dout
                          .full(read_resf_full),            // output wire full
                          .empty(read_resf_empty),          // output wire empty
                          .prog_full(read_resf_pfull)  // output wire prog_full
                        );

                       
fifo_generator_4 fifo_tag_channel (
                          .clk(ui_clk),              // input wire clk
                          .srst(sys_rst),            // input wire srst
                          .din(tagf_din),              // input wire [1 : 0] din
                          .wr_en(tagf_enq),          // input wire wr_en
                          .rd_en(tagf_deq),          // input wire rd_en
                          .dout(tagf_dout),            // output wire [1 : 0] dout
                          .full(tagf_full),            // output wire full
                          .empty(tagf_empty),          // output wire empty
                          .prog_full(tagf_pfull)  // output wire prog_full
                        );
                        

assign rdebug= {read_resf_full,read_resf_empty,app_rd_data_valid,DRAM_RESPONSE_pipe_read_req,read_resf_pfull};
assign cdebug={C_full,C_empty,C_enq,C_deq};
assign ddebug={D_full,D_empty,D_enq,D_deq};                      

always@(posedge ui_clk) begin
    if(sys_rst) begin
        fatal_error<=1'b0;
    end
    else begin 
        if(app_rd_data_valid & read_resf_full) begin
            fatal_error<=1'b1;
        end
    end
end



endmodule

