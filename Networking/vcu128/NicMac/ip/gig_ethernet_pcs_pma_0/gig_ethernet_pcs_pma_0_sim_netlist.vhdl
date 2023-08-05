-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Thu Apr 27 23:20:17 2023
-- Host        : ajit2-System-Product-Name running 64-bit Ubuntu 20.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/harshad/Project/git/new_eth/verilog-ethernet/example/VCU128/fpga_1g/fpga/fpga_top_vcu128.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0_sim_netlist.vhdl
-- Design      : gig_ethernet_pcs_pma_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcvu37p-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble is
  port (
    Rx_Bsc_Rst : in STD_LOGIC;
    Rx_Bs_Rst : in STD_LOGIC;
    Rx_Rst_Dly : in STD_LOGIC;
    Rx_Bsc_En_Vtc : in STD_LOGIC;
    Rx_Bs_En_Vtc : in STD_LOGIC;
    Rx_Riu_Clk : in STD_LOGIC;
    Rx_Riu_Addr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Rx_Riu_Wr_Data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Rx_Riu_Rd_Data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Rx_Riu_Valid : out STD_LOGIC;
    Rx_Riu_Prsnt : out STD_LOGIC;
    Rx_Riu_Wr_En : in STD_LOGIC;
    Rx_Riu_Nibble_Sel : in STD_LOGIC;
    Rx_Pll_Clk : in STD_LOGIC;
    Rx_RefClk : in STD_LOGIC;
    Rx_Dly_Rdy : out STD_LOGIC;
    Rx_Vtc_Rdy : out STD_LOGIC;
    Rx_Dyn_Dci : out STD_LOGIC_VECTOR ( 6 downto 0 );
    Rx_Tbyte_In : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Rx_Phy_Rden : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Rx_Clk_From_Ext : in STD_LOGIC;
    Rx_Pclk_Nibble_In : in STD_LOGIC;
    Rx_Nclk_Nibble_In : in STD_LOGIC;
    Rx_Nclk_Nibble_Out : out STD_LOGIC;
    Rx_Pclk_Nibble_Out : out STD_LOGIC;
    Rx_Clk_To_Ext_North : out STD_LOGIC;
    Rx_Clk_To_Ext_South : out STD_LOGIC;
    Rx_Data_In : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Rx_Q_Out : out STD_LOGIC_VECTOR ( 23 downto 0 );
    Rx_Q_CombOut : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Fifo_Rd_Clk : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Fifo_Wrclk_Out : out STD_LOGIC;
    Fifo_Rd_En : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Fifo_Empty : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Rx_Ce : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Rx_Clk : in STD_LOGIC;
    Rx_Inc : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Rx_Load : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Rx_CntValueIn : in STD_LOGIC_VECTOR ( 53 downto 0 );
    Rx_CntValueOut : out STD_LOGIC_VECTOR ( 53 downto 0 );
    Rx_Ce_Ext : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Rx_Inc_Ext : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Rx_Load_Ext : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Rx_CntValueIn_Ext : in STD_LOGIC_VECTOR ( 53 downto 0 );
    Rx_CntValueOut_Ext : out STD_LOGIC_VECTOR ( 53 downto 0 )
  );
  attribute C_BtslcNulType : string;
  attribute C_BtslcNulType of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "SERIAL";
  attribute C_BusRxBitCtrlIn : integer;
  attribute C_BusRxBitCtrlIn of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 40;
  attribute C_BusRxBitCtrlOut : integer;
  attribute C_BusRxBitCtrlOut of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 40;
  attribute C_BusTxBitCtrlIn : integer;
  attribute C_BusTxBitCtrlIn of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 40;
  attribute C_BusTxBitCtrlInTri : integer;
  attribute C_BusTxBitCtrlInTri of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 40;
  attribute C_BusTxBitCtrlOut : integer;
  attribute C_BusTxBitCtrlOut of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 40;
  attribute C_BusTxBitCtrlOutTri : integer;
  attribute C_BusTxBitCtrlOutTri of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 40;
  attribute C_BytePosition : integer;
  attribute C_BytePosition of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 0;
  attribute C_Cascade : string;
  attribute C_Cascade of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "FALSE";
  attribute C_CntValue : integer;
  attribute C_CntValue of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 9;
  attribute C_Ctrl_Clk : string;
  attribute C_Ctrl_Clk of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "EXTERNAL";
  attribute C_Delay_Format : string;
  attribute C_Delay_Format of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "COUNT";
  attribute C_Delay_Type : string;
  attribute C_Delay_Type of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "VAR_LOAD";
  attribute C_Delay_Value : integer;
  attribute C_Delay_Value of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 0;
  attribute C_Delay_Value_Ext : integer;
  attribute C_Delay_Value_Ext of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 0;
  attribute C_Div_Mode : string;
  attribute C_Div_Mode of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "DIV2";
  attribute C_En_Clk_To_Ext_North : string;
  attribute C_En_Clk_To_Ext_North of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "DISABLE";
  attribute C_En_Clk_To_Ext_South : string;
  attribute C_En_Clk_To_Ext_South of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "DISABLE";
  attribute C_En_Dyn_Odly_Mode : string;
  attribute C_En_Dyn_Odly_Mode of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "FALSE";
  attribute C_En_Other_Nclk : string;
  attribute C_En_Other_Nclk of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "FALSE";
  attribute C_En_Other_Pclk : string;
  attribute C_En_Other_Pclk of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "FALSE";
  attribute C_Fifo_Sync_Mode : string;
  attribute C_Fifo_Sync_Mode of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "FALSE";
  attribute C_Idly_Vt_Track : string;
  attribute C_Idly_Vt_Track of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "TRUE";
  attribute C_Inv_Rxclk : string;
  attribute C_Inv_Rxclk of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "FALSE";
  attribute C_IoBank : integer;
  attribute C_IoBank of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 44;
  attribute C_Is_Clk_Ext_Inverted : string;
  attribute C_Is_Clk_Ext_Inverted of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "1'b0";
  attribute C_Is_Clk_Inverted : string;
  attribute C_Is_Clk_Inverted of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "1'b0";
  attribute C_Is_Rst_Dly_Ext_Inverted : string;
  attribute C_Is_Rst_Dly_Ext_Inverted of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "1'b0";
  attribute C_Is_Rst_Dly_Inverted : string;
  attribute C_Is_Rst_Dly_Inverted of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "1'b0";
  attribute C_Is_Rst_Inverted : string;
  attribute C_Is_Rst_Inverted of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "1'b0";
  attribute C_NibbleType : integer;
  attribute C_NibbleType of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 6;
  attribute C_Odly_Vt_Track : string;
  attribute C_Odly_Vt_Track of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "TRUE";
  attribute C_Part : string;
  attribute C_Part of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "XCKU060";
  attribute C_Qdly_Vt_Track : string;
  attribute C_Qdly_Vt_Track of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "TRUE";
  attribute C_Read_Idle_Count : string;
  attribute C_Read_Idle_Count of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "6'b000000";
  attribute C_RefClk_Frequency : string;
  attribute C_RefClk_Frequency of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "312.500000";
  attribute C_RefClk_Src : string;
  attribute C_RefClk_Src of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "PLLCLK";
  attribute C_Rounding_Factor : integer;
  attribute C_Rounding_Factor of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 16;
  attribute C_RxGate_Extend : string;
  attribute C_RxGate_Extend of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "FALSE";
  attribute C_Rx_Clk_Phase_n : string;
  attribute C_Rx_Clk_Phase_n of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "SHIFT_90";
  attribute C_Rx_Clk_Phase_p : string;
  attribute C_Rx_Clk_Phase_p of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "SHIFT_90";
  attribute C_Rx_Data_Width : integer;
  attribute C_Rx_Data_Width of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is 4;
  attribute C_Rx_Gating : string;
  attribute C_Rx_Gating of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "DISABLE";
  attribute C_Self_Calibrate : string;
  attribute C_Self_Calibrate of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "ENABLE";
  attribute C_Serial_Mode : string;
  attribute C_Serial_Mode of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "TRUE";
  attribute C_Tx_Gating : string;
  attribute C_Tx_Gating of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "DISABLE";
  attribute C_Update_Mode : string;
  attribute C_Update_Mode of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "ASYNC";
  attribute C_Update_Mode_Ext : string;
  attribute C_Update_Mode_Ext of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "ASYNC";
  attribute C_UsedBitslices : string;
  attribute C_UsedBitslices of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "7'b0110001";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble : entity is "gig_ethernet_pcs_pma_0_Rx_Nibble";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^fifo_empty\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal IntBtslcCtrl_RxBitCtrlIn : STD_LOGIC_VECTOR ( 239 downto 0 );
  signal IntBtslcCtrl_RxBitCtrlOut_0 : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal IntBtslcCtrl_RxBitCtrlOut_160 : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal IntBtslcCtrl_RxBitCtrlOut_200 : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal IntBtslcCtrl_TxBitCtrlIn : STD_LOGIC_VECTOR ( 239 downto 0 );
  signal IntBtslcCtrl_TxBitCtrlOut_0 : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal IntBtslcCtrl_TxBitCtrlOut_160 : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal IntBtslcCtrl_TxBitCtrlOut_200 : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \^rx_cntvalueout\ : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal \^rx_cntvalueout_ext\ : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_IN6_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT1_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT2_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT3_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT6_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_IN6_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT1_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT2_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT3_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT6_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT_TRI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_5[1].Gen_5_1.Gen_5_1_1.Nibble_I_RxBitslice_0_Q_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal \NLW_Gen_5[5].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_FIFO_WRCLK_OUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_Gen_5[5].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_Q_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal \NLW_Gen_5[6].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_FIFO_WRCLK_OUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_Gen_5[6].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_Q_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 4 );
  attribute box_type : string;
  attribute box_type of \Gen_1.Nibble_I_BitsliceCntrl\ : label is "PRIMITIVE";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of \Gen_5[1].Gen_5_1.Gen_5_1_1.Nibble_I_RxBitslice_0\ : label is std.standard.true;
  attribute box_type of \Gen_5[1].Gen_5_1.Gen_5_1_1.Nibble_I_RxBitslice_0\ : label is "PRIMITIVE";
  attribute box_type of \Gen_5[5].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n\ : label is "PRIMITIVE";
  attribute box_type of \Gen_5[6].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n\ : label is "PRIMITIVE";
  attribute dont_touch_string : string;
  attribute dont_touch_string of Rx_Q_CombOut : signal is "true";
  attribute dont_touch_string of Rx_Q_Out : signal is "true";
begin
  Fifo_Empty(5 downto 4) <= \^fifo_empty\(5 downto 4);
  Fifo_Empty(3) <= \<const0>\;
  Fifo_Empty(2) <= \<const0>\;
  Fifo_Empty(1) <= \<const0>\;
  Fifo_Empty(0) <= \^fifo_empty\(0);
  Rx_CntValueOut(53 downto 36) <= \^rx_cntvalueout\(53 downto 36);
  Rx_CntValueOut(35) <= \<const0>\;
  Rx_CntValueOut(34) <= \<const0>\;
  Rx_CntValueOut(33) <= \<const0>\;
  Rx_CntValueOut(32) <= \<const0>\;
  Rx_CntValueOut(31) <= \<const0>\;
  Rx_CntValueOut(30) <= \<const0>\;
  Rx_CntValueOut(29) <= \<const0>\;
  Rx_CntValueOut(28) <= \<const0>\;
  Rx_CntValueOut(27) <= \<const0>\;
  Rx_CntValueOut(26) <= \<const0>\;
  Rx_CntValueOut(25) <= \<const0>\;
  Rx_CntValueOut(24) <= \<const0>\;
  Rx_CntValueOut(23) <= \<const0>\;
  Rx_CntValueOut(22) <= \<const0>\;
  Rx_CntValueOut(21) <= \<const0>\;
  Rx_CntValueOut(20) <= \<const0>\;
  Rx_CntValueOut(19) <= \<const0>\;
  Rx_CntValueOut(18) <= \<const0>\;
  Rx_CntValueOut(17) <= \<const0>\;
  Rx_CntValueOut(16) <= \<const0>\;
  Rx_CntValueOut(15) <= \<const0>\;
  Rx_CntValueOut(14) <= \<const0>\;
  Rx_CntValueOut(13) <= \<const0>\;
  Rx_CntValueOut(12) <= \<const0>\;
  Rx_CntValueOut(11) <= \<const0>\;
  Rx_CntValueOut(10) <= \<const0>\;
  Rx_CntValueOut(9) <= \<const0>\;
  Rx_CntValueOut(8 downto 0) <= \^rx_cntvalueout\(8 downto 0);
  Rx_CntValueOut_Ext(53 downto 36) <= \^rx_cntvalueout_ext\(53 downto 36);
  Rx_CntValueOut_Ext(35) <= \<const0>\;
  Rx_CntValueOut_Ext(34) <= \<const0>\;
  Rx_CntValueOut_Ext(33) <= \<const0>\;
  Rx_CntValueOut_Ext(32) <= \<const0>\;
  Rx_CntValueOut_Ext(31) <= \<const0>\;
  Rx_CntValueOut_Ext(30) <= \<const0>\;
  Rx_CntValueOut_Ext(29) <= \<const0>\;
  Rx_CntValueOut_Ext(28) <= \<const0>\;
  Rx_CntValueOut_Ext(27) <= \<const0>\;
  Rx_CntValueOut_Ext(26) <= \<const0>\;
  Rx_CntValueOut_Ext(25) <= \<const0>\;
  Rx_CntValueOut_Ext(24) <= \<const0>\;
  Rx_CntValueOut_Ext(23) <= \<const0>\;
  Rx_CntValueOut_Ext(22) <= \<const0>\;
  Rx_CntValueOut_Ext(21) <= \<const0>\;
  Rx_CntValueOut_Ext(20) <= \<const0>\;
  Rx_CntValueOut_Ext(19) <= \<const0>\;
  Rx_CntValueOut_Ext(18) <= \<const0>\;
  Rx_CntValueOut_Ext(17) <= \<const0>\;
  Rx_CntValueOut_Ext(16) <= \<const0>\;
  Rx_CntValueOut_Ext(15) <= \<const0>\;
  Rx_CntValueOut_Ext(14) <= \<const0>\;
  Rx_CntValueOut_Ext(13) <= \<const0>\;
  Rx_CntValueOut_Ext(12) <= \<const0>\;
  Rx_CntValueOut_Ext(11) <= \<const0>\;
  Rx_CntValueOut_Ext(10) <= \<const0>\;
  Rx_CntValueOut_Ext(9) <= \<const0>\;
  Rx_CntValueOut_Ext(8 downto 0) <= \^rx_cntvalueout_ext\(8 downto 0);
  Rx_Riu_Prsnt <= \<const1>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\Gen_1.Nibble_I_BitsliceCntrl\: unisim.vcomponents.BITSLICE_CONTROL
    generic map(
      CTRL_CLK => "EXTERNAL",
      DIV_MODE => "DIV2",
      EN_CLK_TO_EXT_NORTH => "DISABLE",
      EN_CLK_TO_EXT_SOUTH => "DISABLE",
      EN_DYN_ODLY_MODE => "FALSE",
      EN_OTHER_NCLK => "FALSE",
      EN_OTHER_PCLK => "FALSE",
      IDLY_VT_TRACK => "TRUE",
      INV_RXCLK => "FALSE",
      ODLY_VT_TRACK => "TRUE",
      QDLY_VT_TRACK => "TRUE",
      READ_IDLE_COUNT => B"00" & X"0",
      REFCLK_SRC => "PLLCLK",
      ROUNDING_FACTOR => 16,
      RXGATE_EXTEND => "FALSE",
      RX_CLK_PHASE_N => "SHIFT_90",
      RX_CLK_PHASE_P => "SHIFT_90",
      RX_GATING => "DISABLE",
      SELF_CALIBRATE => "ENABLE",
      SERIAL_MODE => "TRUE",
      SIM_DEVICE => "ULTRASCALE_PLUS_ES1",
      SIM_SPEEDUP => "FAST",
      SIM_VERSION => 2.000000,
      TX_GATING => "DISABLE"
    )
        port map (
      CLK_FROM_EXT => Rx_Clk_From_Ext,
      CLK_TO_EXT_NORTH => Rx_Clk_To_Ext_North,
      CLK_TO_EXT_SOUTH => Rx_Clk_To_Ext_South,
      DLY_RDY => Rx_Dly_Rdy,
      DYN_DCI(6 downto 0) => Rx_Dyn_Dci(6 downto 0),
      EN_VTC => Rx_Bsc_En_Vtc,
      NCLK_NIBBLE_IN => Rx_Nclk_Nibble_In,
      NCLK_NIBBLE_OUT => Rx_Nclk_Nibble_Out,
      PCLK_NIBBLE_IN => Rx_Pclk_Nibble_In,
      PCLK_NIBBLE_OUT => Rx_Pclk_Nibble_Out,
      PHY_RDCS0(3 downto 0) => B"0000",
      PHY_RDCS1(3 downto 0) => B"0000",
      PHY_RDEN(3 downto 0) => Rx_Phy_Rden(3 downto 0),
      PHY_WRCS0(3 downto 0) => B"0000",
      PHY_WRCS1(3 downto 0) => B"0000",
      PLL_CLK => Rx_Pll_Clk,
      REFCLK => Rx_RefClk,
      RIU_ADDR(5 downto 0) => Rx_Riu_Addr(5 downto 0),
      RIU_CLK => Rx_Riu_Clk,
      RIU_NIBBLE_SEL => Rx_Riu_Nibble_Sel,
      RIU_RD_DATA(15 downto 0) => Rx_Riu_Rd_Data(15 downto 0),
      RIU_VALID => Rx_Riu_Valid,
      RIU_WR_DATA(15 downto 0) => Rx_Riu_Wr_Data(15 downto 0),
      RIU_WR_EN => Rx_Riu_Wr_En,
      RST => Rx_Bsc_Rst,
      RX_BIT_CTRL_IN0(39 downto 0) => IntBtslcCtrl_RxBitCtrlIn(39 downto 0),
      RX_BIT_CTRL_IN1(39 downto 0) => B"0000000000000000000000000000000000000000",
      RX_BIT_CTRL_IN2(39 downto 0) => B"0000000000000000000000000000000000000000",
      RX_BIT_CTRL_IN3(39 downto 0) => B"0000000000000000000000000000000000000000",
      RX_BIT_CTRL_IN4(39 downto 0) => IntBtslcCtrl_RxBitCtrlIn(199 downto 160),
      RX_BIT_CTRL_IN5(39 downto 0) => IntBtslcCtrl_RxBitCtrlIn(239 downto 200),
      RX_BIT_CTRL_IN6(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_IN6_UNCONNECTED\(39 downto 0),
      RX_BIT_CTRL_OUT0(39 downto 0) => IntBtslcCtrl_RxBitCtrlOut_0(39 downto 0),
      RX_BIT_CTRL_OUT1(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT1_UNCONNECTED\(39 downto 0),
      RX_BIT_CTRL_OUT2(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT2_UNCONNECTED\(39 downto 0),
      RX_BIT_CTRL_OUT3(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT3_UNCONNECTED\(39 downto 0),
      RX_BIT_CTRL_OUT4(39 downto 0) => IntBtslcCtrl_RxBitCtrlOut_160(39 downto 0),
      RX_BIT_CTRL_OUT5(39 downto 0) => IntBtslcCtrl_RxBitCtrlOut_200(39 downto 0),
      RX_BIT_CTRL_OUT6(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT6_UNCONNECTED\(39 downto 0),
      TBYTE_IN(3 downto 0) => Rx_Tbyte_In(3 downto 0),
      TX_BIT_CTRL_IN0(39 downto 0) => IntBtslcCtrl_TxBitCtrlIn(39 downto 0),
      TX_BIT_CTRL_IN1(39 downto 0) => B"0000000000000000000000000000000000000000",
      TX_BIT_CTRL_IN2(39 downto 0) => B"0000000000000000000000000000000000000000",
      TX_BIT_CTRL_IN3(39 downto 0) => B"0000000000000000000000000000000000000000",
      TX_BIT_CTRL_IN4(39 downto 0) => IntBtslcCtrl_TxBitCtrlIn(199 downto 160),
      TX_BIT_CTRL_IN5(39 downto 0) => IntBtslcCtrl_TxBitCtrlIn(239 downto 200),
      TX_BIT_CTRL_IN6(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_IN6_UNCONNECTED\(39 downto 0),
      TX_BIT_CTRL_IN_TRI(39 downto 0) => B"0000000000000000000000000000000000000000",
      TX_BIT_CTRL_OUT0(39 downto 0) => IntBtslcCtrl_TxBitCtrlOut_0(39 downto 0),
      TX_BIT_CTRL_OUT1(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT1_UNCONNECTED\(39 downto 0),
      TX_BIT_CTRL_OUT2(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT2_UNCONNECTED\(39 downto 0),
      TX_BIT_CTRL_OUT3(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT3_UNCONNECTED\(39 downto 0),
      TX_BIT_CTRL_OUT4(39 downto 0) => IntBtslcCtrl_TxBitCtrlOut_160(39 downto 0),
      TX_BIT_CTRL_OUT5(39 downto 0) => IntBtslcCtrl_TxBitCtrlOut_200(39 downto 0),
      TX_BIT_CTRL_OUT6(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT6_UNCONNECTED\(39 downto 0),
      TX_BIT_CTRL_OUT_TRI(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT_TRI_UNCONNECTED\(39 downto 0),
      VTC_RDY => Rx_Vtc_Rdy
    );
\Gen_5[1].Gen_5_1.Gen_5_1_1.Nibble_I_RxBitslice_0\: unisim.vcomponents.RX_BITSLICE
    generic map(
      CASCADE => "FALSE",
      DATA_TYPE => "SERIAL",
      DATA_WIDTH => 4,
      DELAY_FORMAT => "COUNT",
      DELAY_TYPE => "VAR_LOAD",
      DELAY_VALUE => 0,
      DELAY_VALUE_EXT => 0,
      FIFO_SYNC_MODE => "FALSE",
      IS_CLK_EXT_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_RST_DLY_EXT_INVERTED => '0',
      IS_RST_DLY_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REFCLK_FREQUENCY => 312.500000,
      SIM_DEVICE => "ULTRASCALE_PLUS_ES1",
      SIM_VERSION => 2.000000,
      UPDATE_MODE => "ASYNC",
      UPDATE_MODE_EXT => "ASYNC"
    )
        port map (
      CE => Rx_Ce(0),
      CE_EXT => Rx_Ce_Ext(0),
      CLK => Rx_Clk,
      CLK_EXT => Rx_Clk,
      CNTVALUEIN(8 downto 0) => Rx_CntValueIn(8 downto 0),
      CNTVALUEIN_EXT(8 downto 0) => Rx_CntValueIn_Ext(8 downto 0),
      CNTVALUEOUT(8 downto 0) => \^rx_cntvalueout\(8 downto 0),
      CNTVALUEOUT_EXT(8 downto 0) => \^rx_cntvalueout_ext\(8 downto 0),
      DATAIN => Rx_Data_In(0),
      EN_VTC => Rx_Bs_En_Vtc,
      EN_VTC_EXT => Rx_Bs_En_Vtc,
      FIFO_EMPTY => \^fifo_empty\(0),
      FIFO_RD_CLK => Fifo_Rd_Clk(0),
      FIFO_RD_EN => Fifo_Rd_En(0),
      FIFO_WRCLK_OUT => Fifo_Wrclk_Out,
      INC => Rx_Inc(0),
      INC_EXT => Rx_Inc_Ext(0),
      LOAD => Rx_Load(0),
      LOAD_EXT => Rx_Load_Ext(0),
      Q(7 downto 6) => \NLW_Gen_5[1].Gen_5_1.Gen_5_1_1.Nibble_I_RxBitslice_0_Q_UNCONNECTED\(7 downto 6),
      Q(5) => Rx_Q_CombOut(0),
      Q(4) => \NLW_Gen_5[1].Gen_5_1.Gen_5_1_1.Nibble_I_RxBitslice_0_Q_UNCONNECTED\(4),
      Q(3 downto 0) => Rx_Q_Out(3 downto 0),
      RST => Rx_Bs_Rst,
      RST_DLY => Rx_Rst_Dly,
      RST_DLY_EXT => Rx_Rst_Dly,
      RX_BIT_CTRL_IN(39 downto 0) => IntBtslcCtrl_RxBitCtrlOut_0(39 downto 0),
      RX_BIT_CTRL_OUT(39 downto 0) => IntBtslcCtrl_RxBitCtrlIn(39 downto 0),
      TX_BIT_CTRL_IN(39 downto 0) => IntBtslcCtrl_TxBitCtrlOut_0(39 downto 0),
      TX_BIT_CTRL_OUT(39 downto 0) => IntBtslcCtrl_TxBitCtrlIn(39 downto 0)
    );
\Gen_5[5].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n\: unisim.vcomponents.RX_BITSLICE
    generic map(
      CASCADE => "FALSE",
      DATA_TYPE => "SERIAL",
      DATA_WIDTH => 4,
      DELAY_FORMAT => "COUNT",
      DELAY_TYPE => "VAR_LOAD",
      DELAY_VALUE => 0,
      DELAY_VALUE_EXT => 0,
      FIFO_SYNC_MODE => "FALSE",
      IS_CLK_EXT_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_RST_DLY_EXT_INVERTED => '0',
      IS_RST_DLY_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REFCLK_FREQUENCY => 312.500000,
      SIM_DEVICE => "ULTRASCALE_PLUS_ES1",
      SIM_VERSION => 2.000000,
      UPDATE_MODE => "ASYNC",
      UPDATE_MODE_EXT => "ASYNC"
    )
        port map (
      CE => Rx_Ce(4),
      CE_EXT => Rx_Ce_Ext(4),
      CLK => Rx_Clk,
      CLK_EXT => Rx_Clk,
      CNTVALUEIN(8 downto 0) => Rx_CntValueIn(44 downto 36),
      CNTVALUEIN_EXT(8 downto 0) => Rx_CntValueIn_Ext(44 downto 36),
      CNTVALUEOUT(8 downto 0) => \^rx_cntvalueout\(44 downto 36),
      CNTVALUEOUT_EXT(8 downto 0) => \^rx_cntvalueout_ext\(44 downto 36),
      DATAIN => Rx_Data_In(4),
      EN_VTC => Rx_Bs_En_Vtc,
      EN_VTC_EXT => Rx_Bs_En_Vtc,
      FIFO_EMPTY => \^fifo_empty\(4),
      FIFO_RD_CLK => Fifo_Rd_Clk(4),
      FIFO_RD_EN => Fifo_Rd_En(4),
      FIFO_WRCLK_OUT => \NLW_Gen_5[5].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_FIFO_WRCLK_OUT_UNCONNECTED\,
      INC => Rx_Inc(4),
      INC_EXT => Rx_Inc_Ext(4),
      LOAD => Rx_Load(4),
      LOAD_EXT => Rx_Load_Ext(4),
      Q(7 downto 6) => \NLW_Gen_5[5].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_Q_UNCONNECTED\(7 downto 6),
      Q(5) => Rx_Q_CombOut(4),
      Q(4) => \NLW_Gen_5[5].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_Q_UNCONNECTED\(4),
      Q(3 downto 0) => Rx_Q_Out(19 downto 16),
      RST => Rx_Bs_Rst,
      RST_DLY => Rx_Rst_Dly,
      RST_DLY_EXT => Rx_Rst_Dly,
      RX_BIT_CTRL_IN(39 downto 0) => IntBtslcCtrl_RxBitCtrlOut_160(39 downto 0),
      RX_BIT_CTRL_OUT(39 downto 0) => IntBtslcCtrl_RxBitCtrlIn(199 downto 160),
      TX_BIT_CTRL_IN(39 downto 0) => IntBtslcCtrl_TxBitCtrlOut_160(39 downto 0),
      TX_BIT_CTRL_OUT(39 downto 0) => IntBtslcCtrl_TxBitCtrlIn(199 downto 160)
    );
\Gen_5[6].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n\: unisim.vcomponents.RX_BITSLICE
    generic map(
      CASCADE => "FALSE",
      DATA_TYPE => "SERIAL",
      DATA_WIDTH => 4,
      DELAY_FORMAT => "COUNT",
      DELAY_TYPE => "VAR_LOAD",
      DELAY_VALUE => 0,
      DELAY_VALUE_EXT => 0,
      FIFO_SYNC_MODE => "FALSE",
      IS_CLK_EXT_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_RST_DLY_EXT_INVERTED => '0',
      IS_RST_DLY_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REFCLK_FREQUENCY => 312.500000,
      SIM_DEVICE => "ULTRASCALE_PLUS_ES1",
      SIM_VERSION => 2.000000,
      UPDATE_MODE => "ASYNC",
      UPDATE_MODE_EXT => "ASYNC"
    )
        port map (
      CE => Rx_Ce(5),
      CE_EXT => Rx_Ce_Ext(5),
      CLK => Rx_Clk,
      CLK_EXT => Rx_Clk,
      CNTVALUEIN(8 downto 0) => Rx_CntValueIn(53 downto 45),
      CNTVALUEIN_EXT(8 downto 0) => Rx_CntValueIn_Ext(53 downto 45),
      CNTVALUEOUT(8 downto 0) => \^rx_cntvalueout\(53 downto 45),
      CNTVALUEOUT_EXT(8 downto 0) => \^rx_cntvalueout_ext\(53 downto 45),
      DATAIN => Rx_Data_In(5),
      EN_VTC => Rx_Bs_En_Vtc,
      EN_VTC_EXT => Rx_Bs_En_Vtc,
      FIFO_EMPTY => \^fifo_empty\(5),
      FIFO_RD_CLK => Fifo_Rd_Clk(5),
      FIFO_RD_EN => Fifo_Rd_En(5),
      FIFO_WRCLK_OUT => \NLW_Gen_5[6].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_FIFO_WRCLK_OUT_UNCONNECTED\,
      INC => Rx_Inc(5),
      INC_EXT => Rx_Inc_Ext(5),
      LOAD => Rx_Load(5),
      LOAD_EXT => Rx_Load_Ext(5),
      Q(7 downto 6) => \NLW_Gen_5[6].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_Q_UNCONNECTED\(7 downto 6),
      Q(5) => Rx_Q_CombOut(5),
      Q(4) => \NLW_Gen_5[6].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_Q_UNCONNECTED\(4),
      Q(3 downto 0) => Rx_Q_Out(23 downto 20),
      RST => Rx_Bs_Rst,
      RST_DLY => Rx_Rst_Dly,
      RST_DLY_EXT => Rx_Rst_Dly,
      RX_BIT_CTRL_IN(39 downto 0) => IntBtslcCtrl_RxBitCtrlOut_200(39 downto 0),
      RX_BIT_CTRL_OUT(39 downto 0) => IntBtslcCtrl_RxBitCtrlIn(239 downto 200),
      TX_BIT_CTRL_IN(39 downto 0) => IntBtslcCtrl_TxBitCtrlOut_200(39 downto 0),
      TX_BIT_CTRL_OUT(39 downto 0) => IntBtslcCtrl_TxBitCtrlIn(239 downto 200)
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(15)
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(14)
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(5)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(4)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_CombOut(3)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_CombOut(2)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_CombOut(1)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(13)
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(12)
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(11)
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(10)
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(9)
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(8)
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(7)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => Rx_Q_Out(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble is
  port (
    Tx_Bsc_Rst : in STD_LOGIC;
    Tx_Bs_Rst : in STD_LOGIC;
    Tx_Rst_Dly : in STD_LOGIC;
    Tx_Bsc_En_Vtc : in STD_LOGIC;
    Tx_Bs_En_Vtc : in STD_LOGIC;
    Tx_Riu_Clk : in STD_LOGIC;
    Tx_Riu_Addr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Tx_Riu_Wr_Data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Tx_Riu_Rd_Data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Tx_Riu_Valid : out STD_LOGIC;
    Tx_Riu_Wr_En : in STD_LOGIC;
    Tx_Riu_Nibble_Sel : in STD_LOGIC;
    Tx_Pll_Clk : in STD_LOGIC;
    Tx_RefClk : in STD_LOGIC;
    Tx_Dly_Rdy : out STD_LOGIC;
    Tx_Vtc_Rdy : out STD_LOGIC;
    Tx_Dyn_Dci : out STD_LOGIC_VECTOR ( 6 downto 0 );
    Tx_Tbyte_In : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Tx_Phy_Rden : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Tx_Clk_From_Ext : in STD_LOGIC;
    Tx_Pclk_Nibble_In : in STD_LOGIC;
    Tx_Nclk_Nibble_In : in STD_LOGIC;
    Tx_Nclk_Nibble_Out : out STD_LOGIC;
    Tx_Pclk_Nibble_Out : out STD_LOGIC;
    Tx_Clk_To_Ext_North : out STD_LOGIC;
    Tx_Clk_To_Ext_South : out STD_LOGIC;
    Tx_Tri_Out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    Tx_Data_Out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    Tx_T_In : in STD_LOGIC_VECTOR ( 6 downto 0 );
    Tx_D_In : in STD_LOGIC_VECTOR ( 55 downto 0 );
    Tx_Ce : in STD_LOGIC_VECTOR ( 6 downto 0 );
    Tx_Clk : in STD_LOGIC;
    Tx_Inc : in STD_LOGIC_VECTOR ( 6 downto 0 );
    Tx_Load : in STD_LOGIC_VECTOR ( 6 downto 0 );
    Tx_CntValueIn : in STD_LOGIC_VECTOR ( 62 downto 0 );
    Tx_CntValueOut : out STD_LOGIC_VECTOR ( 62 downto 0 );
    TxTri_Ce : in STD_LOGIC;
    TxTri_Clk : in STD_LOGIC;
    TxTri_Inc : in STD_LOGIC;
    TxTri_Load : in STD_LOGIC;
    TxTri_CntValueIn : in STD_LOGIC_VECTOR ( 8 downto 0 );
    TxTri_CntValueOut : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute C_BtslceUsedAsT : string;
  attribute C_BtslceUsedAsT of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "7'b0000000";
  attribute C_BusRxBitCtrlIn : integer;
  attribute C_BusRxBitCtrlIn of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 40;
  attribute C_BusRxBitCtrlOut : integer;
  attribute C_BusRxBitCtrlOut of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 40;
  attribute C_BusTxBitCtrlIn : integer;
  attribute C_BusTxBitCtrlIn of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 40;
  attribute C_BusTxBitCtrlInTri : integer;
  attribute C_BusTxBitCtrlInTri of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 40;
  attribute C_BusTxBitCtrlOut : integer;
  attribute C_BusTxBitCtrlOut of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 40;
  attribute C_BusTxBitCtrlOutTri : integer;
  attribute C_BusTxBitCtrlOutTri of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 40;
  attribute C_BytePosition : integer;
  attribute C_BytePosition of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 0;
  attribute C_CntValue : integer;
  attribute C_CntValue of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 9;
  attribute C_Ctrl_Clk : string;
  attribute C_Ctrl_Clk of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "EXTERNAL";
  attribute C_Data_Type : string;
  attribute C_Data_Type of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "DATA";
  attribute C_Delay_Format : string;
  attribute C_Delay_Format of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "TIME";
  attribute C_Delay_Type : string;
  attribute C_Delay_Type of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FIXED";
  attribute C_Delay_Value : integer;
  attribute C_Delay_Value of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 0;
  attribute C_Div_Mode : string;
  attribute C_Div_Mode of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "DIV4";
  attribute C_En_Clk_To_Ext_North : string;
  attribute C_En_Clk_To_Ext_North of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "DISABLE";
  attribute C_En_Clk_To_Ext_South : string;
  attribute C_En_Clk_To_Ext_South of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "DISABLE";
  attribute C_En_Dyn_Odly_Mode : string;
  attribute C_En_Dyn_Odly_Mode of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FALSE";
  attribute C_En_Other_Nclk : string;
  attribute C_En_Other_Nclk of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FALSE";
  attribute C_En_Other_Pclk : string;
  attribute C_En_Other_Pclk of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FALSE";
  attribute C_Enable_Pre_Emphasis : string;
  attribute C_Enable_Pre_Emphasis of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FALSE";
  attribute C_Idly_Vt_Track : string;
  attribute C_Idly_Vt_Track of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FALSE";
  attribute C_Init : string;
  attribute C_Init of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "1'b0";
  attribute C_Inv_Rxclk : string;
  attribute C_Inv_Rxclk of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FALSE";
  attribute C_IoBank : integer;
  attribute C_IoBank of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 44;
  attribute C_Is_Clk_Inverted : string;
  attribute C_Is_Clk_Inverted of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "1'b0";
  attribute C_Is_Rst_Dly_Inverted : string;
  attribute C_Is_Rst_Dly_Inverted of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "1'b0";
  attribute C_Is_Rst_Inverted : string;
  attribute C_Is_Rst_Inverted of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "1'b0";
  attribute C_Native_Odelay_Bypass : string;
  attribute C_Native_Odelay_Bypass of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FALSE";
  attribute C_NibbleType : integer;
  attribute C_NibbleType of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 7;
  attribute C_Odly_Vt_Track : string;
  attribute C_Odly_Vt_Track of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FALSE";
  attribute C_Output_Phase_90 : string;
  attribute C_Output_Phase_90 of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "TRUE";
  attribute C_Part : string;
  attribute C_Part of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "XCKU060";
  attribute C_Qdly_Vt_Track : string;
  attribute C_Qdly_Vt_Track of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FALSE";
  attribute C_Read_Idle_Count : string;
  attribute C_Read_Idle_Count of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "6'b000000";
  attribute C_RefClk_Frequency : string;
  attribute C_RefClk_Frequency of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "1250.000000";
  attribute C_RefClk_Src : string;
  attribute C_RefClk_Src of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "PLLCLK";
  attribute C_Rounding_Factor : integer;
  attribute C_Rounding_Factor of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 16;
  attribute C_RxGate_Extend : string;
  attribute C_RxGate_Extend of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FALSE";
  attribute C_Rx_Clk_Phase_n : string;
  attribute C_Rx_Clk_Phase_n of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "SHIFT_0";
  attribute C_Rx_Clk_Phase_p : string;
  attribute C_Rx_Clk_Phase_p of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "SHIFT_0";
  attribute C_Rx_Gating : string;
  attribute C_Rx_Gating of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "DISABLE";
  attribute C_Self_Calibrate : string;
  attribute C_Self_Calibrate of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "ENABLE";
  attribute C_Serial_Mode : string;
  attribute C_Serial_Mode of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "FALSE";
  attribute C_Tx_BtslceTr : string;
  attribute C_Tx_BtslceTr of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "T";
  attribute C_Tx_Data_Width : integer;
  attribute C_Tx_Data_Width of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is 8;
  attribute C_Tx_Gating : string;
  attribute C_Tx_Gating of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "ENABLE";
  attribute C_Update_Mode : string;
  attribute C_Update_Mode of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "ASYNC";
  attribute C_UsedBitslices : string;
  attribute C_UsedBitslices of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "7'b0000100";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble : entity is "gig_ethernet_pcs_pma_0_Tx_Nibble";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble is
  signal \<const0>\ : STD_LOGIC;
  signal RX_BIT_CTRL_IN : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal RX_BIT_CTRL_IN2 : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal TX_BIT_CTRL_IN : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal TX_BIT_CTRL_IN2 : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \^tx_cntvalueout\ : STD_LOGIC_VECTOR ( 26 downto 18 );
  signal \^tx_data_out\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \^tx_tri_out\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT0_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT1_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT3_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT4_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT5_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT6_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT0_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT1_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT3_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT4_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT5_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT6_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT_TRI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  attribute box_type : string;
  attribute box_type of \Gen_1.Nibble_I_BitsliceCntrl\ : label is "PRIMITIVE";
  attribute box_type of \Gen_7[3].Gen_7_1.Nibble_I_TxBitslice\ : label is "PRIMITIVE";
begin
  TxTri_CntValueOut(8) <= \<const0>\;
  TxTri_CntValueOut(7) <= \<const0>\;
  TxTri_CntValueOut(6) <= \<const0>\;
  TxTri_CntValueOut(5) <= \<const0>\;
  TxTri_CntValueOut(4) <= \<const0>\;
  TxTri_CntValueOut(3) <= \<const0>\;
  TxTri_CntValueOut(2) <= \<const0>\;
  TxTri_CntValueOut(1) <= \<const0>\;
  TxTri_CntValueOut(0) <= \<const0>\;
  Tx_CntValueOut(62) <= \<const0>\;
  Tx_CntValueOut(61) <= \<const0>\;
  Tx_CntValueOut(60) <= \<const0>\;
  Tx_CntValueOut(59) <= \<const0>\;
  Tx_CntValueOut(58) <= \<const0>\;
  Tx_CntValueOut(57) <= \<const0>\;
  Tx_CntValueOut(56) <= \<const0>\;
  Tx_CntValueOut(55) <= \<const0>\;
  Tx_CntValueOut(54) <= \<const0>\;
  Tx_CntValueOut(53) <= \<const0>\;
  Tx_CntValueOut(52) <= \<const0>\;
  Tx_CntValueOut(51) <= \<const0>\;
  Tx_CntValueOut(50) <= \<const0>\;
  Tx_CntValueOut(49) <= \<const0>\;
  Tx_CntValueOut(48) <= \<const0>\;
  Tx_CntValueOut(47) <= \<const0>\;
  Tx_CntValueOut(46) <= \<const0>\;
  Tx_CntValueOut(45) <= \<const0>\;
  Tx_CntValueOut(44) <= \<const0>\;
  Tx_CntValueOut(43) <= \<const0>\;
  Tx_CntValueOut(42) <= \<const0>\;
  Tx_CntValueOut(41) <= \<const0>\;
  Tx_CntValueOut(40) <= \<const0>\;
  Tx_CntValueOut(39) <= \<const0>\;
  Tx_CntValueOut(38) <= \<const0>\;
  Tx_CntValueOut(37) <= \<const0>\;
  Tx_CntValueOut(36) <= \<const0>\;
  Tx_CntValueOut(35) <= \<const0>\;
  Tx_CntValueOut(34) <= \<const0>\;
  Tx_CntValueOut(33) <= \<const0>\;
  Tx_CntValueOut(32) <= \<const0>\;
  Tx_CntValueOut(31) <= \<const0>\;
  Tx_CntValueOut(30) <= \<const0>\;
  Tx_CntValueOut(29) <= \<const0>\;
  Tx_CntValueOut(28) <= \<const0>\;
  Tx_CntValueOut(27) <= \<const0>\;
  Tx_CntValueOut(26 downto 18) <= \^tx_cntvalueout\(26 downto 18);
  Tx_CntValueOut(17) <= \<const0>\;
  Tx_CntValueOut(16) <= \<const0>\;
  Tx_CntValueOut(15) <= \<const0>\;
  Tx_CntValueOut(14) <= \<const0>\;
  Tx_CntValueOut(13) <= \<const0>\;
  Tx_CntValueOut(12) <= \<const0>\;
  Tx_CntValueOut(11) <= \<const0>\;
  Tx_CntValueOut(10) <= \<const0>\;
  Tx_CntValueOut(9) <= \<const0>\;
  Tx_CntValueOut(8) <= \<const0>\;
  Tx_CntValueOut(7) <= \<const0>\;
  Tx_CntValueOut(6) <= \<const0>\;
  Tx_CntValueOut(5) <= \<const0>\;
  Tx_CntValueOut(4) <= \<const0>\;
  Tx_CntValueOut(3) <= \<const0>\;
  Tx_CntValueOut(2) <= \<const0>\;
  Tx_CntValueOut(1) <= \<const0>\;
  Tx_CntValueOut(0) <= \<const0>\;
  Tx_Data_Out(6) <= \<const0>\;
  Tx_Data_Out(5) <= \<const0>\;
  Tx_Data_Out(4) <= \<const0>\;
  Tx_Data_Out(3) <= \<const0>\;
  Tx_Data_Out(2) <= \^tx_data_out\(2);
  Tx_Data_Out(1) <= \<const0>\;
  Tx_Data_Out(0) <= \<const0>\;
  Tx_Tri_Out(6) <= \<const0>\;
  Tx_Tri_Out(5) <= \<const0>\;
  Tx_Tri_Out(4) <= \<const0>\;
  Tx_Tri_Out(3) <= \<const0>\;
  Tx_Tri_Out(2) <= \^tx_tri_out\(2);
  Tx_Tri_Out(1) <= \<const0>\;
  Tx_Tri_Out(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\Gen_1.Nibble_I_BitsliceCntrl\: unisim.vcomponents.BITSLICE_CONTROL
    generic map(
      CTRL_CLK => "EXTERNAL",
      DIV_MODE => "DIV4",
      EN_CLK_TO_EXT_NORTH => "DISABLE",
      EN_CLK_TO_EXT_SOUTH => "DISABLE",
      EN_DYN_ODLY_MODE => "FALSE",
      EN_OTHER_NCLK => "FALSE",
      EN_OTHER_PCLK => "FALSE",
      IDLY_VT_TRACK => "FALSE",
      INV_RXCLK => "FALSE",
      ODLY_VT_TRACK => "FALSE",
      QDLY_VT_TRACK => "FALSE",
      READ_IDLE_COUNT => B"00" & X"0",
      REFCLK_SRC => "PLLCLK",
      ROUNDING_FACTOR => 16,
      RXGATE_EXTEND => "FALSE",
      RX_CLK_PHASE_N => "SHIFT_0",
      RX_CLK_PHASE_P => "SHIFT_0",
      RX_GATING => "DISABLE",
      SELF_CALIBRATE => "ENABLE",
      SERIAL_MODE => "FALSE",
      SIM_DEVICE => "ULTRASCALE_PLUS_ES1",
      SIM_SPEEDUP => "FAST",
      SIM_VERSION => 2.000000,
      TX_GATING => "ENABLE"
    )
        port map (
      CLK_FROM_EXT => Tx_Clk_From_Ext,
      CLK_TO_EXT_NORTH => Tx_Clk_To_Ext_North,
      CLK_TO_EXT_SOUTH => Tx_Clk_To_Ext_South,
      DLY_RDY => Tx_Dly_Rdy,
      DYN_DCI(6 downto 0) => Tx_Dyn_Dci(6 downto 0),
      EN_VTC => Tx_Bsc_En_Vtc,
      NCLK_NIBBLE_IN => Tx_Nclk_Nibble_In,
      NCLK_NIBBLE_OUT => Tx_Nclk_Nibble_Out,
      PCLK_NIBBLE_IN => Tx_Pclk_Nibble_In,
      PCLK_NIBBLE_OUT => Tx_Pclk_Nibble_Out,
      PHY_RDCS0(3 downto 0) => B"0000",
      PHY_RDCS1(3 downto 0) => B"0000",
      PHY_RDEN(3 downto 0) => B"0000",
      PHY_WRCS0(3 downto 0) => B"0000",
      PHY_WRCS1(3 downto 0) => B"0000",
      PLL_CLK => Tx_Pll_Clk,
      REFCLK => Tx_RefClk,
      RIU_ADDR(5 downto 0) => Tx_Riu_Addr(5 downto 0),
      RIU_CLK => Tx_Riu_Clk,
      RIU_NIBBLE_SEL => Tx_Riu_Nibble_Sel,
      RIU_RD_DATA(15 downto 0) => Tx_Riu_Rd_Data(15 downto 0),
      RIU_VALID => Tx_Riu_Valid,
      RIU_WR_DATA(15 downto 0) => Tx_Riu_Wr_Data(15 downto 0),
      RIU_WR_EN => Tx_Riu_Wr_En,
      RST => Tx_Bsc_Rst,
      RX_BIT_CTRL_IN0(39 downto 0) => B"0000000000000000000000000000000000000000",
      RX_BIT_CTRL_IN1(39 downto 0) => B"0000000000000000000000000000000000000000",
      RX_BIT_CTRL_IN2(39 downto 0) => RX_BIT_CTRL_IN2(39 downto 0),
      RX_BIT_CTRL_IN3(39 downto 0) => B"0000000000000000000000000000000000000000",
      RX_BIT_CTRL_IN4(39 downto 0) => B"0000000000000000000000000000000000000000",
      RX_BIT_CTRL_IN5(39 downto 0) => B"0000000000000000000000000000000000000000",
      RX_BIT_CTRL_IN6(39 downto 0) => B"0000000000000000000000000000000000000000",
      RX_BIT_CTRL_OUT0(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT0_UNCONNECTED\(39 downto 0),
      RX_BIT_CTRL_OUT1(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT1_UNCONNECTED\(39 downto 0),
      RX_BIT_CTRL_OUT2(39 downto 0) => RX_BIT_CTRL_IN(39 downto 0),
      RX_BIT_CTRL_OUT3(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT3_UNCONNECTED\(39 downto 0),
      RX_BIT_CTRL_OUT4(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT4_UNCONNECTED\(39 downto 0),
      RX_BIT_CTRL_OUT5(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT5_UNCONNECTED\(39 downto 0),
      RX_BIT_CTRL_OUT6(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT6_UNCONNECTED\(39 downto 0),
      TBYTE_IN(3 downto 0) => Tx_Tbyte_In(3 downto 0),
      TX_BIT_CTRL_IN0(39 downto 0) => B"0000000000000000000000000000000000000000",
      TX_BIT_CTRL_IN1(39 downto 0) => B"0000000000000000000000000000000000000000",
      TX_BIT_CTRL_IN2(39 downto 0) => TX_BIT_CTRL_IN2(39 downto 0),
      TX_BIT_CTRL_IN3(39 downto 0) => B"0000000000000000000000000000000000000000",
      TX_BIT_CTRL_IN4(39 downto 0) => B"0000000000000000000000000000000000000000",
      TX_BIT_CTRL_IN5(39 downto 0) => B"0000000000000000000000000000000000000000",
      TX_BIT_CTRL_IN6(39 downto 0) => B"0000000000000000000000000000000000000000",
      TX_BIT_CTRL_IN_TRI(39 downto 0) => B"0000000000000000000000000000000000000000",
      TX_BIT_CTRL_OUT0(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT0_UNCONNECTED\(39 downto 0),
      TX_BIT_CTRL_OUT1(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT1_UNCONNECTED\(39 downto 0),
      TX_BIT_CTRL_OUT2(39 downto 0) => TX_BIT_CTRL_IN(39 downto 0),
      TX_BIT_CTRL_OUT3(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT3_UNCONNECTED\(39 downto 0),
      TX_BIT_CTRL_OUT4(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT4_UNCONNECTED\(39 downto 0),
      TX_BIT_CTRL_OUT5(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT5_UNCONNECTED\(39 downto 0),
      TX_BIT_CTRL_OUT6(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT6_UNCONNECTED\(39 downto 0),
      TX_BIT_CTRL_OUT_TRI(39 downto 0) => \NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT_TRI_UNCONNECTED\(39 downto 0),
      VTC_RDY => Tx_Vtc_Rdy
    );
\Gen_7[3].Gen_7_1.Nibble_I_TxBitslice\: unisim.vcomponents.TX_BITSLICE
    generic map(
      DATA_WIDTH => 8,
      DELAY_FORMAT => "TIME",
      DELAY_TYPE => "FIXED",
      DELAY_VALUE => 0,
      ENABLE_PRE_EMPHASIS => "FALSE",
      INIT => '0',
      IS_CLK_INVERTED => '0',
      IS_RST_DLY_INVERTED => '0',
      IS_RST_INVERTED => '0',
      NATIVE_ODELAY_BYPASS => "FALSE",
      OUTPUT_PHASE_90 => "TRUE",
      REFCLK_FREQUENCY => 1250.000000,
      SIM_DEVICE => "ULTRASCALE_PLUS_ES1",
      SIM_VERSION => 2.000000,
      TBYTE_CTL => "T",
      UPDATE_MODE => "ASYNC"
    )
        port map (
      CE => Tx_Ce(2),
      CLK => Tx_Clk,
      CNTVALUEIN(8 downto 0) => Tx_CntValueIn(26 downto 18),
      CNTVALUEOUT(8 downto 0) => \^tx_cntvalueout\(26 downto 18),
      D(7 downto 0) => Tx_D_In(23 downto 16),
      EN_VTC => Tx_Bs_En_Vtc,
      INC => Tx_Inc(2),
      LOAD => Tx_Load(2),
      O => \^tx_data_out\(2),
      RST => Tx_Bs_Rst,
      RST_DLY => Tx_Rst_Dly,
      RX_BIT_CTRL_IN(39 downto 0) => RX_BIT_CTRL_IN(39 downto 0),
      RX_BIT_CTRL_OUT(39 downto 0) => RX_BIT_CTRL_IN2(39 downto 0),
      T => Tx_T_In(2),
      TBYTE_IN => '0',
      TX_BIT_CTRL_IN(39 downto 0) => TX_BIT_CTRL_IN(39 downto 0),
      TX_BIT_CTRL_OUT(39 downto 0) => TX_BIT_CTRL_IN2(39 downto 0),
      T_OUT => \^tx_tri_out\(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_decode_8b10b_lut_base is
  port (
    D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    k : in STD_LOGIC;
    Rx_SysClk : in STD_LOGIC;
    code_err_i : in STD_LOGIC;
    \grdni.run_disp_i_reg_0\ : in STD_LOGIC;
    \gdeni.disp_err_reg_0\ : in STD_LOGIC;
    b3 : in STD_LOGIC_VECTOR ( 7 downto 5 );
    \out\ : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_decode_8b10b_lut_base : entity is "gig_ethernet_pcs_pma_0_decode_8b10b_lut_base";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_decode_8b10b_lut_base;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_decode_8b10b_lut_base is
begin
\dout_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \out\(0),
      Q => D(0),
      R => '0'
    );
\dout_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \out\(1),
      Q => D(1),
      R => '0'
    );
\dout_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \out\(2),
      Q => D(2),
      R => '0'
    );
\dout_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \out\(3),
      Q => D(3),
      R => '0'
    );
\dout_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \out\(4),
      Q => D(4),
      R => '0'
    );
\dout_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => b3(5),
      Q => D(5),
      R => '0'
    );
\dout_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => b3(6),
      Q => D(6),
      R => '0'
    );
\dout_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => b3(7),
      Q => D(7),
      R => '0'
    );
\gcerr.code_err_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => code_err_i,
      Q => D(9),
      R => '0'
    );
\gdeni.disp_err_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \gdeni.disp_err_reg_0\,
      Q => D(10),
      R => '0'
    );
\grdni.run_disp_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \grdni.run_disp_i_reg_0\,
      Q => D(8),
      R => '0'
    );
kout_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => E(0),
      D => k,
      Q => D(11),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_encode_8b10b_lut_base is
  port (
    tx_data_10b : out STD_LOGIC_VECTOR ( 9 downto 0 );
    Tx_WrClk : in STD_LOGIC;
    txchardispval : in STD_LOGIC;
    txchardispmode : in STD_LOGIC;
    txdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txcharisk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_encode_8b10b_lut_base : entity is "gig_ethernet_pcs_pma_0_encode_8b10b_lut_base";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_encode_8b10b_lut_base;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_encode_8b10b_lut_base is
  signal b4 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal b6 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \disp_in_i__0\ : STD_LOGIC;
  signal \dout[0]_i_1_n_0\ : STD_LOGIC;
  signal \dout[1]_i_1_n_0\ : STD_LOGIC;
  signal \dout[2]_i_1_n_0\ : STD_LOGIC;
  signal \dout[3]_i_1_n_0\ : STD_LOGIC;
  signal \dout[4]_i_1_n_0\ : STD_LOGIC;
  signal \dout[5]_i_1_n_0\ : STD_LOGIC;
  signal \dout[5]_i_2_n_0\ : STD_LOGIC;
  signal \dout[9]_i_2_n_0\ : STD_LOGIC;
  signal \dout[9]_i_6_n_0\ : STD_LOGIC;
  signal \dout[9]_i_7_n_0\ : STD_LOGIC;
  signal \dout[9]_i_8_n_0\ : STD_LOGIC;
  signal \k28__4\ : STD_LOGIC;
  signal \ngdb.disp_run_reg_n_0\ : STD_LOGIC;
  signal pdes4 : STD_LOGIC;
  signal \pdes6__13\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dout[1]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \dout[2]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \dout[3]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \dout[4]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \dout[5]_i_2\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \dout[7]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \dout[8]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \dout[9]_i_5\ : label is "soft_lutpair79";
begin
\dout[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => txchardispval,
      I1 => txchardispmode,
      I2 => \ngdb.disp_run_reg_n_0\,
      I3 => \k28__4\,
      I4 => b6(0),
      O => \dout[0]_i_1_n_0\
    );
\dout[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2D807F017F01FE4B"
    )
        port map (
      I0 => txdata(3),
      I1 => txdata(4),
      I2 => \disp_in_i__0\,
      I3 => txdata(0),
      I4 => txdata(1),
      I5 => txdata(2),
      O => b6(0)
    );
\dout[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => txchardispval,
      I1 => txchardispmode,
      I2 => \ngdb.disp_run_reg_n_0\,
      I3 => \k28__4\,
      I4 => b6(1),
      O => \dout[1]_i_1_n_0\
    );
\dout[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"987170F170F171E6"
    )
        port map (
      I0 => txdata(0),
      I1 => \disp_in_i__0\,
      I2 => txdata(1),
      I3 => txdata(2),
      I4 => txdata(4),
      I5 => txdata(3),
      O => b6(1)
    );
\dout[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => b6(2),
      I1 => \k28__4\,
      O => \dout[2]_i_1_n_0\
    );
\dout[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"47807F09BF01FE16"
    )
        port map (
      I0 => txdata(4),
      I1 => txdata(3),
      I2 => txdata(1),
      I3 => txdata(2),
      I4 => txdata(0),
      I5 => \disp_in_i__0\,
      O => b6(2)
    );
\dout[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => b6(3),
      I1 => \k28__4\,
      O => \dout[3]_i_1_n_0\
    );
\dout[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B44C4CCD4CCDCED1"
    )
        port map (
      I0 => txdata(4),
      I1 => txdata(3),
      I2 => txdata(0),
      I3 => \disp_in_i__0\,
      I4 => txdata(1),
      I5 => txdata(2),
      O => b6(3)
    );
\dout[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => b6(4),
      I1 => \k28__4\,
      O => \dout[4]_i_1_n_0\
    );
\dout[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1F6F08107FEF9061"
    )
        port map (
      I0 => txdata(2),
      I1 => txdata(1),
      I2 => \disp_in_i__0\,
      I3 => txdata(0),
      I4 => txdata(4),
      I5 => txdata(3),
      O => b6(4)
    );
\dout[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \k28__4\,
      I1 => \ngdb.disp_run_reg_n_0\,
      I2 => txchardispmode,
      I3 => txchardispval,
      O => \dout[5]_i_1_n_0\
    );
\dout[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => b6(5),
      I1 => \k28__4\,
      O => \dout[5]_i_2_n_0\
    );
\dout[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"59969660A117177F"
    )
        port map (
      I0 => txdata(3),
      I1 => txdata(4),
      I2 => txdata(2),
      I3 => txdata(1),
      I4 => txdata(0),
      I5 => \disp_in_i__0\,
      O => b6(5)
    );
\dout[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F8F0000B0BFFF0F"
    )
        port map (
      I0 => \dout[9]_i_2_n_0\,
      I1 => txdata(7),
      I2 => txdata(6),
      I3 => \k28__4\,
      I4 => txdata(5),
      I5 => \pdes6__13\,
      O => b4(0)
    );
\dout[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5B5B0D58"
    )
        port map (
      I0 => txdata(5),
      I1 => \k28__4\,
      I2 => \pdes6__13\,
      I3 => txdata(7),
      I4 => txdata(6),
      O => b4(1)
    );
\dout[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"66AA9A59"
    )
        port map (
      I0 => txdata(7),
      I1 => txdata(6),
      I2 => \k28__4\,
      I3 => txdata(5),
      I4 => \pdes6__13\,
      O => b4(2)
    );
\dout[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"737330304C43CF3F"
    )
        port map (
      I0 => \dout[9]_i_2_n_0\,
      I1 => txdata(7),
      I2 => txdata(6),
      I3 => \k28__4\,
      I4 => txdata(5),
      I5 => \pdes6__13\,
      O => b4(3)
    );
\dout[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"727272727272728D"
    )
        port map (
      I0 => \k28__4\,
      I1 => \disp_in_i__0\,
      I2 => \dout[9]_i_6_n_0\,
      I3 => \dout[9]_i_7_n_0\,
      I4 => \dout[9]_i_8_n_0\,
      I5 => txcharisk,
      O => \dout[9]_i_2_n_0\
    );
\dout[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020000000000000"
    )
        port map (
      I0 => txdata(2),
      I1 => txdata(1),
      I2 => txcharisk,
      I3 => txdata(0),
      I4 => txdata(3),
      I5 => txdata(4),
      O => \k28__4\
    );
\dout[9]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"303FAAAA"
    )
        port map (
      I0 => \dout[9]_i_6_n_0\,
      I1 => txchardispval,
      I2 => txchardispmode,
      I3 => \ngdb.disp_run_reg_n_0\,
      I4 => \k28__4\,
      O => \pdes6__13\
    );
\dout[9]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => txchardispval,
      I1 => txchardispmode,
      I2 => \ngdb.disp_run_reg_n_0\,
      O => \disp_in_i__0\
    );
\dout[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"56696AA96AA9A995"
    )
        port map (
      I0 => \disp_in_i__0\,
      I1 => txdata(2),
      I2 => txdata(1),
      I3 => txdata(0),
      I4 => txdata(4),
      I5 => txdata(3),
      O => \dout[9]_i_6_n_0\
    );
\dout[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040400040000000"
    )
        port map (
      I0 => txdata(4),
      I1 => \disp_in_i__0\,
      I2 => txdata(3),
      I3 => txdata(2),
      I4 => txdata(0),
      I5 => txdata(1),
      O => \dout[9]_i_7_n_0\
    );
\dout[9]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400040400"
    )
        port map (
      I0 => \disp_in_i__0\,
      I1 => txdata(4),
      I2 => txdata(3),
      I3 => txdata(2),
      I4 => txdata(0),
      I5 => txdata(1),
      O => \dout[9]_i_8_n_0\
    );
\dout_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => \dout[0]_i_1_n_0\,
      Q => tx_data_10b(0),
      R => '0'
    );
\dout_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => \dout[1]_i_1_n_0\,
      Q => tx_data_10b(1),
      R => '0'
    );
\dout_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => \dout[2]_i_1_n_0\,
      Q => tx_data_10b(2),
      S => \dout[5]_i_1_n_0\
    );
\dout_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => \dout[3]_i_1_n_0\,
      Q => tx_data_10b(3),
      S => \dout[5]_i_1_n_0\
    );
\dout_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => \dout[4]_i_1_n_0\,
      Q => tx_data_10b(4),
      S => \dout[5]_i_1_n_0\
    );
\dout_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => \dout[5]_i_2_n_0\,
      Q => tx_data_10b(5),
      S => \dout[5]_i_1_n_0\
    );
\dout_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => b4(0),
      Q => tx_data_10b(6),
      R => '0'
    );
\dout_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => b4(1),
      Q => tx_data_10b(7),
      R => '0'
    );
\dout_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => b4(2),
      Q => tx_data_10b(8),
      R => '0'
    );
\dout_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => b4(3),
      Q => tx_data_10b(9),
      R => '0'
    );
\ngdb.disp_run_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7C83"
    )
        port map (
      I0 => txdata(7),
      I1 => txdata(6),
      I2 => txdata(5),
      I3 => \pdes6__13\,
      O => pdes4
    );
\ngdb.disp_run_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => pdes4,
      Q => \ngdb.disp_run_reg_n_0\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_johnson_cntr is
  port (
    clk12_5 : out STD_LOGIC;
    clk_en_12_5_fall0 : out STD_LOGIC;
    clk_en_12_5_rise0 : out STD_LOGIC;
    speed_is_10_100_fall_reg : out STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    clk12_5_reg : in STD_LOGIC;
    speed_is_10_100_fall : in STD_LOGIC;
    speed_is_100_fall : in STD_LOGIC;
    clk1_25 : in STD_LOGIC;
    reset_fall : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_johnson_cntr : entity is "gig_ethernet_pcs_pma_0_johnson_cntr";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_johnson_cntr;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_johnson_cntr is
  signal \^clk12_5\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal reg1 : STD_LOGIC;
  signal reg2 : STD_LOGIC;
  signal reg4 : STD_LOGIC;
  signal reg5 : STD_LOGIC;
  signal reg5_reg_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of clk_en_12_5_fall_i_1 : label is "soft_lutpair180";
  attribute SOFT_HLUTNM of clk_en_12_5_rise_i_1 : label is "soft_lutpair180";
begin
  clk12_5 <= \^clk12_5\;
clk_en_12_5_fall_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clk12_5_reg,
      I1 => \^clk12_5\,
      O => clk_en_12_5_fall0
    );
clk_en_12_5_rise_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^clk12_5\,
      I1 => clk12_5_reg,
      O => clk_en_12_5_rise0
    );
reg1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg5_reg_n_0,
      O => p_0_in
    );
reg1_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => p_0_in,
      Q => reg1,
      R => reg5
    );
reg2_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => reg1,
      Q => reg2,
      R => reg5
    );
reg3_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => reg2,
      Q => \^clk12_5\,
      R => reg5
    );
reg4_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \^clk12_5\,
      Q => reg4,
      R => reg5
    );
reg5_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => reg4,
      I1 => reg5_reg_n_0,
      I2 => reset_out,
      O => reg5
    );
reg5_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => reg4,
      Q => reg5_reg_n_0,
      R => reg5
    );
sgmii_clk_f_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDFD5"
    )
        port map (
      I0 => speed_is_10_100_fall,
      I1 => \^clk12_5\,
      I2 => speed_is_100_fall,
      I3 => clk1_25,
      I4 => reset_fall,
      O => speed_is_10_100_fall_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_johnson_cntr_2 is
  port (
    clk1_25 : out STD_LOGIC;
    sgmii_clk_r0_out : out STD_LOGIC;
    clk_en_1_25_fall0 : out STD_LOGIC;
    clk_en_12_5_rise : in STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    sgmii_clk_r_reg : in STD_LOGIC;
    data_out : in STD_LOGIC;
    clk12_5 : in STD_LOGIC;
    clk1_25_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_johnson_cntr_2 : entity is "gig_ethernet_pcs_pma_0_johnson_cntr";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_johnson_cntr_2;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_johnson_cntr_2 is
  signal \^clk1_25\ : STD_LOGIC;
  signal \reg1_i_1__0_n_0\ : STD_LOGIC;
  signal reg1_reg_n_0 : STD_LOGIC;
  signal reg2_reg_n_0 : STD_LOGIC;
  signal reg4 : STD_LOGIC;
  signal reg5 : STD_LOGIC;
  signal reg5_reg_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of clk_en_1_25_fall_i_1 : label is "soft_lutpair181";
  attribute SOFT_HLUTNM of sgmii_clk_r_i_1 : label is "soft_lutpair181";
begin
  clk1_25 <= \^clk1_25\;
clk_en_1_25_fall_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clk1_25_reg,
      I1 => \^clk1_25\,
      O => clk_en_1_25_fall0
    );
\reg1_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg5_reg_n_0,
      O => \reg1_i_1__0_n_0\
    );
reg1_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => clk_en_12_5_rise,
      D => \reg1_i_1__0_n_0\,
      Q => reg1_reg_n_0,
      R => reg5
    );
reg2_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => clk_en_12_5_rise,
      D => reg1_reg_n_0,
      Q => reg2_reg_n_0,
      R => reg5
    );
reg3_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => clk_en_12_5_rise,
      D => reg2_reg_n_0,
      Q => \^clk1_25\,
      R => reg5
    );
reg4_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => clk_en_12_5_rise,
      D => \^clk1_25\,
      Q => reg4,
      R => reg5
    );
\reg5_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF40"
    )
        port map (
      I0 => reg4,
      I1 => clk_en_12_5_rise,
      I2 => reg5_reg_n_0,
      I3 => reset_out,
      O => reg5
    );
reg5_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => clk_en_12_5_rise,
      D => reg4,
      Q => reg5_reg_n_0,
      R => reg5
    );
sgmii_clk_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => sgmii_clk_r_reg,
      I1 => \^clk1_25\,
      I2 => data_out,
      I3 => clk12_5,
      O => sgmii_clk_r0_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync is
  port (
    rst_125_out : out STD_LOGIC;
    tx_logic_reset : in STD_LOGIC;
    rx_logic_reset : in STD_LOGIC;
    Tx_WrClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync is
  signal logic_reset : STD_LOGIC;
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => '0',
      PRE => logic_reset,
      Q => reset_stage1
    );
\reset_sync1_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => tx_logic_reset,
      I1 => rx_logic_reset,
      O => logic_reset
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage1,
      PRE => logic_reset,
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage2,
      PRE => logic_reset,
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage3,
      PRE => logic_reset,
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage4,
      PRE => logic_reset,
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => rst_125_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_0 is
  port (
    reset_out : out STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    mgt_tx_reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_0 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_0;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_0 is
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => '0',
      PRE => mgt_tx_reset,
      Q => reset_stage1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage1,
      PRE => mgt_tx_reset,
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage2,
      PRE => mgt_tx_reset,
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage3,
      PRE => mgt_tx_reset,
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage4,
      PRE => mgt_tx_reset,
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => reset_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_24 is
  port (
    reset_out : out STD_LOGIC;
    reset_sync1_0 : in STD_LOGIC;
    ResetIn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_24 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_24;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_24 is
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => reset_sync1_0,
      CE => '1',
      D => '0',
      PRE => ResetIn,
      Q => reset_stage1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => reset_sync1_0,
      CE => '1',
      D => reset_stage1,
      PRE => ResetIn,
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => reset_sync1_0,
      CE => '1',
      D => reset_stage2,
      PRE => ResetIn,
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => reset_sync1_0,
      CE => '1',
      D => reset_stage3,
      PRE => ResetIn,
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => reset_sync1_0,
      CE => '1',
      D => reset_stage4,
      PRE => ResetIn,
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => reset_sync1_0,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => reset_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_25 is
  port (
    Rx_LogicRst : out STD_LOGIC;
    Rx_SysClk : in STD_LOGIC;
    reset_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_25 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_25;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_25 is
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => '0',
      PRE => reset_in,
      Q => reset_stage1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage1,
      PRE => reset_in,
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage2,
      PRE => reset_in,
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage3,
      PRE => reset_in,
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage4,
      PRE => reset_in,
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => Rx_LogicRst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_26 is
  port (
    Tx_LogicRst : out STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    reset_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_26 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_26;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_26 is
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => '0',
      PRE => reset_in,
      Q => reset_stage1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage1,
      PRE => reset_in,
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage2,
      PRE => reset_in,
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage3,
      PRE => reset_in,
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage4,
      PRE => reset_in,
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => Tx_LogicRst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_3 is
  port (
    reset_sync6_0 : out STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    reset_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_3 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_3;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_3 is
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => '0',
      PRE => reset_out,
      Q => reset_stage1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage1,
      PRE => reset_out,
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage2,
      PRE => reset_out,
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage3,
      PRE => reset_out,
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage4,
      PRE => reset_out,
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => reset_sync6_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_4 is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset_out : out STD_LOGIC;
    \d21p5_wr_pipe_reg[3]\ : in STD_LOGIC;
    Rx_SysClk : in STD_LOGIC;
    reset_sync5_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_4 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_4;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_4 is
  signal \^reset_out\ : STD_LOGIC;
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
  reset_out <= \^reset_out\;
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => '0',
      PRE => reset_sync5_0,
      Q => reset_stage1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage1,
      PRE => reset_sync5_0,
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage2,
      PRE => reset_sync5_0,
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage3,
      PRE => reset_sync5_0,
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage4,
      PRE => reset_sync5_0,
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => \^reset_out\
    );
\wr_addr[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^reset_out\,
      I1 => \d21p5_wr_pipe_reg[3]\,
      O => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_5 is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset_out : out STD_LOGIC;
    \wr_data_reg[0]\ : in STD_LOGIC;
    data_in : in STD_LOGIC;
    elastic_buffer_rst_125 : in STD_LOGIC;
    mgt_rx_reset : in STD_LOGIC;
    Rx_SysClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_5 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_5;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_5 is
  signal reset_in0 : STD_LOGIC;
  signal \^reset_out\ : STD_LOGIC;
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
  reset_out <= \^reset_out\;
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => '0',
      PRE => reset_in0,
      Q => reset_stage1
    );
reset_sync1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => elastic_buffer_rst_125,
      I1 => mgt_rx_reset,
      O => reset_in0
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage1,
      PRE => reset_in0,
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage2,
      PRE => reset_in0,
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage3,
      PRE => reset_in0,
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage4,
      PRE => reset_in0,
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => \^reset_out\
    );
\wr_data_reg_reg[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \^reset_out\,
      I1 => \wr_data_reg[0]\,
      I2 => data_in,
      O => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_6 is
  port (
    reset_sync6_0 : out STD_LOGIC;
    CLK : in STD_LOGIC;
    reset_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_6 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_6;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_6 is
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => '0',
      PRE => reset_out,
      Q => reset_stage1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => reset_stage1,
      PRE => reset_out,
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => reset_stage2,
      PRE => reset_out,
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => reset_stage3,
      PRE => reset_out,
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => reset_stage4,
      PRE => reset_out,
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => reset_sync6_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_rx_rate_adapt is
  port (
    gmii_rx_dv_0 : out STD_LOGIC;
    gmii_rx_er_0 : out STD_LOGIC;
    gmii_rxd_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    reset_out : in STD_LOGIC;
    gmii_rx_er_out_reg_0 : in STD_LOGIC;
    gmii_rx_dv : in STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    gmii_rx_er_in : in STD_LOGIC;
    gmii_rxd : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_rx_rate_adapt : entity is "gig_ethernet_pcs_pma_0_rx_rate_adapt";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_rx_rate_adapt;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_rx_rate_adapt is
  signal muxsel : STD_LOGIC;
  signal muxsel_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rx_dv_aligned : STD_LOGIC;
  signal rx_dv_aligned_i_1_n_0 : STD_LOGIC;
  signal rx_dv_reg1 : STD_LOGIC;
  signal rx_dv_reg2 : STD_LOGIC;
  signal rx_er_aligned : STD_LOGIC;
  signal rx_er_aligned_0 : STD_LOGIC;
  signal rx_er_reg1 : STD_LOGIC;
  signal rx_er_reg2 : STD_LOGIC;
  signal rxd_aligned : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \rxd_aligned[0]_i_1_n_0\ : STD_LOGIC;
  signal \rxd_aligned[1]_i_1_n_0\ : STD_LOGIC;
  signal \rxd_aligned[2]_i_1_n_0\ : STD_LOGIC;
  signal \rxd_aligned[3]_i_1_n_0\ : STD_LOGIC;
  signal \rxd_aligned[4]_i_1_n_0\ : STD_LOGIC;
  signal \rxd_aligned[5]_i_1_n_0\ : STD_LOGIC;
  signal \rxd_aligned[6]_i_1_n_0\ : STD_LOGIC;
  signal \rxd_aligned[7]_i_1_n_0\ : STD_LOGIC;
  signal \rxd_reg1_reg_n_0_[0]\ : STD_LOGIC;
  signal \rxd_reg1_reg_n_0_[1]\ : STD_LOGIC;
  signal \rxd_reg1_reg_n_0_[2]\ : STD_LOGIC;
  signal \rxd_reg1_reg_n_0_[3]\ : STD_LOGIC;
  signal rxd_reg2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal sfd_enable : STD_LOGIC;
  signal sfd_enable0 : STD_LOGIC;
  signal sfd_enable_i_1_n_0 : STD_LOGIC;
  signal sfd_enable_i_2_n_0 : STD_LOGIC;
  signal sfd_enable_i_4_n_0 : STD_LOGIC;
  signal sfd_enable_i_5_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of rx_dv_aligned_i_1 : label is "soft_lutpair183";
  attribute SOFT_HLUTNM of rx_er_aligned_i_1 : label is "soft_lutpair183";
  attribute SOFT_HLUTNM of \rxd_aligned[0]_i_1\ : label is "soft_lutpair184";
  attribute SOFT_HLUTNM of \rxd_aligned[1]_i_1\ : label is "soft_lutpair186";
  attribute SOFT_HLUTNM of \rxd_aligned[2]_i_1\ : label is "soft_lutpair185";
  attribute SOFT_HLUTNM of \rxd_aligned[3]_i_1\ : label is "soft_lutpair182";
  attribute SOFT_HLUTNM of \rxd_aligned[4]_i_1\ : label is "soft_lutpair184";
  attribute SOFT_HLUTNM of \rxd_aligned[5]_i_1\ : label is "soft_lutpair186";
  attribute SOFT_HLUTNM of \rxd_aligned[6]_i_1\ : label is "soft_lutpair185";
  attribute SOFT_HLUTNM of \rxd_aligned[7]_i_1\ : label is "soft_lutpair182";
begin
gmii_rx_dv_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rx_dv_aligned,
      Q => gmii_rx_dv_0,
      R => reset_out
    );
gmii_rx_er_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rx_er_aligned,
      Q => gmii_rx_er_0,
      R => reset_out
    );
\gmii_rxd_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rxd_aligned(0),
      Q => gmii_rxd_0(0),
      R => reset_out
    );
\gmii_rxd_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rxd_aligned(1),
      Q => gmii_rxd_0(1),
      R => reset_out
    );
\gmii_rxd_out_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rxd_aligned(2),
      Q => gmii_rxd_0(2),
      R => reset_out
    );
\gmii_rxd_out_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rxd_aligned(3),
      Q => gmii_rxd_0(3),
      R => reset_out
    );
\gmii_rxd_out_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rxd_aligned(4),
      Q => gmii_rxd_0(4),
      R => reset_out
    );
\gmii_rxd_out_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rxd_aligned(5),
      Q => gmii_rxd_0(5),
      R => reset_out
    );
\gmii_rxd_out_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rxd_aligned(6),
      Q => gmii_rxd_0(6),
      R => reset_out
    );
\gmii_rxd_out_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rxd_aligned(7),
      Q => gmii_rxd_0(7),
      R => reset_out
    );
muxsel_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000CCCCA8CC"
    )
        port map (
      I0 => sfd_enable_i_5_n_0,
      I1 => muxsel,
      I2 => sfd_enable_i_2_n_0,
      I3 => sfd_enable,
      I4 => sfd_enable_i_4_n_0,
      I5 => reset_out,
      O => muxsel_i_1_n_0
    );
muxsel_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => muxsel_i_1_n_0,
      Q => muxsel,
      R => '0'
    );
rx_dv_aligned_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B0"
    )
        port map (
      I0 => rx_dv_reg1,
      I1 => muxsel,
      I2 => rx_dv_reg2,
      O => rx_dv_aligned_i_1_n_0
    );
rx_dv_aligned_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rx_dv_aligned_i_1_n_0,
      Q => rx_dv_aligned,
      R => reset_out
    );
rx_dv_reg1_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => gmii_rx_dv,
      Q => rx_dv_reg1,
      R => reset_out
    );
rx_dv_reg2_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rx_dv_reg1,
      Q => rx_dv_reg2,
      R => reset_out
    );
rx_er_aligned_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => muxsel,
      I1 => rx_er_reg1,
      I2 => rx_er_reg2,
      O => rx_er_aligned_0
    );
rx_er_aligned_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rx_er_aligned_0,
      Q => rx_er_aligned,
      R => reset_out
    );
rx_er_reg1_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => gmii_rx_er_in,
      Q => rx_er_reg1,
      R => reset_out
    );
rx_er_reg2_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => rx_er_reg1,
      Q => rx_er_reg2,
      R => reset_out
    );
\rxd_aligned[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxd_reg2(4),
      I1 => muxsel,
      I2 => rxd_reg2(0),
      O => \rxd_aligned[0]_i_1_n_0\
    );
\rxd_aligned[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxd_reg2(5),
      I1 => muxsel,
      I2 => rxd_reg2(1),
      O => \rxd_aligned[1]_i_1_n_0\
    );
\rxd_aligned[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxd_reg2(6),
      I1 => muxsel,
      I2 => rxd_reg2(2),
      O => \rxd_aligned[2]_i_1_n_0\
    );
\rxd_aligned[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxd_reg2(7),
      I1 => muxsel,
      I2 => rxd_reg2(3),
      O => \rxd_aligned[3]_i_1_n_0\
    );
\rxd_aligned[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rxd_reg1_reg_n_0_[0]\,
      I1 => muxsel,
      I2 => rxd_reg2(4),
      O => \rxd_aligned[4]_i_1_n_0\
    );
\rxd_aligned[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rxd_reg1_reg_n_0_[1]\,
      I1 => muxsel,
      I2 => rxd_reg2(5),
      O => \rxd_aligned[5]_i_1_n_0\
    );
\rxd_aligned[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rxd_reg1_reg_n_0_[2]\,
      I1 => muxsel,
      I2 => rxd_reg2(6),
      O => \rxd_aligned[6]_i_1_n_0\
    );
\rxd_aligned[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rxd_reg1_reg_n_0_[3]\,
      I1 => muxsel,
      I2 => rxd_reg2(7),
      O => \rxd_aligned[7]_i_1_n_0\
    );
\rxd_aligned_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_aligned[0]_i_1_n_0\,
      Q => rxd_aligned(0),
      R => reset_out
    );
\rxd_aligned_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_aligned[1]_i_1_n_0\,
      Q => rxd_aligned(1),
      R => reset_out
    );
\rxd_aligned_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_aligned[2]_i_1_n_0\,
      Q => rxd_aligned(2),
      R => reset_out
    );
\rxd_aligned_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_aligned[3]_i_1_n_0\,
      Q => rxd_aligned(3),
      R => reset_out
    );
\rxd_aligned_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_aligned[4]_i_1_n_0\,
      Q => rxd_aligned(4),
      R => reset_out
    );
\rxd_aligned_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_aligned[5]_i_1_n_0\,
      Q => rxd_aligned(5),
      R => reset_out
    );
\rxd_aligned_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_aligned[6]_i_1_n_0\,
      Q => rxd_aligned(6),
      R => reset_out
    );
\rxd_aligned_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_aligned[7]_i_1_n_0\,
      Q => rxd_aligned(7),
      R => reset_out
    );
\rxd_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => gmii_rxd(0),
      Q => \rxd_reg1_reg_n_0_[0]\,
      R => reset_out
    );
\rxd_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => gmii_rxd(1),
      Q => \rxd_reg1_reg_n_0_[1]\,
      R => reset_out
    );
\rxd_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => gmii_rxd(2),
      Q => \rxd_reg1_reg_n_0_[2]\,
      R => reset_out
    );
\rxd_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => gmii_rxd(3),
      Q => \rxd_reg1_reg_n_0_[3]\,
      R => reset_out
    );
\rxd_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => gmii_rxd(4),
      Q => p_0_in(0),
      R => reset_out
    );
\rxd_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => gmii_rxd(5),
      Q => p_0_in(1),
      R => reset_out
    );
\rxd_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => gmii_rxd(6),
      Q => p_0_in(2),
      R => reset_out
    );
\rxd_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => gmii_rxd(7),
      Q => p_0_in(3),
      R => reset_out
    );
\rxd_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_reg1_reg_n_0_[0]\,
      Q => rxd_reg2(0),
      R => reset_out
    );
\rxd_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_reg1_reg_n_0_[1]\,
      Q => rxd_reg2(1),
      R => reset_out
    );
\rxd_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_reg1_reg_n_0_[2]\,
      Q => rxd_reg2(2),
      R => reset_out
    );
\rxd_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => \rxd_reg1_reg_n_0_[3]\,
      Q => rxd_reg2(3),
      R => reset_out
    );
\rxd_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => p_0_in(0),
      Q => rxd_reg2(4),
      R => reset_out
    );
\rxd_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => p_0_in(1),
      Q => rxd_reg2(5),
      R => reset_out
    );
\rxd_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => p_0_in(2),
      Q => rxd_reg2(6),
      R => reset_out
    );
\rxd_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => gmii_rx_er_out_reg_0,
      D => p_0_in(3),
      Q => rxd_reg2(7),
      R => reset_out
    );
sfd_enable_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDDFFCCC0C8C0CC"
    )
        port map (
      I0 => sfd_enable_i_2_n_0,
      I1 => sfd_enable0,
      I2 => gmii_rx_er_out_reg_0,
      I3 => sfd_enable_i_4_n_0,
      I4 => sfd_enable_i_5_n_0,
      I5 => sfd_enable,
      O => sfd_enable_i_1_n_0
    );
sfd_enable_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => p_0_in(3),
      I1 => gmii_rxd(0),
      I2 => gmii_rxd(1),
      I3 => gmii_rxd(3),
      I4 => gmii_rxd(2),
      O => sfd_enable_i_2_n_0
    );
sfd_enable_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => gmii_rx_dv,
      I1 => rx_dv_reg1,
      O => sfd_enable0
    );
sfd_enable_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      I2 => gmii_rx_er_out_reg_0,
      I3 => p_0_in(2),
      O => sfd_enable_i_4_n_0
    );
sfd_enable_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDFFF"
    )
        port map (
      I0 => \rxd_reg1_reg_n_0_[0]\,
      I1 => \rxd_reg1_reg_n_0_[3]\,
      I2 => p_0_in(3),
      I3 => \rxd_reg1_reg_n_0_[2]\,
      I4 => \rxd_reg1_reg_n_0_[1]\,
      O => sfd_enable_i_5_n_0
    );
sfd_enable_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => sfd_enable_i_1_n_0,
      Q => sfd_enable,
      R => reset_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_serdes_1_to_10 is
  port (
    BaseX_Rx_Fifo_Rd_En : out STD_LOGIC_VECTOR ( 0 to 0 );
    ActCnt_GE_HalfBT_reg_0 : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    ActiveIsSlve_reg_0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    Mstr_Load_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    WrapToZero : out STD_LOGIC;
    monitor_late_reg_0 : out STD_LOGIC;
    insert5_reg_0 : out STD_LOGIC;
    insert3_reg_0 : out STD_LOGIC;
    pd_ovflw_down_reg_0 : out STD_LOGIC;
    pd_ovflw_up_reg_0 : out STD_LOGIC;
    Aligned : out STD_LOGIC;
    Rx_Valid_Int_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \Mstr_CntValIn_Out_reg[8]_0\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \s_state_reg[4]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \pd_count_reg[4]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \Slve_CntValIn_Out_reg[1]_0\ : out STD_LOGIC;
    decoded_rxchariscomma0 : out STD_LOGIC;
    \rxdh_reg[7]_0\ : out STD_LOGIC;
    \rxdh_reg[16]_0\ : out STD_LOGIC;
    \s_state_reg[0]_0\ : out STD_LOGIC;
    \s_state_reg[5]_0\ : out STD_LOGIC;
    \s_state_reg[4]_1\ : out STD_LOGIC;
    \s_state_reg[2]_0\ : out STD_LOGIC;
    \s_state_reg[4]_2\ : out STD_LOGIC;
    \Slve_CntValIn_Out_reg[0]_0\ : out STD_LOGIC;
    \s_state_reg[0]_1\ : out STD_LOGIC;
    \active_reg[1]_0\ : out STD_LOGIC;
    \act_count_reg[0]_0\ : out STD_LOGIC;
    \act_count_reg[5]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \act_count_reg[4]_0\ : out STD_LOGIC;
    \act_count_reg[3]_0\ : out STD_LOGIC;
    \rxdh_reg[18]_0\ : out STD_LOGIC;
    \s_state_reg[3]_0\ : out STD_LOGIC;
    BaseX_Idly_Load : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \out\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \grdni.run_disp_i_reg\ : out STD_LOGIC;
    \grdni.run_disp_i_reg_0\ : out STD_LOGIC;
    k : out STD_LOGIC;
    code_err_i : out STD_LOGIC;
    b3 : out STD_LOGIC_VECTOR ( 7 downto 5 );
    D0 : in STD_LOGIC;
    Rx_SysClk : in STD_LOGIC;
    LossOfSignal_reg_0 : in STD_LOGIC;
    ActiveIsSlve_reg_1 : in STD_LOGIC;
    Slve_Load_reg_0 : in STD_LOGIC;
    Mstr_Load_reg_1 : in STD_LOGIC;
    WrapToZero_reg_0 : in STD_LOGIC;
    monitor_late_reg_1 : in STD_LOGIC;
    insert5_reg_1 : in STD_LOGIC;
    insert3_reg_1 : in STD_LOGIC;
    pd_ovflw_down_reg_1 : in STD_LOGIC;
    pd_ovflw_up_reg_1 : in STD_LOGIC;
    Aligned_reg_0 : in STD_LOGIC;
    BaseX_Rx_Q_Out : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \IntReset_dly_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IntRx_BtVal_reg[8]_0\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \gdeni.disp_err_reg\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_serdes_1_to_10 : entity is "gig_ethernet_pcs_pma_0_serdes_1_to_10";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_serdes_1_to_10;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_serdes_1_to_10 is
  signal ActCnt_EQ_BTval : STD_LOGIC;
  signal ActCnt_EQ_BTval_i_2_n_0 : STD_LOGIC;
  signal ActCnt_EQ_BTval_i_3_n_0 : STD_LOGIC;
  signal ActCnt_EQ_BTval_i_4_n_0 : STD_LOGIC;
  signal ActCnt_EQ_BTval_i_5_n_0 : STD_LOGIC;
  signal ActCnt_EQ_BTval_i_6_n_0 : STD_LOGIC;
  signal ActCnt_EQ_BTval_i_7_n_0 : STD_LOGIC;
  signal ActCnt_EQ_BTval_reg_i_1_n_0 : STD_LOGIC;
  signal ActCnt_EQ_Zero : STD_LOGIC;
  signal ActCnt_EQ_Zero_i_1_n_0 : STD_LOGIC;
  signal ActCnt_EQ_Zero_i_2_n_0 : STD_LOGIC;
  signal ActCnt_EQ_Zero_i_3_n_0 : STD_LOGIC;
  signal ActCnt_EQ_Zero_i_4_n_0 : STD_LOGIC;
  signal ActCnt_EQ_Zero_i_5_n_0 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_i_1_n_0 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_i_2_n_0 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_i_3_n_0 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_i_4_n_0 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_i_5_n_0 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_i_6_n_0 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_i_7_n_0 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_i_8_n_0 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_i_9_n_0 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_n_3 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_n_4 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_n_5 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_n_6 : STD_LOGIC;
  signal ActCnt_GE_HalfBT0_carry_n_7 : STD_LOGIC;
  signal \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal ActCnt_GE_HalfBT_i_1_n_0 : STD_LOGIC;
  signal \^actcnt_ge_halfbt_reg_0\ : STD_LOGIC;
  signal \^activeisslve_reg_0\ : STD_LOGIC;
  signal \^aligned\ : STD_LOGIC;
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal IntReset_dly : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \IntReset_dly_reg_n_0_[1]\ : STD_LOGIC;
  signal LossOfSignal_i_4_n_0 : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_10\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_11\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_12\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_13\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_14\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_15\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_2\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_3\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_4\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_5\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_6\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_7\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_9\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[0]_i_1_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[1]_i_1_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[1]_i_2_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[1]_i_3_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[2]_i_1_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[2]_i_2_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[2]_i_3_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[3]_i_1_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[3]_i_2_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[4]_i_1_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[4]_i_2_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[5]_i_1_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[5]_i_2_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[5]_i_3_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[5]_i_4_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[6]_i_1_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[6]_i_2_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[6]_i_3_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[6]_i_4_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[7]_i_1_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[7]_i_2_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[7]_i_3_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[7]_i_4_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[7]_i_5_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[8]_i_1_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[8]_i_2_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[8]_i_3_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[8]_i_4_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[8]_i_5_n_0\ : STD_LOGIC;
  signal \Mstr_CntValIn_Out[8]_i_6_n_0\ : STD_LOGIC;
  signal \^mstr_cntvalin_out_reg[8]_0\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Mstr_Load_dly : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^mstr_load_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PhaseDet_CntDec : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \PhaseDet_CntDec[0]_i_1_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntDec[1]_i_1_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntDec[2]_i_1_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntDec[2]_i_2_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntDec[2]_i_3_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntDec[2]_i_4_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntDec[2]_i_5_n_0\ : STD_LOGIC;
  signal PhaseDet_CntInc : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \PhaseDet_CntInc[0]_i_1_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntInc[1]_i_1_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntInc[2]_i_1_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntInc[2]_i_2_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntInc[2]_i_3_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntInc[2]_i_4_n_0\ : STD_LOGIC;
  signal \PhaseDet_CntInc[2]_i_5_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \Rx_Algn_Data_Out[0]_i_1_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[0]_i_2_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[1]_i_1_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[1]_i_2_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[2]_i_1_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[2]_i_2_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[3]_i_1_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[3]_i_2_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[4]_i_1_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[4]_i_2_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[5]_i_1_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[5]_i_2_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[6]_i_1_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[6]_i_2_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[6]_i_3_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[7]_i_1_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[7]_i_2_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[7]_i_3_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[8]_i_1_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[8]_i_2_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[8]_i_3_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[9]_i_1_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[9]_i_2_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[9]_i_3_n_0\ : STD_LOGIC;
  signal \Rx_Algn_Data_Out[9]_i_4_n_0\ : STD_LOGIC;
  signal Rx_Algn_Valid_Out0 : STD_LOGIC;
  signal Rx_Valid_Int_i_1_n_0 : STD_LOGIC;
  signal \^rx_valid_int_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_10\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_11\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_12\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_13\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_14\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_15\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_2\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_3\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_4\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_5\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_6\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_7\ : STD_LOGIC;
  signal \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_9\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[0]_i_1_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[1]_i_1_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[1]_i_2_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[2]_i_1_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[2]_i_2_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[2]_i_3_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[3]_i_1_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[3]_i_2_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[3]_i_3_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[4]_i_1_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[4]_i_2_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[4]_i_3_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[5]_i_1_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[5]_i_2_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[5]_i_3_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[5]_i_4_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[5]_i_5_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[6]_i_1_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[6]_i_2_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[6]_i_3_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[6]_i_4_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[6]_i_5_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[7]_i_1_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[7]_i_2_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[7]_i_3_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[7]_i_4_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[7]_i_5_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[8]_i_1_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[8]_i_2_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[8]_i_3_n_0\ : STD_LOGIC;
  signal \Slve_CntValIn_Out[8]_i_5_n_0\ : STD_LOGIC;
  signal \^slve_cntvalin_out_reg[0]_0\ : STD_LOGIC;
  signal \^slve_cntvalin_out_reg[1]_0\ : STD_LOGIC;
  signal Slve_Load_dly : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \act_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \act_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \act_count[2]_i_1_n_0\ : STD_LOGIC;
  signal \act_count[3]_i_1_n_0\ : STD_LOGIC;
  signal \act_count[4]_i_1_n_0\ : STD_LOGIC;
  signal \act_count[5]_i_1_n_0\ : STD_LOGIC;
  signal \act_count[5]_i_2_n_0\ : STD_LOGIC;
  signal \act_count[5]_i_4_n_0\ : STD_LOGIC;
  signal \act_count[5]_i_6_n_0\ : STD_LOGIC;
  signal \act_count[5]_i_7_n_0\ : STD_LOGIC;
  signal \act_count[5]_i_8_n_0\ : STD_LOGIC;
  signal act_count_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^act_count_reg[0]_0\ : STD_LOGIC;
  signal \^act_count_reg[5]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^active_reg[1]_0\ : STD_LOGIC;
  signal \active_reg_n_0_[0]\ : STD_LOGIC;
  signal \active_reg_n_0_[1]\ : STD_LOGIC;
  signal \active_reg_n_0_[2]\ : STD_LOGIC;
  signal \active_reg_n_0_[3]\ : STD_LOGIC;
  signal \active_reg_n_0_[4]\ : STD_LOGIC;
  signal \active_reg_n_0_[5]\ : STD_LOGIC;
  signal \active_reg_n_0_[6]\ : STD_LOGIC;
  signal \active_reg_n_0_[7]\ : STD_LOGIC;
  signal al_rx_data_out : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal data0 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal data9 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal decoded_rxchariscomma_i_2_n_0 : STD_LOGIC;
  signal decoded_rxchariscomma_i_3_n_0 : STD_LOGIC;
  signal delay_change : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \delay_change[7]_i_1_n_0\ : STD_LOGIC;
  signal \delay_change_reg_n_0_[0]\ : STD_LOGIC;
  signal \dout_i[7]_i_2_n_0\ : STD_LOGIC;
  signal \dout_i[7]_i_3_n_0\ : STD_LOGIC;
  signal \g0_b0__0_n_0\ : STD_LOGIC;
  signal \g0_b1__0_n_0\ : STD_LOGIC;
  signal \g0_b2__0_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_10_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_11_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_12_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_13_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_2_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_3_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_4_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_5_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_6_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_7_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_8_n_0\ : STD_LOGIC;
  signal \gcerr.code_err_i_9_n_0\ : STD_LOGIC;
  signal \gdeni.disp_err_i_4_n_0\ : STD_LOGIC;
  signal \gdeni.disp_err_i_5_n_0\ : STD_LOGIC;
  signal \gdeni.disp_err_i_6_n_0\ : STD_LOGIC;
  signal \gdeni.disp_err_i_7_n_0\ : STD_LOGIC;
  signal \gdeni.disp_err_reg_i_2_n_0\ : STD_LOGIC;
  signal \gdeni.disp_err_reg_i_3_n_0\ : STD_LOGIC;
  signal \grdni.run_disp_i_i_2_n_0\ : STD_LOGIC;
  signal \grdni.run_disp_i_i_3_n_0\ : STD_LOGIC;
  signal hdataout : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \hdataout[0]_i_1_n_0\ : STD_LOGIC;
  signal \hdataout[0]_i_2_n_0\ : STD_LOGIC;
  signal \hdataout[1]_i_1_n_0\ : STD_LOGIC;
  signal \hdataout[1]_i_2_n_0\ : STD_LOGIC;
  signal \hdataout[2]_i_1_n_0\ : STD_LOGIC;
  signal \hdataout[2]_i_2_n_0\ : STD_LOGIC;
  signal \hdataout[3]_i_1_n_0\ : STD_LOGIC;
  signal \hdataout[3]_i_2_n_0\ : STD_LOGIC;
  signal \hdataout[4]_i_1_n_0\ : STD_LOGIC;
  signal \hdataout[4]_i_2_n_0\ : STD_LOGIC;
  signal \hdataout[5]_i_1_n_0\ : STD_LOGIC;
  signal \hdataout[5]_i_2_n_0\ : STD_LOGIC;
  signal \hdataout[6]_i_1_n_0\ : STD_LOGIC;
  signal \hdataout[6]_i_2_n_0\ : STD_LOGIC;
  signal \hdataout[7]_i_1_n_0\ : STD_LOGIC;
  signal \hdataout[7]_i_2_n_0\ : STD_LOGIC;
  signal \hdataout[8]_i_1_n_0\ : STD_LOGIC;
  signal \hdataout[8]_i_2_n_0\ : STD_LOGIC;
  signal \hdataout[9]_i_2_n_0\ : STD_LOGIC;
  signal \hdataout[9]_i_3_n_0\ : STD_LOGIC;
  signal \holdreg[10]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[11]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[12]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[13]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[14]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[1]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[2]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[3]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[4]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[5]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[6]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[7]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[8]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg[9]_i_1_n_0\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[10]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[11]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[12]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[13]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[14]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[1]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[2]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[3]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[4]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[5]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[6]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[7]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[8]\ : STD_LOGIC;
  signal \holdreg_reg_n_0_[9]\ : STD_LOGIC;
  signal \i___0_carry_i_1__0_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_1_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_2__0_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_2_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_3__0_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_3_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_4__0_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_4_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_5__0_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_5_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_6__0_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_6_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_7__0_n_0\ : STD_LOGIC;
  signal \i___0_carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_8_n_0\ : STD_LOGIC;
  signal \i__carry_i_9_n_0\ : STD_LOGIC;
  signal \^insert3_reg_0\ : STD_LOGIC;
  signal \^insert5_reg_0\ : STD_LOGIC;
  signal kout_i_i_2_n_0 : STD_LOGIC;
  signal kout_i_i_3_n_0 : STD_LOGIC;
  signal monitor : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \^monitor_late_reg_0\ : STD_LOGIC;
  signal \mpx[0]_i_10_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_11_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_12_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_13_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_14_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_15_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_16_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_17_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_18_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_19_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_1_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_20_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_21_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_22_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_23_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_24_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_2_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_3_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_4_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_5_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_6_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_7_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_8_n_0\ : STD_LOGIC;
  signal \mpx[0]_i_9_n_0\ : STD_LOGIC;
  signal \mpx[1]_i_1_n_0\ : STD_LOGIC;
  signal \mpx[1]_i_2_n_0\ : STD_LOGIC;
  signal \mpx[1]_i_3_n_0\ : STD_LOGIC;
  signal \mpx[1]_i_4_n_0\ : STD_LOGIC;
  signal \mpx[2]_i_1_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_10_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_11_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_12_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_13_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_14_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_15_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_16_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_17_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_18_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_19_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_1_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_20_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_21_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_22_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_23_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_24_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_25_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_26_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_27_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_28_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_29_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_2_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_6_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_7_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_8_n_0\ : STD_LOGIC;
  signal \mpx[3]_i_9_n_0\ : STD_LOGIC;
  signal \mpx__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal p_1_out : STD_LOGIC;
  signal p_2_out : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal p_3_out : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal \pd_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \pd_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \pd_count[2]_i_1_n_0\ : STD_LOGIC;
  signal \pd_count[2]_i_2_n_0\ : STD_LOGIC;
  signal \pd_count[2]_i_3_n_0\ : STD_LOGIC;
  signal \pd_count[3]_i_1_n_0\ : STD_LOGIC;
  signal \pd_count[4]_i_2_n_0\ : STD_LOGIC;
  signal \pd_count[4]_i_3_n_0\ : STD_LOGIC;
  signal \pd_count[4]_i_4_n_0\ : STD_LOGIC;
  signal \^pd_count_reg[4]_0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^pd_ovflw_down_reg_0\ : STD_LOGIC;
  signal pd_ovflw_up : STD_LOGIC;
  signal \^pd_ovflw_up_reg_0\ : STD_LOGIC;
  signal \^rxdh_reg[16]_0\ : STD_LOGIC;
  signal \^rxdh_reg[18]_0\ : STD_LOGIC;
  signal \^rxdh_reg[7]_0\ : STD_LOGIC;
  signal \rxdh_reg_n_0_[0]\ : STD_LOGIC;
  signal \rxdh_reg_n_0_[19]\ : STD_LOGIC;
  signal \rxdh_reg_n_0_[1]\ : STD_LOGIC;
  signal \rxdh_reg_n_0_[2]\ : STD_LOGIC;
  signal \rxdh_reg_n_0_[3]\ : STD_LOGIC;
  signal \rxdh_reg_n_0_[4]\ : STD_LOGIC;
  signal \rxdh_reg_n_0_[5]\ : STD_LOGIC;
  signal \rxdh_reg_n_0_[6]\ : STD_LOGIC;
  signal \rxdh_reg_n_0_[7]\ : STD_LOGIC;
  signal \rxdh_reg_n_0_[8]\ : STD_LOGIC;
  signal s_state : STD_LOGIC;
  signal \s_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \s_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \s_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \s_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \s_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \s_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \s_state[5]_i_2_n_0\ : STD_LOGIC;
  signal \s_state[5]_i_3_n_0\ : STD_LOGIC;
  signal \s_state[5]_i_5_n_0\ : STD_LOGIC;
  signal \s_state[5]_i_6_n_0\ : STD_LOGIC;
  signal \s_state[5]_i_7_n_0\ : STD_LOGIC;
  signal \s_state[5]_i_8_n_0\ : STD_LOGIC;
  signal \s_state[5]_i_9_n_0\ : STD_LOGIC;
  signal \^s_state_reg[4]_0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^s_state_reg[4]_2\ : STD_LOGIC;
  signal \^s_state_reg[5]_0\ : STD_LOGIC;
  signal \s_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \toggle[0]_i_1_n_0\ : STD_LOGIC;
  signal \toggle[1]_i_1_n_0\ : STD_LOGIC;
  signal \toggle[2]_i_1_n_0\ : STD_LOGIC;
  signal \toggle[3]_i_1_n_0\ : STD_LOGIC;
  signal \toggle_reg_n_0_[0]\ : STD_LOGIC;
  signal \toggle_reg_n_0_[1]\ : STD_LOGIC;
  signal \toggle_reg_n_0_[2]\ : STD_LOGIC;
  signal NLW_ActCnt_GE_HalfBT0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal NLW_ActCnt_GE_HalfBT0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_ActCnt_GE_HalfBT0_inferred__0/i__carry_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \NLW_ActCnt_GE_HalfBT0_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_Mstr_CntValIn_Out0_inferred__1/i___0_carry_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \NLW_Mstr_CntValIn_Out0_inferred__1/i___0_carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_Slve_CntValIn_Out0_inferred__1/i___0_carry_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \NLW_Slve_CntValIn_Out0_inferred__1/i___0_carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ActCnt_EQ_Zero_i_3 : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of ActCnt_EQ_Zero_i_5 : label is "soft_lutpair124";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of ActCnt_GE_HalfBT0_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \ActCnt_GE_HalfBT0_inferred__0/i__carry\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute box_type : string;
  attribute box_type of FifoRd_0 : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of LossOfSignal_i_2 : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of LossOfSignal_i_3 : label is "soft_lutpair125";
  attribute METHODOLOGY_DRC_VIOS of \Mstr_CntValIn_Out0_inferred__1/i___0_carry\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute SOFT_HLUTNM of \Mstr_CntValIn_Out[1]_i_2\ : label is "soft_lutpair136";
  attribute SOFT_HLUTNM of \Mstr_CntValIn_Out[1]_i_3\ : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of \Mstr_CntValIn_Out[2]_i_3\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \Mstr_CntValIn_Out[6]_i_3\ : label is "soft_lutpair144";
  attribute SOFT_HLUTNM of \Mstr_CntValIn_Out[7]_i_3\ : label is "soft_lutpair144";
  attribute SOFT_HLUTNM of \Mstr_CntValIn_Out[7]_i_4\ : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of \Mstr_CntValIn_Out[7]_i_5\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \Mstr_CntValIn_Out[8]_i_3\ : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \Mstr_CntValIn_Out[8]_i_5\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \PhaseDet_CntDec[0]_i_1\ : label is "soft_lutpair146";
  attribute SOFT_HLUTNM of \PhaseDet_CntDec[2]_i_1\ : label is "soft_lutpair146";
  attribute SOFT_HLUTNM of \PhaseDet_CntDec[2]_i_2\ : label is "soft_lutpair140";
  attribute SOFT_HLUTNM of \PhaseDet_CntDec[2]_i_3\ : label is "soft_lutpair137";
  attribute SOFT_HLUTNM of \PhaseDet_CntDec[2]_i_4\ : label is "soft_lutpair139";
  attribute SOFT_HLUTNM of \PhaseDet_CntDec[2]_i_5\ : label is "soft_lutpair135";
  attribute SOFT_HLUTNM of \PhaseDet_CntInc[1]_i_1\ : label is "soft_lutpair145";
  attribute SOFT_HLUTNM of \PhaseDet_CntInc[2]_i_1\ : label is "soft_lutpair145";
  attribute SOFT_HLUTNM of \PhaseDet_CntInc[2]_i_2\ : label is "soft_lutpair140";
  attribute SOFT_HLUTNM of \PhaseDet_CntInc[2]_i_3\ : label is "soft_lutpair137";
  attribute SOFT_HLUTNM of \PhaseDet_CntInc[2]_i_4\ : label is "soft_lutpair135";
  attribute SOFT_HLUTNM of \PhaseDet_CntInc[2]_i_5\ : label is "soft_lutpair139";
  attribute METHODOLOGY_DRC_VIOS of \Slve_CntValIn_Out0_inferred__1/i___0_carry\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute SOFT_HLUTNM of \Slve_CntValIn_Out[1]_i_2\ : label is "soft_lutpair141";
  attribute SOFT_HLUTNM of \Slve_CntValIn_Out[2]_i_2\ : label is "soft_lutpair128";
  attribute SOFT_HLUTNM of \Slve_CntValIn_Out[2]_i_3\ : label is "soft_lutpair128";
  attribute SOFT_HLUTNM of \Slve_CntValIn_Out[4]_i_2\ : label is "soft_lutpair130";
  attribute SOFT_HLUTNM of \Slve_CntValIn_Out[5]_i_5\ : label is "soft_lutpair130";
  attribute SOFT_HLUTNM of \Slve_CntValIn_Out[6]_i_5\ : label is "soft_lutpair142";
  attribute SOFT_HLUTNM of \Slve_CntValIn_Out[7]_i_4\ : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of \Slve_CntValIn_Out[7]_i_5\ : label is "soft_lutpair142";
  attribute SOFT_HLUTNM of \Slve_CntValIn_Out[8]_i_3\ : label is "soft_lutpair133";
  attribute SOFT_HLUTNM of \Slve_CntValIn_Out[8]_i_4\ : label is "soft_lutpair133";
  attribute SOFT_HLUTNM of Slve_Load_i_3 : label is "soft_lutpair162";
  attribute SOFT_HLUTNM of \act_count[0]_i_1\ : label is "soft_lutpair172";
  attribute SOFT_HLUTNM of \act_count[1]_i_1\ : label is "soft_lutpair171";
  attribute SOFT_HLUTNM of \act_count[2]_i_1\ : label is "soft_lutpair132";
  attribute SOFT_HLUTNM of \act_count[3]_i_1\ : label is "soft_lutpair132";
  attribute SOFT_HLUTNM of \act_count[5]_i_3\ : label is "soft_lutpair171";
  attribute SOFT_HLUTNM of \act_count[5]_i_4\ : label is "soft_lutpair172";
  attribute SOFT_HLUTNM of \active[4]_i_1\ : label is "soft_lutpair167";
  attribute SOFT_HLUTNM of \active[5]_i_1\ : label is "soft_lutpair166";
  attribute SOFT_HLUTNM of \active[6]_i_1\ : label is "soft_lutpair170";
  attribute SOFT_HLUTNM of \active[7]_i_1\ : label is "soft_lutpair169";
  attribute SOFT_HLUTNM of \delay_change[0]_i_1\ : label is "soft_lutpair141";
  attribute SOFT_HLUTNM of \delay_change[1]_i_1\ : label is "soft_lutpair176";
  attribute SOFT_HLUTNM of \delay_change[2]_i_1\ : label is "soft_lutpair177";
  attribute SOFT_HLUTNM of \delay_change[3]_i_1\ : label is "soft_lutpair177";
  attribute SOFT_HLUTNM of \delay_change[4]_i_1\ : label is "soft_lutpair176";
  attribute SOFT_HLUTNM of \delay_change[5]_i_1\ : label is "soft_lutpair178";
  attribute SOFT_HLUTNM of \delay_change[6]_i_1\ : label is "soft_lutpair178";
  attribute SOFT_HLUTNM of \dout_i[7]_i_2\ : label is "soft_lutpair143";
  attribute SOFT_HLUTNM of \dout_i[7]_i_3\ : label is "soft_lutpair143";
  attribute SOFT_HLUTNM of \grdni.run_disp_i_i_2\ : label is "soft_lutpair159";
  attribute SOFT_HLUTNM of \grdni.run_disp_i_i_3\ : label is "soft_lutpair159";
  attribute SOFT_HLUTNM of \hdataout[0]_i_1\ : label is "soft_lutpair168";
  attribute SOFT_HLUTNM of \hdataout[1]_i_1\ : label is "soft_lutpair174";
  attribute SOFT_HLUTNM of \hdataout[2]_i_1\ : label is "soft_lutpair168";
  attribute SOFT_HLUTNM of \hdataout[3]_i_1\ : label is "soft_lutpair165";
  attribute SOFT_HLUTNM of \hdataout[4]_i_1\ : label is "soft_lutpair164";
  attribute SOFT_HLUTNM of \hdataout[5]_i_1\ : label is "soft_lutpair163";
  attribute SOFT_HLUTNM of \hdataout[6]_i_1\ : label is "soft_lutpair174";
  attribute SOFT_HLUTNM of \hdataout[7]_i_1\ : label is "soft_lutpair163";
  attribute SOFT_HLUTNM of \hdataout[8]_i_1\ : label is "soft_lutpair164";
  attribute SOFT_HLUTNM of \hdataout[9]_i_2\ : label is "soft_lutpair165";
  attribute SOFT_HLUTNM of insert5_i_2 : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \monitor[4]_i_1\ : label is "soft_lutpair167";
  attribute SOFT_HLUTNM of \monitor[5]_i_1\ : label is "soft_lutpair166";
  attribute SOFT_HLUTNM of \monitor[6]_i_1\ : label is "soft_lutpair170";
  attribute SOFT_HLUTNM of \monitor[7]_i_1\ : label is "soft_lutpair169";
  attribute SOFT_HLUTNM of \mpx[0]_i_10\ : label is "soft_lutpair149";
  attribute SOFT_HLUTNM of \mpx[0]_i_11\ : label is "soft_lutpair175";
  attribute SOFT_HLUTNM of \mpx[0]_i_12\ : label is "soft_lutpair173";
  attribute SOFT_HLUTNM of \mpx[0]_i_13\ : label is "soft_lutpair155";
  attribute SOFT_HLUTNM of \mpx[0]_i_14\ : label is "soft_lutpair150";
  attribute SOFT_HLUTNM of \mpx[0]_i_15\ : label is "soft_lutpair173";
  attribute SOFT_HLUTNM of \mpx[0]_i_16\ : label is "soft_lutpair153";
  attribute SOFT_HLUTNM of \mpx[0]_i_17\ : label is "soft_lutpair158";
  attribute SOFT_HLUTNM of \mpx[0]_i_19\ : label is "soft_lutpair158";
  attribute SOFT_HLUTNM of \mpx[0]_i_2\ : label is "soft_lutpair129";
  attribute SOFT_HLUTNM of \mpx[0]_i_20\ : label is "soft_lutpair150";
  attribute SOFT_HLUTNM of \mpx[0]_i_21\ : label is "soft_lutpair148";
  attribute SOFT_HLUTNM of \mpx[0]_i_22\ : label is "soft_lutpair160";
  attribute SOFT_HLUTNM of \mpx[0]_i_23\ : label is "soft_lutpair155";
  attribute SOFT_HLUTNM of \mpx[0]_i_24\ : label is "soft_lutpair151";
  attribute SOFT_HLUTNM of \mpx[0]_i_7\ : label is "soft_lutpair160";
  attribute SOFT_HLUTNM of \mpx[0]_i_8\ : label is "soft_lutpair149";
  attribute SOFT_HLUTNM of \mpx[0]_i_9\ : label is "soft_lutpair156";
  attribute SOFT_HLUTNM of \mpx[1]_i_1\ : label is "soft_lutpair129";
  attribute SOFT_HLUTNM of \mpx[1]_i_3\ : label is "soft_lutpair131";
  attribute SOFT_HLUTNM of \mpx[1]_i_4\ : label is "soft_lutpair127";
  attribute SOFT_HLUTNM of \mpx[2]_i_1\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \mpx[3]_i_13\ : label is "soft_lutpair156";
  attribute SOFT_HLUTNM of \mpx[3]_i_14\ : label is "soft_lutpair157";
  attribute SOFT_HLUTNM of \mpx[3]_i_15\ : label is "soft_lutpair152";
  attribute SOFT_HLUTNM of \mpx[3]_i_16\ : label is "soft_lutpair154";
  attribute SOFT_HLUTNM of \mpx[3]_i_17\ : label is "soft_lutpair152";
  attribute SOFT_HLUTNM of \mpx[3]_i_18\ : label is "soft_lutpair154";
  attribute SOFT_HLUTNM of \mpx[3]_i_19\ : label is "soft_lutpair157";
  attribute SOFT_HLUTNM of \mpx[3]_i_2\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \mpx[3]_i_20\ : label is "soft_lutpair131";
  attribute SOFT_HLUTNM of \mpx[3]_i_21\ : label is "soft_lutpair127";
  attribute SOFT_HLUTNM of \mpx[3]_i_22\ : label is "soft_lutpair153";
  attribute SOFT_HLUTNM of \mpx[3]_i_23\ : label is "soft_lutpair151";
  attribute SOFT_HLUTNM of \mpx[3]_i_24\ : label is "soft_lutpair148";
  attribute SOFT_HLUTNM of \mpx[3]_i_25\ : label is "soft_lutpair147";
  attribute SOFT_HLUTNM of \mpx[3]_i_28\ : label is "soft_lutpair147";
  attribute SOFT_HLUTNM of \mpx[3]_i_29\ : label is "soft_lutpair175";
  attribute SOFT_HLUTNM of \pd_count[2]_i_1\ : label is "soft_lutpair138";
  attribute SOFT_HLUTNM of \pd_count[2]_i_3\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \pd_count[3]_i_1\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \pd_count[4]_i_4\ : label is "soft_lutpair138";
  attribute SOFT_HLUTNM of \s_state[1]_i_2\ : label is "soft_lutpair161";
  attribute SOFT_HLUTNM of \s_state[3]_i_1\ : label is "soft_lutpair162";
  attribute SOFT_HLUTNM of \s_state[5]_i_3\ : label is "soft_lutpair134";
  attribute SOFT_HLUTNM of \s_state[5]_i_4\ : label is "soft_lutpair136";
  attribute SOFT_HLUTNM of \s_state[5]_i_7\ : label is "soft_lutpair161";
  attribute SOFT_HLUTNM of \s_state[5]_i_8\ : label is "soft_lutpair134";
begin
  ActCnt_GE_HalfBT_reg_0 <= \^actcnt_ge_halfbt_reg_0\;
  ActiveIsSlve_reg_0 <= \^activeisslve_reg_0\;
  Aligned <= \^aligned\;
  D(0) <= \^d\(0);
  \Mstr_CntValIn_Out_reg[8]_0\(8 downto 0) <= \^mstr_cntvalin_out_reg[8]_0\(8 downto 0);
  Mstr_Load_reg_0(0) <= \^mstr_load_reg_0\(0);
  Q(6 downto 0) <= \^q\(6 downto 0);
  Rx_Valid_Int_reg_0(0) <= \^rx_valid_int_reg_0\(0);
  SR(0) <= \^sr\(0);
  \Slve_CntValIn_Out_reg[0]_0\ <= \^slve_cntvalin_out_reg[0]_0\;
  \Slve_CntValIn_Out_reg[1]_0\ <= \^slve_cntvalin_out_reg[1]_0\;
  \act_count_reg[0]_0\ <= \^act_count_reg[0]_0\;
  \act_count_reg[5]_0\(0) <= \^act_count_reg[5]_0\(0);
  \active_reg[1]_0\ <= \^active_reg[1]_0\;
  insert3_reg_0 <= \^insert3_reg_0\;
  insert5_reg_0 <= \^insert5_reg_0\;
  monitor_late_reg_0 <= \^monitor_late_reg_0\;
  \pd_count_reg[4]_0\(4 downto 0) <= \^pd_count_reg[4]_0\(4 downto 0);
  pd_ovflw_down_reg_0 <= \^pd_ovflw_down_reg_0\;
  pd_ovflw_up_reg_0 <= \^pd_ovflw_up_reg_0\;
  \rxdh_reg[16]_0\ <= \^rxdh_reg[16]_0\;
  \rxdh_reg[18]_0\ <= \^rxdh_reg[18]_0\;
  \rxdh_reg[7]_0\ <= \^rxdh_reg[7]_0\;
  \s_state_reg[4]_0\(4 downto 0) <= \^s_state_reg[4]_0\(4 downto 0);
  \s_state_reg[4]_2\ <= \^s_state_reg[4]_2\;
  \s_state_reg[5]_0\ <= \^s_state_reg[5]_0\;
ActCnt_EQ_BTval_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(1),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(0),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(2),
      I3 => ActCnt_EQ_BTval_i_4_n_0,
      I4 => ActCnt_EQ_BTval_i_5_n_0,
      O => ActCnt_EQ_BTval_i_2_n_0
    );
ActCnt_EQ_BTval_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^slve_cntvalin_out_reg[1]_0\,
      I1 => \^slve_cntvalin_out_reg[0]_0\,
      I2 => \^q\(0),
      I3 => ActCnt_EQ_BTval_i_6_n_0,
      I4 => ActCnt_EQ_BTval_i_7_n_0,
      O => ActCnt_EQ_BTval_i_3_n_0
    );
ActCnt_EQ_BTval_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => p_1_in(4),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(5),
      I2 => p_1_in(3),
      I3 => \^mstr_cntvalin_out_reg[8]_0\(4),
      I4 => \^mstr_cntvalin_out_reg[8]_0\(3),
      I5 => p_1_in(2),
      O => ActCnt_EQ_BTval_i_4_n_0
    );
ActCnt_EQ_BTval_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(6),
      I1 => p_1_in(5),
      I2 => p_1_in(6),
      I3 => \^mstr_cntvalin_out_reg[8]_0\(7),
      I4 => \^mstr_cntvalin_out_reg[8]_0\(8),
      I5 => p_1_in(7),
      O => ActCnt_EQ_BTval_i_5_n_0
    );
ActCnt_EQ_BTval_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => p_1_in(3),
      I1 => \^q\(2),
      I2 => p_1_in(4),
      I3 => \^q\(3),
      I4 => \^q\(1),
      I5 => p_1_in(2),
      O => ActCnt_EQ_BTval_i_6_n_0
    );
ActCnt_EQ_BTval_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \^q\(4),
      I1 => p_1_in(5),
      I2 => p_1_in(6),
      I3 => \^q\(5),
      I4 => \^q\(6),
      I5 => p_1_in(7),
      O => ActCnt_EQ_BTval_i_7_n_0
    );
ActCnt_EQ_BTval_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => ActCnt_EQ_BTval_reg_i_1_n_0,
      Q => ActCnt_EQ_BTval,
      R => \^sr\(0)
    );
ActCnt_EQ_BTval_reg_i_1: unisim.vcomponents.MUXF7
     port map (
      I0 => ActCnt_EQ_BTval_i_2_n_0,
      I1 => ActCnt_EQ_BTval_i_3_n_0,
      O => ActCnt_EQ_BTval_reg_i_1_n_0,
      S => \^activeisslve_reg_0\
    );
ActCnt_EQ_Zero_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000400"
    )
        port map (
      I0 => \^activeisslve_reg_0\,
      I1 => ActCnt_EQ_Zero_i_2_n_0,
      I2 => \^mstr_cntvalin_out_reg[8]_0\(2),
      I3 => ActCnt_EQ_Zero_i_3_n_0,
      I4 => \^mstr_cntvalin_out_reg[8]_0\(8),
      I5 => ActCnt_EQ_Zero_i_4_n_0,
      O => ActCnt_EQ_Zero_i_1_n_0
    );
ActCnt_EQ_Zero_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(1),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(0),
      O => ActCnt_EQ_Zero_i_2_n_0
    );
ActCnt_EQ_Zero_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(5),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(4),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(3),
      I3 => \^mstr_cntvalin_out_reg[8]_0\(6),
      I4 => \^mstr_cntvalin_out_reg[8]_0\(7),
      O => ActCnt_EQ_Zero_i_3_n_0
    );
ActCnt_EQ_Zero_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000020"
    )
        port map (
      I0 => ActCnt_EQ_Zero_i_5_n_0,
      I1 => \^q\(6),
      I2 => \^activeisslve_reg_0\,
      I3 => \^q\(0),
      I4 => \^slve_cntvalin_out_reg[0]_0\,
      I5 => \^slve_cntvalin_out_reg[1]_0\,
      O => ActCnt_EQ_Zero_i_4_n_0
    );
ActCnt_EQ_Zero_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => ActCnt_EQ_Zero_i_5_n_0
    );
ActCnt_EQ_Zero_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => ActCnt_EQ_Zero_i_1_n_0,
      Q => ActCnt_EQ_Zero,
      R => \^sr\(0)
    );
ActCnt_GE_HalfBT0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7 downto 5) => NLW_ActCnt_GE_HalfBT0_carry_CO_UNCONNECTED(7 downto 5),
      CO(4) => ActCnt_GE_HalfBT0_carry_n_3,
      CO(3) => ActCnt_GE_HalfBT0_carry_n_4,
      CO(2) => ActCnt_GE_HalfBT0_carry_n_5,
      CO(1) => ActCnt_GE_HalfBT0_carry_n_6,
      CO(0) => ActCnt_GE_HalfBT0_carry_n_7,
      DI(7 downto 5) => B"000",
      DI(4) => \^q\(6),
      DI(3) => ActCnt_GE_HalfBT0_carry_i_1_n_0,
      DI(2) => ActCnt_GE_HalfBT0_carry_i_2_n_0,
      DI(1) => ActCnt_GE_HalfBT0_carry_i_3_n_0,
      DI(0) => ActCnt_GE_HalfBT0_carry_i_4_n_0,
      O(7 downto 0) => NLW_ActCnt_GE_HalfBT0_carry_O_UNCONNECTED(7 downto 0),
      S(7 downto 5) => B"000",
      S(4) => ActCnt_GE_HalfBT0_carry_i_5_n_0,
      S(3) => ActCnt_GE_HalfBT0_carry_i_6_n_0,
      S(2) => ActCnt_GE_HalfBT0_carry_i_7_n_0,
      S(1) => ActCnt_GE_HalfBT0_carry_i_8_n_0,
      S(0) => ActCnt_GE_HalfBT0_carry_i_9_n_0
    );
ActCnt_GE_HalfBT0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \^q\(5),
      I1 => p_1_in(7),
      I2 => \^q\(4),
      I3 => p_1_in(6),
      O => ActCnt_GE_HalfBT0_carry_i_1_n_0
    );
ActCnt_GE_HalfBT0_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \^q\(3),
      I1 => p_1_in(5),
      I2 => \^q\(2),
      I3 => p_1_in(4),
      O => ActCnt_GE_HalfBT0_carry_i_2_n_0
    );
ActCnt_GE_HalfBT0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \^q\(1),
      I1 => p_1_in(3),
      I2 => \^q\(0),
      I3 => p_1_in(2),
      O => ActCnt_GE_HalfBT0_carry_i_3_n_0
    );
ActCnt_GE_HalfBT0_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^slve_cntvalin_out_reg[0]_0\,
      I1 => \^slve_cntvalin_out_reg[1]_0\,
      O => ActCnt_GE_HalfBT0_carry_i_4_n_0
    );
ActCnt_GE_HalfBT0_carry_i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(6),
      O => ActCnt_GE_HalfBT0_carry_i_5_n_0
    );
ActCnt_GE_HalfBT0_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_1_in(7),
      I1 => \^q\(5),
      I2 => p_1_in(6),
      I3 => \^q\(4),
      O => ActCnt_GE_HalfBT0_carry_i_6_n_0
    );
ActCnt_GE_HalfBT0_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_1_in(5),
      I1 => \^q\(3),
      I2 => p_1_in(4),
      I3 => \^q\(2),
      O => ActCnt_GE_HalfBT0_carry_i_7_n_0
    );
ActCnt_GE_HalfBT0_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_1_in(3),
      I1 => \^q\(1),
      I2 => p_1_in(2),
      I3 => \^q\(0),
      O => ActCnt_GE_HalfBT0_carry_i_8_n_0
    );
ActCnt_GE_HalfBT0_carry_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^slve_cntvalin_out_reg[1]_0\,
      I1 => \^slve_cntvalin_out_reg[0]_0\,
      O => ActCnt_GE_HalfBT0_carry_i_9_n_0
    );
\ActCnt_GE_HalfBT0_inferred__0/i__carry\: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7 downto 5) => \NLW_ActCnt_GE_HalfBT0_inferred__0/i__carry_CO_UNCONNECTED\(7 downto 5),
      CO(4) => \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_3\,
      CO(3) => \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_4\,
      CO(2) => \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_5\,
      CO(1) => \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_6\,
      CO(0) => \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_7\,
      DI(7 downto 5) => B"000",
      DI(4) => \^mstr_cntvalin_out_reg[8]_0\(8),
      DI(3) => \i__carry_i_1_n_0\,
      DI(2) => \i__carry_i_2_n_0\,
      DI(1) => \i__carry_i_3_n_0\,
      DI(0) => \i__carry_i_4_n_0\,
      O(7 downto 0) => \NLW_ActCnt_GE_HalfBT0_inferred__0/i__carry_O_UNCONNECTED\(7 downto 0),
      S(7 downto 5) => B"000",
      S(4) => \i__carry_i_5_n_0\,
      S(3) => \i__carry_i_6_n_0\,
      S(2) => \i__carry_i_7_n_0\,
      S(1) => \i__carry_i_8_n_0\,
      S(0) => \i__carry_i_9_n_0\
    );
ActCnt_GE_HalfBT_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ActCnt_GE_HalfBT0_carry_n_3,
      I1 => \^activeisslve_reg_0\,
      I2 => \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_3\,
      O => ActCnt_GE_HalfBT_i_1_n_0
    );
ActCnt_GE_HalfBT_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => ActCnt_GE_HalfBT_i_1_n_0,
      Q => \^actcnt_ge_halfbt_reg_0\,
      R => \^sr\(0)
    );
ActiveIsSlve_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => ActiveIsSlve_reg_1,
      Q => \^activeisslve_reg_0\,
      R => \^sr\(0)
    );
Aligned_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => Aligned_reg_0,
      Q => \^aligned\,
      R => \^sr\(0)
    );
FifoRd_0: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => D0,
      Q => BaseX_Rx_Fifo_Rd_En(0),
      R => '0'
    );
\IntReset_dly_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \IntReset_dly_reg[0]_0\(0),
      Q => IntReset_dly(0),
      R => '0'
    );
\IntReset_dly_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => IntReset_dly(0),
      Q => \IntReset_dly_reg_n_0_[1]\,
      R => '0'
    );
\IntRx_BtVal_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \IntRx_BtVal_reg[8]_0\(0),
      Q => p_1_in(2),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\IntRx_BtVal_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \IntRx_BtVal_reg[8]_0\(1),
      Q => p_1_in(3),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\IntRx_BtVal_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \IntRx_BtVal_reg[8]_0\(2),
      Q => p_1_in(4),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\IntRx_BtVal_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \IntRx_BtVal_reg[8]_0\(3),
      Q => p_1_in(5),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\IntRx_BtVal_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \IntRx_BtVal_reg[8]_0\(4),
      Q => p_1_in(6),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\IntRx_BtVal_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \IntRx_BtVal_reg[8]_0\(5),
      Q => p_1_in(7),
      R => \IntReset_dly_reg_n_0_[1]\
    );
LossOfSignal_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => act_count_reg(3),
      I1 => act_count_reg(4),
      O => \act_count_reg[3]_0\
    );
LossOfSignal_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => \act_count[5]_i_4_n_0\,
      I1 => LossOfSignal_i_4_n_0,
      I2 => \act_count[5]_i_7_n_0\,
      I3 => act_count_reg(4),
      I4 => act_count_reg(3),
      O => \act_count_reg[4]_0\
    );
LossOfSignal_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \active_reg_n_0_[6]\,
      I1 => \active_reg_n_0_[0]\,
      I2 => \active_reg_n_0_[5]\,
      I3 => \active_reg_n_0_[1]\,
      I4 => \act_count[5]_i_6_n_0\,
      O => LossOfSignal_i_4_n_0
    );
LossOfSignal_reg: unisim.vcomponents.FDSE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => LossOfSignal_reg_0,
      Q => \^sr\(0),
      S => \IntReset_dly_reg_n_0_[1]\
    );
\Mstr_CntValIn_Out0_inferred__1/i___0_carry\: unisim.vcomponents.CARRY8
     port map (
      CI => \^actcnt_ge_halfbt_reg_0\,
      CI_TOP => '0',
      CO(7 downto 6) => \NLW_Mstr_CntValIn_Out0_inferred__1/i___0_carry_CO_UNCONNECTED\(7 downto 6),
      CO(5) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_2\,
      CO(4) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_3\,
      CO(3) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_4\,
      CO(2) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_5\,
      CO(1) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_6\,
      CO(0) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_7\,
      DI(7 downto 6) => B"00",
      DI(5 downto 0) => \^q\(5 downto 0),
      O(7) => \NLW_Mstr_CntValIn_Out0_inferred__1/i___0_carry_O_UNCONNECTED\(7),
      O(6) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_9\,
      O(5) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_10\,
      O(4) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_11\,
      O(3) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_12\,
      O(2) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_13\,
      O(1) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_14\,
      O(0) => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_15\,
      S(7) => '0',
      S(6) => \i___0_carry_i_1_n_0\,
      S(5) => \i___0_carry_i_2_n_0\,
      S(4) => \i___0_carry_i_3_n_0\,
      S(3) => \i___0_carry_i_4_n_0\,
      S(2) => \i___0_carry_i_5_n_0\,
      S(1) => \i___0_carry_i_6_n_0\,
      S(0) => \i___0_carry_i_7_n_0\
    );
\Mstr_CntValIn_Out[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4400404400004000"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \Mstr_CntValIn_Out[8]_i_5_n_0\,
      I2 => \^slve_cntvalin_out_reg[0]_0\,
      I3 => \Mstr_CntValIn_Out[2]_i_3_n_0\,
      I4 => \Mstr_CntValIn_Out[1]_i_3_n_0\,
      I5 => \^mstr_cntvalin_out_reg[8]_0\(0),
      O => \Mstr_CntValIn_Out[0]_i_1_n_0\
    );
\Mstr_CntValIn_Out[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A08A0080"
    )
        port map (
      I0 => \Mstr_CntValIn_Out[1]_i_2_n_0\,
      I1 => \^slve_cntvalin_out_reg[1]_0\,
      I2 => \Mstr_CntValIn_Out[2]_i_3_n_0\,
      I3 => \Mstr_CntValIn_Out[1]_i_3_n_0\,
      I4 => \^mstr_cntvalin_out_reg[8]_0\(1),
      O => \Mstr_CntValIn_Out[1]_i_1_n_0\
    );
\Mstr_CntValIn_Out[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000ABA0"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(0),
      I1 => \^s_state_reg[4]_0\(1),
      I2 => \^s_state_reg[4]_0\(4),
      I3 => \s_state_reg_n_0_[5]\,
      I4 => \^sr\(0),
      O => \Mstr_CntValIn_Out[1]_i_2_n_0\
    );
\Mstr_CntValIn_Out[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(0),
      I1 => \^s_state_reg[4]_0\(1),
      O => \Mstr_CntValIn_Out[1]_i_3_n_0\
    );
\Mstr_CntValIn_Out[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4544555540440500"
    )
        port map (
      I0 => \Mstr_CntValIn_Out[2]_i_2_n_0\,
      I1 => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_15\,
      I2 => \^s_state_reg[4]_0\(1),
      I3 => \^s_state_reg[4]_0\(0),
      I4 => \Mstr_CntValIn_Out[2]_i_3_n_0\,
      I5 => \^mstr_cntvalin_out_reg[8]_0\(2),
      O => \Mstr_CntValIn_Out[2]_i_1_n_0\
    );
\Mstr_CntValIn_Out[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBBFBFBFBBB"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \Mstr_CntValIn_Out[8]_i_5_n_0\,
      I2 => \Mstr_CntValIn_Out[1]_i_3_n_0\,
      I3 => \^s_state_reg[4]_0\(2),
      I4 => \^s_state_reg[4]_0\(4),
      I5 => p_1_in(2),
      O => \Mstr_CntValIn_Out[2]_i_2_n_0\
    );
\Mstr_CntValIn_Out[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000000F2"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(1),
      I1 => \s_state_reg_n_0_[5]\,
      I2 => \^s_state_reg[4]_0\(0),
      I3 => \^s_state_reg[4]_0\(2),
      I4 => \^s_state_reg[4]_0\(4),
      O => \Mstr_CntValIn_Out[2]_i_3_n_0\
    );
\Mstr_CntValIn_Out[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EF40EA40EF40EF40"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \Mstr_CntValIn_Out[3]_i_2_n_0\,
      I2 => \Mstr_CntValIn_Out[8]_i_5_n_0\,
      I3 => p_1_in(2),
      I4 => \^s_state_reg[4]_0\(1),
      I5 => \^s_state_reg[4]_0\(0),
      O => \Mstr_CntValIn_Out[3]_i_1_n_0\
    );
\Mstr_CntValIn_Out[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88883088BBBBFCBB"
    )
        port map (
      I0 => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_14\,
      I1 => \Mstr_CntValIn_Out[2]_i_3_n_0\,
      I2 => p_1_in(3),
      I3 => \^s_state_reg[4]_0\(0),
      I4 => \^s_state_reg[4]_0\(1),
      I5 => \^mstr_cntvalin_out_reg[8]_0\(3),
      O => \Mstr_CntValIn_Out[3]_i_2_n_0\
    );
\Mstr_CntValIn_Out[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EF40EA40EF40EF40"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \Mstr_CntValIn_Out[4]_i_2_n_0\,
      I2 => \Mstr_CntValIn_Out[8]_i_5_n_0\,
      I3 => p_1_in(3),
      I4 => \^s_state_reg[4]_0\(1),
      I5 => \^s_state_reg[4]_0\(0),
      O => \Mstr_CntValIn_Out[4]_i_1_n_0\
    );
\Mstr_CntValIn_Out[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FC8830BB30BBFC88"
    )
        port map (
      I0 => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_13\,
      I1 => \Mstr_CntValIn_Out[2]_i_3_n_0\,
      I2 => p_1_in(4),
      I3 => \Mstr_CntValIn_Out[1]_i_3_n_0\,
      I4 => \^mstr_cntvalin_out_reg[8]_0\(3),
      I5 => \^mstr_cntvalin_out_reg[8]_0\(4),
      O => \Mstr_CntValIn_Out[4]_i_2_n_0\
    );
\Mstr_CntValIn_Out[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EF40EA40EF40EF40"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \Mstr_CntValIn_Out[5]_i_2_n_0\,
      I2 => \Mstr_CntValIn_Out[8]_i_5_n_0\,
      I3 => p_1_in(4),
      I4 => \^s_state_reg[4]_0\(1),
      I5 => \^s_state_reg[4]_0\(0),
      O => \Mstr_CntValIn_Out[5]_i_1_n_0\
    );
\Mstr_CntValIn_Out[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F90FFFF9F900000"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(5),
      I1 => \Mstr_CntValIn_Out[5]_i_3_n_0\,
      I2 => \Mstr_CntValIn_Out[1]_i_3_n_0\,
      I3 => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_12\,
      I4 => \Mstr_CntValIn_Out[2]_i_3_n_0\,
      I5 => \Mstr_CntValIn_Out[5]_i_4_n_0\,
      O => \Mstr_CntValIn_Out[5]_i_2_n_0\
    );
\Mstr_CntValIn_Out[5]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(3),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(4),
      O => \Mstr_CntValIn_Out[5]_i_3_n_0\
    );
\Mstr_CntValIn_Out[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08FBFB08FB08FB08"
    )
        port map (
      I0 => p_1_in(5),
      I1 => \^s_state_reg[4]_0\(0),
      I2 => \^s_state_reg[4]_0\(1),
      I3 => \^mstr_cntvalin_out_reg[8]_0\(5),
      I4 => \^mstr_cntvalin_out_reg[8]_0\(4),
      I5 => \^mstr_cntvalin_out_reg[8]_0\(3),
      O => \Mstr_CntValIn_Out[5]_i_4_n_0\
    );
\Mstr_CntValIn_Out[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFF4444BABB0000"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \Mstr_CntValIn_Out[8]_i_5_n_0\,
      I2 => \^s_state_reg[4]_0\(1),
      I3 => \^s_state_reg[4]_0\(0),
      I4 => p_1_in(5),
      I5 => \Mstr_CntValIn_Out[6]_i_2_n_0\,
      O => \Mstr_CntValIn_Out[6]_i_1_n_0\
    );
\Mstr_CntValIn_Out[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F90FFFF9F900000"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(6),
      I1 => \Mstr_CntValIn_Out[6]_i_3_n_0\,
      I2 => \Mstr_CntValIn_Out[1]_i_3_n_0\,
      I3 => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_11\,
      I4 => \Mstr_CntValIn_Out[2]_i_3_n_0\,
      I5 => \Mstr_CntValIn_Out[6]_i_4_n_0\,
      O => \Mstr_CntValIn_Out[6]_i_2_n_0\
    );
\Mstr_CntValIn_Out[6]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(5),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(4),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(3),
      O => \Mstr_CntValIn_Out[6]_i_3_n_0\
    );
\Mstr_CntValIn_Out[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BB8B8B8B8B8B8B8"
    )
        port map (
      I0 => p_1_in(6),
      I1 => \Mstr_CntValIn_Out[1]_i_3_n_0\,
      I2 => \^mstr_cntvalin_out_reg[8]_0\(6),
      I3 => \^mstr_cntvalin_out_reg[8]_0\(5),
      I4 => \^mstr_cntvalin_out_reg[8]_0\(3),
      I5 => \^mstr_cntvalin_out_reg[8]_0\(4),
      O => \Mstr_CntValIn_Out[6]_i_4_n_0\
    );
\Mstr_CntValIn_Out[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFF4444BABB0000"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \Mstr_CntValIn_Out[8]_i_5_n_0\,
      I2 => \^s_state_reg[4]_0\(1),
      I3 => \^s_state_reg[4]_0\(0),
      I4 => p_1_in(6),
      I5 => \Mstr_CntValIn_Out[7]_i_2_n_0\,
      O => \Mstr_CntValIn_Out[7]_i_1_n_0\
    );
\Mstr_CntValIn_Out[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6F60FFFF6F600000"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(7),
      I1 => \Mstr_CntValIn_Out[7]_i_3_n_0\,
      I2 => \Mstr_CntValIn_Out[1]_i_3_n_0\,
      I3 => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_10\,
      I4 => \Mstr_CntValIn_Out[2]_i_3_n_0\,
      I5 => \Mstr_CntValIn_Out[7]_i_4_n_0\,
      O => \Mstr_CntValIn_Out[7]_i_2_n_0\
    );
\Mstr_CntValIn_Out[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(6),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(3),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(4),
      I3 => \^mstr_cntvalin_out_reg[8]_0\(5),
      O => \Mstr_CntValIn_Out[7]_i_3_n_0\
    );
\Mstr_CntValIn_Out[7]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08FBFB08"
    )
        port map (
      I0 => p_1_in(7),
      I1 => \^s_state_reg[4]_0\(0),
      I2 => \^s_state_reg[4]_0\(1),
      I3 => \^mstr_cntvalin_out_reg[8]_0\(7),
      I4 => \Mstr_CntValIn_Out[7]_i_5_n_0\,
      O => \Mstr_CntValIn_Out[7]_i_4_n_0\
    );
\Mstr_CntValIn_Out[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(6),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(5),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(3),
      I3 => \^mstr_cntvalin_out_reg[8]_0\(4),
      O => \Mstr_CntValIn_Out[7]_i_5_n_0\
    );
\Mstr_CntValIn_Out[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABAABFAAAAAAAAA"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \^s_state_reg[4]_0\(4),
      I2 => \^activeisslve_reg_0\,
      I3 => \s_state_reg_n_0_[5]\,
      I4 => \^s_state_reg[4]_0\(1),
      I5 => \Mstr_CntValIn_Out[8]_i_3_n_0\,
      O => \Mstr_CntValIn_Out[8]_i_1_n_0\
    );
\Mstr_CntValIn_Out[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EF40EA40EF40EF40"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \Mstr_CntValIn_Out[8]_i_4_n_0\,
      I2 => \Mstr_CntValIn_Out[8]_i_5_n_0\,
      I3 => p_1_in(7),
      I4 => \^s_state_reg[4]_0\(1),
      I5 => \^s_state_reg[4]_0\(0),
      O => \Mstr_CntValIn_Out[8]_i_2_n_0\
    );
\Mstr_CntValIn_Out[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10011110"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(3),
      I1 => \^s_state_reg[4]_0\(2),
      I2 => \s_state_reg_n_0_[5]\,
      I3 => \^s_state_reg[4]_0\(0),
      I4 => \^s_state_reg[4]_0\(1),
      O => \Mstr_CntValIn_Out[8]_i_3_n_0\
    );
\Mstr_CntValIn_Out[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6600F0006600F0FF"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(8),
      I1 => ActCnt_EQ_Zero_i_3_n_0,
      I2 => \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_9\,
      I3 => \Mstr_CntValIn_Out[2]_i_3_n_0\,
      I4 => \Mstr_CntValIn_Out[1]_i_3_n_0\,
      I5 => \Mstr_CntValIn_Out[8]_i_6_n_0\,
      O => \Mstr_CntValIn_Out[8]_i_4_n_0\
    );
\Mstr_CntValIn_Out[8]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EE02"
    )
        port map (
      I0 => \s_state_reg_n_0_[5]\,
      I1 => \^s_state_reg[4]_0\(4),
      I2 => \^s_state_reg[4]_0\(1),
      I3 => \^s_state_reg[4]_0\(0),
      O => \Mstr_CntValIn_Out[8]_i_5_n_0\
    );
\Mstr_CntValIn_Out[8]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9555555555555555"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(8),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(6),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(5),
      I3 => \^mstr_cntvalin_out_reg[8]_0\(3),
      I4 => \^mstr_cntvalin_out_reg[8]_0\(4),
      I5 => \^mstr_cntvalin_out_reg[8]_0\(7),
      O => \Mstr_CntValIn_Out[8]_i_6_n_0\
    );
\Mstr_CntValIn_Out_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Mstr_CntValIn_Out[8]_i_1_n_0\,
      D => \Mstr_CntValIn_Out[0]_i_1_n_0\,
      Q => \^mstr_cntvalin_out_reg[8]_0\(0),
      R => '0'
    );
\Mstr_CntValIn_Out_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Mstr_CntValIn_Out[8]_i_1_n_0\,
      D => \Mstr_CntValIn_Out[1]_i_1_n_0\,
      Q => \^mstr_cntvalin_out_reg[8]_0\(1),
      R => '0'
    );
\Mstr_CntValIn_Out_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Mstr_CntValIn_Out[8]_i_1_n_0\,
      D => \Mstr_CntValIn_Out[2]_i_1_n_0\,
      Q => \^mstr_cntvalin_out_reg[8]_0\(2),
      R => '0'
    );
\Mstr_CntValIn_Out_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Mstr_CntValIn_Out[8]_i_1_n_0\,
      D => \Mstr_CntValIn_Out[3]_i_1_n_0\,
      Q => \^mstr_cntvalin_out_reg[8]_0\(3),
      R => '0'
    );
\Mstr_CntValIn_Out_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Mstr_CntValIn_Out[8]_i_1_n_0\,
      D => \Mstr_CntValIn_Out[4]_i_1_n_0\,
      Q => \^mstr_cntvalin_out_reg[8]_0\(4),
      R => '0'
    );
\Mstr_CntValIn_Out_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Mstr_CntValIn_Out[8]_i_1_n_0\,
      D => \Mstr_CntValIn_Out[5]_i_1_n_0\,
      Q => \^mstr_cntvalin_out_reg[8]_0\(5),
      R => '0'
    );
\Mstr_CntValIn_Out_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Mstr_CntValIn_Out[8]_i_1_n_0\,
      D => \Mstr_CntValIn_Out[6]_i_1_n_0\,
      Q => \^mstr_cntvalin_out_reg[8]_0\(6),
      R => '0'
    );
\Mstr_CntValIn_Out_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Mstr_CntValIn_Out[8]_i_1_n_0\,
      D => \Mstr_CntValIn_Out[7]_i_1_n_0\,
      Q => \^mstr_cntvalin_out_reg[8]_0\(7),
      R => '0'
    );
\Mstr_CntValIn_Out_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Mstr_CntValIn_Out[8]_i_1_n_0\,
      D => \Mstr_CntValIn_Out[8]_i_2_n_0\,
      Q => \^mstr_cntvalin_out_reg[8]_0\(8),
      R => '0'
    );
\Mstr_Load_dly_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \^mstr_load_reg_0\(0),
      Q => Mstr_Load_dly(0),
      R => '0'
    );
\Mstr_Load_dly_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => Mstr_Load_dly(0),
      Q => Mstr_Load_dly(1),
      R => '0'
    );
Mstr_Load_reg: unisim.vcomponents.FDSE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => Mstr_Load_reg_1,
      Q => \^mstr_load_reg_0\(0),
      S => \^sr\(0)
    );
\PhaseDet_CntDec[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \PhaseDet_CntDec[2]_i_3_n_0\,
      I1 => \PhaseDet_CntDec[2]_i_2_n_0\,
      I2 => \PhaseDet_CntDec[2]_i_4_n_0\,
      I3 => \PhaseDet_CntDec[2]_i_5_n_0\,
      O => \PhaseDet_CntDec[0]_i_1_n_0\
    );
\PhaseDet_CntDec[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B2DB"
    )
        port map (
      I0 => \PhaseDet_CntDec[2]_i_5_n_0\,
      I1 => \PhaseDet_CntDec[2]_i_4_n_0\,
      I2 => \PhaseDet_CntDec[2]_i_3_n_0\,
      I3 => \PhaseDet_CntDec[2]_i_2_n_0\,
      O => \PhaseDet_CntDec[1]_i_1_n_0\
    );
\PhaseDet_CntDec[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \PhaseDet_CntDec[2]_i_2_n_0\,
      I1 => \PhaseDet_CntDec[2]_i_3_n_0\,
      I2 => \PhaseDet_CntDec[2]_i_4_n_0\,
      I3 => \PhaseDet_CntDec[2]_i_5_n_0\,
      O => \PhaseDet_CntDec[2]_i_1_n_0\
    );
\PhaseDet_CntDec[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF47B8FF"
    )
        port map (
      I0 => monitor(4),
      I1 => \^monitor_late_reg_0\,
      I2 => monitor(3),
      I3 => \active_reg_n_0_[4]\,
      I4 => \active_reg_n_0_[3]\,
      O => \PhaseDet_CntDec[2]_i_2_n_0\
    );
\PhaseDet_CntDec[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00B84700"
    )
        port map (
      I0 => monitor(6),
      I1 => \^monitor_late_reg_0\,
      I2 => monitor(5),
      I3 => \active_reg_n_0_[6]\,
      I4 => \active_reg_n_0_[5]\,
      O => \PhaseDet_CntDec[2]_i_3_n_0\
    );
\PhaseDet_CntDec[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF47B8FF"
    )
        port map (
      I0 => monitor(5),
      I1 => \^monitor_late_reg_0\,
      I2 => monitor(4),
      I3 => \active_reg_n_0_[5]\,
      I4 => \active_reg_n_0_[4]\,
      O => \PhaseDet_CntDec[2]_i_4_n_0\
    );
\PhaseDet_CntDec[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00B84700"
    )
        port map (
      I0 => monitor(7),
      I1 => \^monitor_late_reg_0\,
      I2 => monitor(6),
      I3 => \active_reg_n_0_[7]\,
      I4 => \active_reg_n_0_[6]\,
      O => \PhaseDet_CntDec[2]_i_5_n_0\
    );
\PhaseDet_CntDec_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \PhaseDet_CntDec[0]_i_1_n_0\,
      Q => PhaseDet_CntDec(0),
      R => '0'
    );
\PhaseDet_CntDec_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \PhaseDet_CntDec[1]_i_1_n_0\,
      Q => PhaseDet_CntDec(1),
      R => '0'
    );
\PhaseDet_CntDec_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \PhaseDet_CntDec[2]_i_1_n_0\,
      Q => PhaseDet_CntDec(2),
      R => '0'
    );
\PhaseDet_CntInc[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \PhaseDet_CntInc[2]_i_4_n_0\,
      I1 => \PhaseDet_CntInc[2]_i_3_n_0\,
      I2 => \PhaseDet_CntInc[2]_i_5_n_0\,
      I3 => \PhaseDet_CntInc[2]_i_2_n_0\,
      O => \PhaseDet_CntInc[0]_i_1_n_0\
    );
\PhaseDet_CntInc[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B2DB"
    )
        port map (
      I0 => \PhaseDet_CntInc[2]_i_5_n_0\,
      I1 => \PhaseDet_CntInc[2]_i_4_n_0\,
      I2 => \PhaseDet_CntInc[2]_i_3_n_0\,
      I3 => \PhaseDet_CntInc[2]_i_2_n_0\,
      O => \PhaseDet_CntInc[1]_i_1_n_0\
    );
\PhaseDet_CntInc[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \PhaseDet_CntInc[2]_i_2_n_0\,
      I1 => \PhaseDet_CntInc[2]_i_3_n_0\,
      I2 => \PhaseDet_CntInc[2]_i_4_n_0\,
      I3 => \PhaseDet_CntInc[2]_i_5_n_0\,
      O => \PhaseDet_CntInc[2]_i_1_n_0\
    );
\PhaseDet_CntInc[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF47B8FF"
    )
        port map (
      I0 => monitor(4),
      I1 => \^monitor_late_reg_0\,
      I2 => monitor(3),
      I3 => \active_reg_n_0_[3]\,
      I4 => \active_reg_n_0_[4]\,
      O => \PhaseDet_CntInc[2]_i_2_n_0\
    );
\PhaseDet_CntInc[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00B84700"
    )
        port map (
      I0 => monitor(6),
      I1 => \^monitor_late_reg_0\,
      I2 => monitor(5),
      I3 => \active_reg_n_0_[5]\,
      I4 => \active_reg_n_0_[6]\,
      O => \PhaseDet_CntInc[2]_i_3_n_0\
    );
\PhaseDet_CntInc[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF47B8FF"
    )
        port map (
      I0 => monitor(7),
      I1 => \^monitor_late_reg_0\,
      I2 => monitor(6),
      I3 => \active_reg_n_0_[6]\,
      I4 => \active_reg_n_0_[7]\,
      O => \PhaseDet_CntInc[2]_i_4_n_0\
    );
\PhaseDet_CntInc[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00B84700"
    )
        port map (
      I0 => monitor(5),
      I1 => \^monitor_late_reg_0\,
      I2 => monitor(4),
      I3 => \active_reg_n_0_[4]\,
      I4 => \active_reg_n_0_[5]\,
      O => \PhaseDet_CntInc[2]_i_5_n_0\
    );
\PhaseDet_CntInc_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \PhaseDet_CntInc[0]_i_1_n_0\,
      Q => PhaseDet_CntInc(0),
      R => '0'
    );
\PhaseDet_CntInc_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \PhaseDet_CntInc[1]_i_1_n_0\,
      Q => PhaseDet_CntInc(1),
      R => '0'
    );
\PhaseDet_CntInc_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \PhaseDet_CntInc[2]_i_1_n_0\,
      Q => PhaseDet_CntInc(2),
      R => '0'
    );
\Rx_Algn_Data_Out[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(0),
      I1 => \rxdh_reg_n_0_[8]\,
      I2 => \mpx__0\(3),
      I3 => \Rx_Algn_Data_Out[4]_i_2_n_0\,
      I4 => \Rx_Algn_Data_Out[9]_i_3_n_0\,
      I5 => \Rx_Algn_Data_Out[0]_i_2_n_0\,
      O => \Rx_Algn_Data_Out[0]_i_1_n_0\
    );
\Rx_Algn_Data_Out[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \rxdh_reg_n_0_[3]\,
      I1 => \rxdh_reg_n_0_[2]\,
      I2 => \mpx__0\(1),
      I3 => \rxdh_reg_n_0_[1]\,
      I4 => \mpx__0\(0),
      I5 => \rxdh_reg_n_0_[0]\,
      O => \Rx_Algn_Data_Out[0]_i_2_n_0\
    );
\Rx_Algn_Data_Out[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(1),
      I1 => data9(0),
      I2 => \mpx__0\(3),
      I3 => \Rx_Algn_Data_Out[5]_i_2_n_0\,
      I4 => \Rx_Algn_Data_Out[9]_i_3_n_0\,
      I5 => \Rx_Algn_Data_Out[1]_i_2_n_0\,
      O => \Rx_Algn_Data_Out[1]_i_1_n_0\
    );
\Rx_Algn_Data_Out[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \rxdh_reg_n_0_[4]\,
      I1 => \rxdh_reg_n_0_[3]\,
      I2 => \mpx__0\(1),
      I3 => \rxdh_reg_n_0_[2]\,
      I4 => \mpx__0\(0),
      I5 => \rxdh_reg_n_0_[1]\,
      O => \Rx_Algn_Data_Out[1]_i_2_n_0\
    );
\Rx_Algn_Data_Out[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(2),
      I1 => data9(1),
      I2 => \mpx__0\(3),
      I3 => \Rx_Algn_Data_Out[6]_i_3_n_0\,
      I4 => \Rx_Algn_Data_Out[9]_i_3_n_0\,
      I5 => \Rx_Algn_Data_Out[2]_i_2_n_0\,
      O => \Rx_Algn_Data_Out[2]_i_1_n_0\
    );
\Rx_Algn_Data_Out[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \rxdh_reg_n_0_[5]\,
      I1 => \rxdh_reg_n_0_[4]\,
      I2 => \mpx__0\(1),
      I3 => \rxdh_reg_n_0_[3]\,
      I4 => \mpx__0\(0),
      I5 => \rxdh_reg_n_0_[2]\,
      O => \Rx_Algn_Data_Out[2]_i_2_n_0\
    );
\Rx_Algn_Data_Out[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(3),
      I1 => data9(2),
      I2 => \mpx__0\(3),
      I3 => \Rx_Algn_Data_Out[7]_i_3_n_0\,
      I4 => \Rx_Algn_Data_Out[9]_i_3_n_0\,
      I5 => \Rx_Algn_Data_Out[3]_i_2_n_0\,
      O => \Rx_Algn_Data_Out[3]_i_1_n_0\
    );
\Rx_Algn_Data_Out[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \rxdh_reg_n_0_[6]\,
      I1 => \rxdh_reg_n_0_[5]\,
      I2 => \mpx__0\(1),
      I3 => \rxdh_reg_n_0_[4]\,
      I4 => \mpx__0\(0),
      I5 => \rxdh_reg_n_0_[3]\,
      O => \Rx_Algn_Data_Out[3]_i_2_n_0\
    );
\Rx_Algn_Data_Out[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(4),
      I1 => data9(3),
      I2 => \mpx__0\(3),
      I3 => \Rx_Algn_Data_Out[8]_i_3_n_0\,
      I4 => \Rx_Algn_Data_Out[9]_i_3_n_0\,
      I5 => \Rx_Algn_Data_Out[4]_i_2_n_0\,
      O => \Rx_Algn_Data_Out[4]_i_1_n_0\
    );
\Rx_Algn_Data_Out[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \rxdh_reg_n_0_[7]\,
      I1 => \rxdh_reg_n_0_[6]\,
      I2 => \mpx__0\(1),
      I3 => \rxdh_reg_n_0_[5]\,
      I4 => \mpx__0\(0),
      I5 => \rxdh_reg_n_0_[4]\,
      O => \Rx_Algn_Data_Out[4]_i_2_n_0\
    );
\Rx_Algn_Data_Out[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(5),
      I1 => data9(4),
      I2 => \mpx__0\(3),
      I3 => \Rx_Algn_Data_Out[9]_i_4_n_0\,
      I4 => \Rx_Algn_Data_Out[9]_i_3_n_0\,
      I5 => \Rx_Algn_Data_Out[5]_i_2_n_0\,
      O => \Rx_Algn_Data_Out[5]_i_1_n_0\
    );
\Rx_Algn_Data_Out[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \rxdh_reg_n_0_[8]\,
      I1 => \rxdh_reg_n_0_[7]\,
      I2 => \mpx__0\(1),
      I3 => \rxdh_reg_n_0_[6]\,
      I4 => \mpx__0\(0),
      I5 => \rxdh_reg_n_0_[5]\,
      O => \Rx_Algn_Data_Out[5]_i_2_n_0\
    );
\Rx_Algn_Data_Out[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(6),
      I1 => data9(5),
      I2 => \mpx__0\(3),
      I3 => \Rx_Algn_Data_Out[6]_i_2_n_0\,
      I4 => \Rx_Algn_Data_Out[9]_i_3_n_0\,
      I5 => \Rx_Algn_Data_Out[6]_i_3_n_0\,
      O => \Rx_Algn_Data_Out[6]_i_1_n_0\
    );
\Rx_Algn_Data_Out[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(4),
      I1 => data9(3),
      I2 => \mpx__0\(1),
      I3 => data9(2),
      I4 => \mpx__0\(0),
      I5 => data9(1),
      O => \Rx_Algn_Data_Out[6]_i_2_n_0\
    );
\Rx_Algn_Data_Out[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(0),
      I1 => \rxdh_reg_n_0_[8]\,
      I2 => \mpx__0\(1),
      I3 => \rxdh_reg_n_0_[7]\,
      I4 => \mpx__0\(0),
      I5 => \rxdh_reg_n_0_[6]\,
      O => \Rx_Algn_Data_Out[6]_i_3_n_0\
    );
\Rx_Algn_Data_Out[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(7),
      I1 => data9(6),
      I2 => \mpx__0\(3),
      I3 => \Rx_Algn_Data_Out[7]_i_2_n_0\,
      I4 => \Rx_Algn_Data_Out[9]_i_3_n_0\,
      I5 => \Rx_Algn_Data_Out[7]_i_3_n_0\,
      O => \Rx_Algn_Data_Out[7]_i_1_n_0\
    );
\Rx_Algn_Data_Out[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(5),
      I1 => data9(4),
      I2 => \mpx__0\(1),
      I3 => data9(3),
      I4 => \mpx__0\(0),
      I5 => data9(2),
      O => \Rx_Algn_Data_Out[7]_i_2_n_0\
    );
\Rx_Algn_Data_Out[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(1),
      I1 => data9(0),
      I2 => \mpx__0\(1),
      I3 => \rxdh_reg_n_0_[8]\,
      I4 => \mpx__0\(0),
      I5 => \rxdh_reg_n_0_[7]\,
      O => \Rx_Algn_Data_Out[7]_i_3_n_0\
    );
\Rx_Algn_Data_Out[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(8),
      I1 => data9(7),
      I2 => \mpx__0\(3),
      I3 => \Rx_Algn_Data_Out[8]_i_2_n_0\,
      I4 => \Rx_Algn_Data_Out[9]_i_3_n_0\,
      I5 => \Rx_Algn_Data_Out[8]_i_3_n_0\,
      O => \Rx_Algn_Data_Out[8]_i_1_n_0\
    );
\Rx_Algn_Data_Out[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(6),
      I1 => data9(5),
      I2 => \mpx__0\(1),
      I3 => data9(4),
      I4 => \mpx__0\(0),
      I5 => data9(3),
      O => \Rx_Algn_Data_Out[8]_i_2_n_0\
    );
\Rx_Algn_Data_Out[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(2),
      I1 => data9(1),
      I2 => \mpx__0\(1),
      I3 => data9(0),
      I4 => \mpx__0\(0),
      I5 => \rxdh_reg_n_0_[8]\,
      O => \Rx_Algn_Data_Out[8]_i_3_n_0\
    );
\Rx_Algn_Data_Out[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(9),
      I1 => data9(8),
      I2 => \mpx__0\(3),
      I3 => \Rx_Algn_Data_Out[9]_i_2_n_0\,
      I4 => \Rx_Algn_Data_Out[9]_i_3_n_0\,
      I5 => \Rx_Algn_Data_Out[9]_i_4_n_0\,
      O => \Rx_Algn_Data_Out[9]_i_1_n_0\
    );
\Rx_Algn_Data_Out[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(7),
      I1 => data9(6),
      I2 => \mpx__0\(1),
      I3 => data9(5),
      I4 => \mpx__0\(0),
      I5 => data9(4),
      O => \Rx_Algn_Data_Out[9]_i_2_n_0\
    );
\Rx_Algn_Data_Out[9]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \mpx__0\(0),
      I1 => \mpx__0\(3),
      I2 => \mpx__0\(2),
      O => \Rx_Algn_Data_Out[9]_i_3_n_0\
    );
\Rx_Algn_Data_Out[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data9(3),
      I1 => data9(2),
      I2 => \mpx__0\(1),
      I3 => data9(1),
      I4 => \mpx__0\(0),
      I5 => data9(0),
      O => \Rx_Algn_Data_Out[9]_i_4_n_0\
    );
\Rx_Algn_Data_Out_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \Rx_Algn_Data_Out[0]_i_1_n_0\,
      Q => al_rx_data_out(0),
      R => '0'
    );
\Rx_Algn_Data_Out_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \Rx_Algn_Data_Out[1]_i_1_n_0\,
      Q => al_rx_data_out(1),
      R => '0'
    );
\Rx_Algn_Data_Out_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \Rx_Algn_Data_Out[2]_i_1_n_0\,
      Q => al_rx_data_out(2),
      R => '0'
    );
\Rx_Algn_Data_Out_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \Rx_Algn_Data_Out[3]_i_1_n_0\,
      Q => al_rx_data_out(3),
      R => '0'
    );
\Rx_Algn_Data_Out_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \Rx_Algn_Data_Out[4]_i_1_n_0\,
      Q => al_rx_data_out(4),
      R => '0'
    );
\Rx_Algn_Data_Out_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \Rx_Algn_Data_Out[5]_i_1_n_0\,
      Q => al_rx_data_out(5),
      R => '0'
    );
\Rx_Algn_Data_Out_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \Rx_Algn_Data_Out[6]_i_1_n_0\,
      Q => al_rx_data_out(6),
      R => '0'
    );
\Rx_Algn_Data_Out_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \Rx_Algn_Data_Out[7]_i_1_n_0\,
      Q => al_rx_data_out(7),
      R => '0'
    );
\Rx_Algn_Data_Out_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \Rx_Algn_Data_Out[8]_i_1_n_0\,
      Q => al_rx_data_out(8),
      R => '0'
    );
\Rx_Algn_Data_Out_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \Rx_Algn_Data_Out[9]_i_1_n_0\,
      Q => al_rx_data_out(9),
      R => '0'
    );
Rx_Algn_Valid_Out_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^rx_valid_int_reg_0\(0),
      I1 => \^aligned\,
      O => Rx_Algn_Valid_Out0
    );
Rx_Algn_Valid_Out_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => Rx_Algn_Valid_Out0,
      Q => E(0),
      R => '0'
    );
Rx_Valid_Int_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000057"
    )
        port map (
      I0 => \toggle_reg_n_0_[2]\,
      I1 => \toggle_reg_n_0_[0]\,
      I2 => \toggle_reg_n_0_[1]\,
      I3 => p_0_in0,
      I4 => \^rx_valid_int_reg_0\(0),
      I5 => \^sr\(0),
      O => Rx_Valid_Int_i_1_n_0
    );
Rx_Valid_Int_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => Rx_Valid_Int_i_1_n_0,
      Q => \^rx_valid_int_reg_0\(0),
      R => '0'
    );
\Slve_CntValIn_Out0_inferred__1/i___0_carry\: unisim.vcomponents.CARRY8
     port map (
      CI => \^actcnt_ge_halfbt_reg_0\,
      CI_TOP => '0',
      CO(7 downto 6) => \NLW_Slve_CntValIn_Out0_inferred__1/i___0_carry_CO_UNCONNECTED\(7 downto 6),
      CO(5) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_2\,
      CO(4) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_3\,
      CO(3) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_4\,
      CO(2) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_5\,
      CO(1) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_6\,
      CO(0) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_7\,
      DI(7 downto 6) => B"00",
      DI(5 downto 0) => \^mstr_cntvalin_out_reg[8]_0\(7 downto 2),
      O(7) => \NLW_Slve_CntValIn_Out0_inferred__1/i___0_carry_O_UNCONNECTED\(7),
      O(6) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_9\,
      O(5) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_10\,
      O(4) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_11\,
      O(3) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_12\,
      O(2) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_13\,
      O(1) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_14\,
      O(0) => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_15\,
      S(7) => '0',
      S(6) => \i___0_carry_i_1__0_n_0\,
      S(5) => \i___0_carry_i_2__0_n_0\,
      S(4) => \i___0_carry_i_3__0_n_0\,
      S(3) => \i___0_carry_i_4__0_n_0\,
      S(2) => \i___0_carry_i_5__0_n_0\,
      S(1) => \i___0_carry_i_6__0_n_0\,
      S(0) => \i___0_carry_i_7__0_n_0\
    );
\Slve_CntValIn_Out[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEAAAAAEEEAAAA"
    )
        port map (
      I0 => \Slve_CntValIn_Out[1]_i_2_n_0\,
      I1 => \^slve_cntvalin_out_reg[0]_0\,
      I2 => \^s_state_reg[4]_0\(1),
      I3 => \^s_state_reg[4]_0\(0),
      I4 => \s_state_reg_n_0_[5]\,
      I5 => \^mstr_cntvalin_out_reg[8]_0\(0),
      O => \Slve_CntValIn_Out[0]_i_1_n_0\
    );
\Slve_CntValIn_Out[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF8F0F0F7F0F0F0"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(1),
      I1 => \^s_state_reg[4]_0\(0),
      I2 => \Slve_CntValIn_Out[1]_i_2_n_0\,
      I3 => \^slve_cntvalin_out_reg[1]_0\,
      I4 => \s_state_reg_n_0_[5]\,
      I5 => \^mstr_cntvalin_out_reg[8]_0\(1),
      O => \Slve_CntValIn_Out[1]_i_1_n_0\
    );
\Slve_CntValIn_Out[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \s_state_reg_n_0_[5]\,
      I1 => \^s_state_reg[4]_0\(0),
      I2 => \^s_state_reg[4]_0\(4),
      I3 => \^activeisslve_reg_0\,
      O => \Slve_CntValIn_Out[1]_i_2_n_0\
    );
\Slve_CntValIn_Out[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE44FE54FE44EE44"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \Slve_CntValIn_Out[2]_i_2_n_0\,
      I2 => \Slve_CntValIn_Out[2]_i_3_n_0\,
      I3 => p_1_in(2),
      I4 => \^s_state_reg[4]_0\(4),
      I5 => \^activeisslve_reg_0\,
      O => \Slve_CntValIn_Out[2]_i_1_n_0\
    );
\Slve_CntValIn_Out[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8CCC8000"
    )
        port map (
      I0 => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_15\,
      I1 => \s_state_reg_n_0_[5]\,
      I2 => \^s_state_reg[4]_0\(0),
      I3 => \^s_state_reg[4]_0\(1),
      I4 => \^q\(0),
      O => \Slve_CntValIn_Out[2]_i_2_n_0\
    );
\Slve_CntValIn_Out[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(0),
      I1 => \s_state_reg_n_0_[5]\,
      O => \Slve_CntValIn_Out[2]_i_3_n_0\
    );
\Slve_CntValIn_Out[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(3),
      I1 => \^sr\(0),
      I2 => \Slve_CntValIn_Out[3]_i_2_n_0\,
      O => \Slve_CntValIn_Out[3]_i_1_n_0\
    );
\Slve_CntValIn_Out[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80BFFFFF80BF0000"
    )
        port map (
      I0 => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_14\,
      I1 => \^s_state_reg[4]_0\(1),
      I2 => \^s_state_reg[4]_0\(0),
      I3 => \^q\(1),
      I4 => \s_state_reg_n_0_[5]\,
      I5 => \Slve_CntValIn_Out[3]_i_3_n_0\,
      O => \Slve_CntValIn_Out[3]_i_2_n_0\
    );
\Slve_CntValIn_Out[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => p_1_in(3),
      I1 => \^s_state_reg[4]_0\(4),
      I2 => \^activeisslve_reg_0\,
      I3 => \^s_state_reg[4]_0\(0),
      I4 => p_1_in(2),
      O => \Slve_CntValIn_Out[3]_i_3_n_0\
    );
\Slve_CntValIn_Out[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => p_1_in(4),
      I1 => \^sr\(0),
      I2 => \Slve_CntValIn_Out[4]_i_2_n_0\,
      I3 => \s_state_reg_n_0_[5]\,
      I4 => \Slve_CntValIn_Out[4]_i_3_n_0\,
      O => \Slve_CntValIn_Out[4]_i_1_n_0\
    );
\Slve_CntValIn_Out[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8CB3B38C"
    )
        port map (
      I0 => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_13\,
      I1 => \^s_state_reg[4]_0\(0),
      I2 => \^s_state_reg[4]_0\(1),
      I3 => \^q\(2),
      I4 => \^q\(1),
      O => \Slve_CntValIn_Out[4]_i_2_n_0\
    );
\Slve_CntValIn_Out[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => p_1_in(4),
      I1 => \^s_state_reg[4]_0\(4),
      I2 => \^activeisslve_reg_0\,
      I3 => \^s_state_reg[4]_0\(0),
      I4 => p_1_in(3),
      O => \Slve_CntValIn_Out[4]_i_3_n_0\
    );
\Slve_CntValIn_Out[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8B8B8B88"
    )
        port map (
      I0 => p_1_in(5),
      I1 => \^sr\(0),
      I2 => \Slve_CntValIn_Out[5]_i_2_n_0\,
      I3 => \Slve_CntValIn_Out[5]_i_3_n_0\,
      I4 => \Slve_CntValIn_Out[5]_i_4_n_0\,
      O => \Slve_CntValIn_Out[5]_i_1_n_0\
    );
\Slve_CntValIn_Out[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000474700FF"
    )
        port map (
      I0 => p_1_in(5),
      I1 => \^s_state_reg[4]_0\(4),
      I2 => \^activeisslve_reg_0\,
      I3 => p_1_in(4),
      I4 => \^s_state_reg[4]_0\(0),
      I5 => \s_state_reg_n_0_[5]\,
      O => \Slve_CntValIn_Out[5]_i_2_n_0\
    );
\Slve_CntValIn_Out[5]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1540"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \Slve_CntValIn_Out[5]_i_3_n_0\
    );
\Slve_CntValIn_Out[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0F0F0F9F9F0F0F"
    )
        port map (
      I0 => \^q\(3),
      I1 => \Slve_CntValIn_Out[5]_i_5_n_0\,
      I2 => \s_state_reg_n_0_[5]\,
      I3 => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_12\,
      I4 => \^s_state_reg[4]_0\(0),
      I5 => \^s_state_reg[4]_0\(1),
      O => \Slve_CntValIn_Out[5]_i_4_n_0\
    );
\Slve_CntValIn_Out[5]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      O => \Slve_CntValIn_Out[5]_i_5_n_0\
    );
\Slve_CntValIn_Out[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8B8B8B88"
    )
        port map (
      I0 => p_1_in(6),
      I1 => \^sr\(0),
      I2 => \Slve_CntValIn_Out[6]_i_2_n_0\,
      I3 => \Slve_CntValIn_Out[6]_i_3_n_0\,
      I4 => \Slve_CntValIn_Out[6]_i_4_n_0\,
      O => \Slve_CntValIn_Out[6]_i_1_n_0\
    );
\Slve_CntValIn_Out[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000474700FF"
    )
        port map (
      I0 => p_1_in(6),
      I1 => \^s_state_reg[4]_0\(4),
      I2 => \^activeisslve_reg_0\,
      I3 => p_1_in(5),
      I4 => \^s_state_reg[4]_0\(0),
      I5 => \s_state_reg_n_0_[5]\,
      O => \Slve_CntValIn_Out[6]_i_2_n_0\
    );
\Slve_CntValIn_Out[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444000000004"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(1),
      I1 => \^s_state_reg[4]_0\(0),
      I2 => \^q\(3),
      I3 => \^q\(2),
      I4 => \^q\(1),
      I5 => \^q\(4),
      O => \Slve_CntValIn_Out[6]_i_3_n_0\
    );
\Slve_CntValIn_Out[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0F9F9F0F0F9F9F"
    )
        port map (
      I0 => \^q\(4),
      I1 => \Slve_CntValIn_Out[6]_i_5_n_0\,
      I2 => \s_state_reg_n_0_[5]\,
      I3 => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_11\,
      I4 => \^s_state_reg[4]_0\(0),
      I5 => \^s_state_reg[4]_0\(1),
      O => \Slve_CntValIn_Out[6]_i_4_n_0\
    );
\Slve_CntValIn_Out[6]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(3),
      O => \Slve_CntValIn_Out[6]_i_5_n_0\
    );
\Slve_CntValIn_Out[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => p_1_in(7),
      I1 => \^sr\(0),
      I2 => \Slve_CntValIn_Out[7]_i_2_n_0\,
      I3 => \s_state_reg_n_0_[5]\,
      I4 => \Slve_CntValIn_Out[7]_i_3_n_0\,
      O => \Slve_CntValIn_Out[7]_i_1_n_0\
    );
\Slve_CntValIn_Out[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B00B8FF8BFFB800"
    )
        port map (
      I0 => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_10\,
      I1 => \^s_state_reg[4]_0\(1),
      I2 => \Slve_CntValIn_Out[7]_i_4_n_0\,
      I3 => \^s_state_reg[4]_0\(0),
      I4 => \^q\(5),
      I5 => \Slve_CntValIn_Out[7]_i_5_n_0\,
      O => \Slve_CntValIn_Out[7]_i_2_n_0\
    );
\Slve_CntValIn_Out[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => p_1_in(6),
      I1 => p_1_in(7),
      I2 => \^s_state_reg[4]_0\(4),
      I3 => \^activeisslve_reg_0\,
      I4 => \^s_state_reg[4]_0\(0),
      O => \Slve_CntValIn_Out[7]_i_3_n_0\
    );
\Slve_CntValIn_Out[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \Slve_CntValIn_Out[7]_i_4_n_0\
    );
\Slve_CntValIn_Out[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(2),
      O => \Slve_CntValIn_Out[7]_i_5_n_0\
    );
\Slve_CntValIn_Out[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABABBAFAAAAAAAA"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \^s_state_reg[4]_0\(4),
      I2 => \s_state_reg_n_0_[5]\,
      I3 => \^s_state_reg[4]_0\(1),
      I4 => \^activeisslve_reg_0\,
      I5 => \Mstr_CntValIn_Out[8]_i_3_n_0\,
      O => \Slve_CntValIn_Out[8]_i_1_n_0\
    );
\Slve_CntValIn_Out[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000AEEA"
    )
        port map (
      I0 => \Slve_CntValIn_Out[8]_i_3_n_0\,
      I1 => \^s_state_reg[5]_0\,
      I2 => \Slve_CntValIn_Out[8]_i_5_n_0\,
      I3 => \^q\(6),
      I4 => \^s_state_reg[4]_0\(4),
      I5 => \^sr\(0),
      O => \Slve_CntValIn_Out[8]_i_2_n_0\
    );
\Slve_CntValIn_Out[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CF0AC00A"
    )
        port map (
      I0 => \^activeisslve_reg_0\,
      I1 => \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_9\,
      I2 => \s_state_reg_n_0_[5]\,
      I3 => \^s_state_reg[4]_0\(1),
      I4 => p_1_in(7),
      O => \Slve_CntValIn_Out[8]_i_3_n_0\
    );
\Slve_CntValIn_Out[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \s_state_reg_n_0_[5]\,
      I1 => \^s_state_reg[4]_0\(1),
      O => \^s_state_reg[5]_0\
    );
\Slve_CntValIn_Out[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000002"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(0),
      I1 => \^q\(5),
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => \^q\(3),
      I5 => \^q\(4),
      O => \Slve_CntValIn_Out[8]_i_5_n_0\
    );
\Slve_CntValIn_Out_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Slve_CntValIn_Out[8]_i_1_n_0\,
      D => \Slve_CntValIn_Out[0]_i_1_n_0\,
      Q => \^slve_cntvalin_out_reg[0]_0\,
      R => \^sr\(0)
    );
\Slve_CntValIn_Out_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Slve_CntValIn_Out[8]_i_1_n_0\,
      D => \Slve_CntValIn_Out[1]_i_1_n_0\,
      Q => \^slve_cntvalin_out_reg[1]_0\,
      R => \^sr\(0)
    );
\Slve_CntValIn_Out_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Slve_CntValIn_Out[8]_i_1_n_0\,
      D => \Slve_CntValIn_Out[2]_i_1_n_0\,
      Q => \^q\(0),
      R => '0'
    );
\Slve_CntValIn_Out_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Slve_CntValIn_Out[8]_i_1_n_0\,
      D => \Slve_CntValIn_Out[3]_i_1_n_0\,
      Q => \^q\(1),
      R => '0'
    );
\Slve_CntValIn_Out_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Slve_CntValIn_Out[8]_i_1_n_0\,
      D => \Slve_CntValIn_Out[4]_i_1_n_0\,
      Q => \^q\(2),
      R => '0'
    );
\Slve_CntValIn_Out_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Slve_CntValIn_Out[8]_i_1_n_0\,
      D => \Slve_CntValIn_Out[5]_i_1_n_0\,
      Q => \^q\(3),
      R => '0'
    );
\Slve_CntValIn_Out_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Slve_CntValIn_Out[8]_i_1_n_0\,
      D => \Slve_CntValIn_Out[6]_i_1_n_0\,
      Q => \^q\(4),
      R => '0'
    );
\Slve_CntValIn_Out_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Slve_CntValIn_Out[8]_i_1_n_0\,
      D => \Slve_CntValIn_Out[7]_i_1_n_0\,
      Q => \^q\(5),
      R => '0'
    );
\Slve_CntValIn_Out_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \Slve_CntValIn_Out[8]_i_1_n_0\,
      D => \Slve_CntValIn_Out[8]_i_2_n_0\,
      Q => \^q\(6),
      R => '0'
    );
\Slve_Load_dly_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \^d\(0),
      Q => Slve_Load_dly(0),
      R => '0'
    );
\Slve_Load_dly_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => Slve_Load_dly(0),
      Q => Slve_Load_dly(1),
      R => '0'
    );
Slve_Load_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000101110110"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(2),
      I1 => \^s_state_reg[4]_0\(3),
      I2 => \s_state_reg_n_0_[5]\,
      I3 => \^s_state_reg[4]_0\(4),
      I4 => \^s_state_reg[4]_0\(0),
      I5 => \^s_state_reg[4]_0\(1),
      O => \s_state_reg[2]_0\
    );
Slve_Load_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(0),
      I1 => \^s_state_reg[4]_0\(1),
      I2 => \^s_state_reg[4]_0\(2),
      O => \s_state_reg[0]_1\
    );
Slve_Load_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEBFFCFFFEFEFD"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(4),
      I1 => \^s_state_reg[4]_0\(3),
      I2 => \^s_state_reg[4]_0\(2),
      I3 => \^s_state_reg[4]_0\(1),
      I4 => \s_state_reg_n_0_[5]\,
      I5 => \^s_state_reg[4]_0\(0),
      O => \s_state_reg[4]_1\
    );
Slve_Load_reg: unisim.vcomponents.FDSE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => Slve_Load_reg_0,
      Q => \^d\(0),
      S => \^sr\(0)
    );
WrapToZero_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => WrapToZero_reg_0,
      Q => WrapToZero,
      R => \^sr\(0)
    );
\act_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => act_count_reg(0),
      O => \act_count[0]_i_1_n_0\
    );
\act_count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => act_count_reg(0),
      I1 => \^active_reg[1]_0\,
      I2 => act_count_reg(1),
      O => \act_count[1]_i_1_n_0\
    );
\act_count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D2B4"
    )
        port map (
      I0 => act_count_reg(0),
      I1 => \^active_reg[1]_0\,
      I2 => act_count_reg(2),
      I3 => act_count_reg(1),
      O => \act_count[2]_i_1_n_0\
    );
\act_count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA96AAA"
    )
        port map (
      I0 => act_count_reg(3),
      I1 => act_count_reg(2),
      I2 => act_count_reg(1),
      I3 => act_count_reg(0),
      I4 => \^active_reg[1]_0\,
      O => \act_count[3]_i_1_n_0\
    );
\act_count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFF4000FFFD0002"
    )
        port map (
      I0 => \^active_reg[1]_0\,
      I1 => act_count_reg(0),
      I2 => act_count_reg(2),
      I3 => act_count_reg(1),
      I4 => act_count_reg(4),
      I5 => act_count_reg(3),
      O => \act_count[4]_i_1_n_0\
    );
\act_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCFFFFFFFFFFFFAF"
    )
        port map (
      I0 => \^act_count_reg[0]_0\,
      I1 => \act_count[5]_i_4_n_0\,
      I2 => \^active_reg[1]_0\,
      I3 => act_count_reg(4),
      I4 => act_count_reg(3),
      I5 => \^act_count_reg[5]_0\(0),
      O => \act_count[5]_i_1_n_0\
    );
\act_count[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFCBF00400340"
    )
        port map (
      I0 => \act_count[5]_i_4_n_0\,
      I1 => act_count_reg(4),
      I2 => act_count_reg(3),
      I3 => \^active_reg[1]_0\,
      I4 => \^act_count_reg[0]_0\,
      I5 => \^act_count_reg[5]_0\(0),
      O => \act_count[5]_i_2_n_0\
    );
\act_count[5]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => act_count_reg(0),
      I1 => act_count_reg(2),
      I2 => act_count_reg(1),
      O => \^act_count_reg[0]_0\
    );
\act_count[5]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => act_count_reg(2),
      I1 => act_count_reg(1),
      I2 => act_count_reg(0),
      O => \act_count[5]_i_4_n_0\
    );
\act_count[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000001"
    )
        port map (
      I0 => \act_count[5]_i_6_n_0\,
      I1 => \active_reg_n_0_[1]\,
      I2 => \active_reg_n_0_[5]\,
      I3 => \active_reg_n_0_[0]\,
      I4 => \active_reg_n_0_[6]\,
      I5 => \act_count[5]_i_7_n_0\,
      O => \^active_reg[1]_0\
    );
\act_count[5]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_reg_n_0_[4]\,
      I1 => \active_reg_n_0_[3]\,
      I2 => \active_reg_n_0_[2]\,
      I3 => \active_reg_n_0_[7]\,
      O => \act_count[5]_i_6_n_0\
    );
\act_count[5]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \active_reg_n_0_[3]\,
      I1 => \active_reg_n_0_[4]\,
      I2 => \active_reg_n_0_[6]\,
      I3 => \active_reg_n_0_[0]\,
      I4 => \act_count[5]_i_8_n_0\,
      O => \act_count[5]_i_7_n_0\
    );
\act_count[5]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \active_reg_n_0_[2]\,
      I1 => \active_reg_n_0_[7]\,
      I2 => \active_reg_n_0_[1]\,
      I3 => \active_reg_n_0_[5]\,
      O => \act_count[5]_i_8_n_0\
    );
\act_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \act_count[5]_i_1_n_0\,
      D => \act_count[0]_i_1_n_0\,
      Q => act_count_reg(0),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\act_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \act_count[5]_i_1_n_0\,
      D => \act_count[1]_i_1_n_0\,
      Q => act_count_reg(1),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\act_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \act_count[5]_i_1_n_0\,
      D => \act_count[2]_i_1_n_0\,
      Q => act_count_reg(2),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\act_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \act_count[5]_i_1_n_0\,
      D => \act_count[3]_i_1_n_0\,
      Q => act_count_reg(3),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\act_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \act_count[5]_i_1_n_0\,
      D => \act_count[4]_i_1_n_0\,
      Q => act_count_reg(4),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\act_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \act_count[5]_i_1_n_0\,
      D => \act_count[5]_i_2_n_0\,
      Q => \^act_count_reg[5]_0\(0),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\active[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => BaseX_Rx_Q_Out(4),
      I1 => \^activeisslve_reg_0\,
      I2 => BaseX_Rx_Q_Out(0),
      O => p_2_out(4)
    );
\active[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => BaseX_Rx_Q_Out(5),
      I1 => \^activeisslve_reg_0\,
      I2 => BaseX_Rx_Q_Out(1),
      O => p_2_out(5)
    );
\active[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => BaseX_Rx_Q_Out(6),
      I1 => \^activeisslve_reg_0\,
      I2 => BaseX_Rx_Q_Out(2),
      O => p_2_out(6)
    );
\active[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => BaseX_Rx_Q_Out(7),
      I1 => \^activeisslve_reg_0\,
      I2 => BaseX_Rx_Q_Out(3),
      O => p_2_out(7)
    );
\active_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \active_reg_n_0_[4]\,
      Q => \active_reg_n_0_[0]\,
      R => \IntReset_dly_reg_n_0_[1]\
    );
\active_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \active_reg_n_0_[5]\,
      Q => \active_reg_n_0_[1]\,
      R => \IntReset_dly_reg_n_0_[1]\
    );
\active_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \active_reg_n_0_[6]\,
      Q => \active_reg_n_0_[2]\,
      R => \IntReset_dly_reg_n_0_[1]\
    );
\active_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \active_reg_n_0_[7]\,
      Q => \active_reg_n_0_[3]\,
      R => \IntReset_dly_reg_n_0_[1]\
    );
\active_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => p_2_out(4),
      Q => \active_reg_n_0_[4]\,
      R => \IntReset_dly_reg_n_0_[1]\
    );
\active_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => p_2_out(5),
      Q => \active_reg_n_0_[5]\,
      R => \IntReset_dly_reg_n_0_[1]\
    );
\active_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => p_2_out(6),
      Q => \active_reg_n_0_[6]\,
      R => \IntReset_dly_reg_n_0_[1]\
    );
\active_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => p_2_out(7),
      Q => \active_reg_n_0_[7]\,
      R => \IntReset_dly_reg_n_0_[1]\
    );
decoded_rxchariscomma_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000308830880000"
    )
        port map (
      I0 => decoded_rxchariscomma_i_2_n_0,
      I1 => al_rx_data_out(7),
      I2 => decoded_rxchariscomma_i_3_n_0,
      I3 => al_rx_data_out(6),
      I4 => al_rx_data_out(9),
      I5 => al_rx_data_out(8),
      O => decoded_rxchariscomma0
    );
decoded_rxchariscomma_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000100000"
    )
        port map (
      I0 => al_rx_data_out(4),
      I1 => al_rx_data_out(3),
      I2 => al_rx_data_out(1),
      I3 => al_rx_data_out(2),
      I4 => al_rx_data_out(0),
      I5 => al_rx_data_out(5),
      O => decoded_rxchariscomma_i_2_n_0
    );
decoded_rxchariscomma_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => al_rx_data_out(4),
      I1 => al_rx_data_out(3),
      I2 => al_rx_data_out(2),
      I3 => al_rx_data_out(1),
      I4 => al_rx_data_out(0),
      I5 => al_rx_data_out(5),
      O => decoded_rxchariscomma_i_3_n_0
    );
\delay_change[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => data0(0),
      I1 => \s_state_reg_n_0_[5]\,
      I2 => \^s_state_reg[4]_0\(4),
      O => delay_change(0)
    );
\delay_change[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => data0(1),
      I1 => \s_state_reg_n_0_[5]\,
      I2 => \^s_state_reg[4]_0\(4),
      O => delay_change(1)
    );
\delay_change[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => data0(2),
      I1 => \s_state_reg_n_0_[5]\,
      I2 => \^s_state_reg[4]_0\(4),
      O => delay_change(2)
    );
\delay_change[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => data0(3),
      I1 => \s_state_reg_n_0_[5]\,
      I2 => \^s_state_reg[4]_0\(4),
      O => delay_change(3)
    );
\delay_change[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => data0(4),
      I1 => \s_state_reg_n_0_[5]\,
      I2 => \^s_state_reg[4]_0\(4),
      O => delay_change(4)
    );
\delay_change[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => data0(5),
      I1 => \s_state_reg_n_0_[5]\,
      I2 => \^s_state_reg[4]_0\(4),
      O => delay_change(5)
    );
\delay_change[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => data0(6),
      I1 => \s_state_reg_n_0_[5]\,
      I2 => \^s_state_reg[4]_0\(4),
      O => delay_change(6)
    );
\delay_change[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400080001"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(1),
      I1 => \^s_state_reg[4]_0\(0),
      I2 => \^s_state_reg[4]_0\(2),
      I3 => \^s_state_reg[4]_0\(3),
      I4 => \s_state_reg_n_0_[5]\,
      I5 => \^s_state_reg[4]_0\(4),
      O => \delay_change[7]_i_1_n_0\
    );
\delay_change[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \s_state_reg_n_0_[5]\,
      I1 => \^s_state_reg[4]_0\(4),
      O => delay_change(7)
    );
\delay_change_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \delay_change[7]_i_1_n_0\,
      D => delay_change(0),
      Q => \delay_change_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\delay_change_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \delay_change[7]_i_1_n_0\,
      D => delay_change(1),
      Q => data0(0),
      R => \^sr\(0)
    );
\delay_change_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \delay_change[7]_i_1_n_0\,
      D => delay_change(2),
      Q => data0(1),
      R => \^sr\(0)
    );
\delay_change_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \delay_change[7]_i_1_n_0\,
      D => delay_change(3),
      Q => data0(2),
      R => \^sr\(0)
    );
\delay_change_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \delay_change[7]_i_1_n_0\,
      D => delay_change(4),
      Q => data0(3),
      R => \^sr\(0)
    );
\delay_change_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \delay_change[7]_i_1_n_0\,
      D => delay_change(5),
      Q => data0(4),
      R => \^sr\(0)
    );
\delay_change_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \delay_change[7]_i_1_n_0\,
      D => delay_change(6),
      Q => data0(5),
      R => \^sr\(0)
    );
\delay_change_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \delay_change[7]_i_1_n_0\,
      D => delay_change(7),
      Q => data0(6),
      R => \^sr\(0)
    );
\dout_i[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF55EE8850F5AAFF"
    )
        port map (
      I0 => al_rx_data_out(9),
      I1 => \dout_i[7]_i_2_n_0\,
      I2 => \dout_i[7]_i_3_n_0\,
      I3 => al_rx_data_out(8),
      I4 => al_rx_data_out(6),
      I5 => al_rx_data_out(7),
      O => b3(5)
    );
\dout_i[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF55EE8850F5AAFF"
    )
        port map (
      I0 => al_rx_data_out(9),
      I1 => \dout_i[7]_i_3_n_0\,
      I2 => \dout_i[7]_i_2_n_0\,
      I3 => al_rx_data_out(8),
      I4 => al_rx_data_out(6),
      I5 => al_rx_data_out(7),
      O => b3(6)
    );
\dout_i[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCCC883033BBFF"
    )
        port map (
      I0 => \dout_i[7]_i_2_n_0\,
      I1 => al_rx_data_out(9),
      I2 => \dout_i[7]_i_3_n_0\,
      I3 => al_rx_data_out(6),
      I4 => al_rx_data_out(8),
      I5 => al_rx_data_out(7),
      O => b3(7)
    );
\dout_i[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => al_rx_data_out(4),
      I1 => al_rx_data_out(2),
      I2 => al_rx_data_out(3),
      I3 => al_rx_data_out(5),
      O => \dout_i[7]_i_2_n_0\
    );
\dout_i[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => al_rx_data_out(4),
      I1 => al_rx_data_out(3),
      I2 => al_rx_data_out(2),
      I3 => al_rx_data_out(5),
      O => \dout_i[7]_i_3_n_0\
    );
g0_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EDA3C33DAAABADB7"
    )
        port map (
      I0 => al_rx_data_out(0),
      I1 => al_rx_data_out(1),
      I2 => al_rx_data_out(2),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(4),
      I5 => al_rx_data_out(5),
      O => \out\(0)
    );
\g0_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"010101170117177F"
    )
        port map (
      I0 => al_rx_data_out(0),
      I1 => al_rx_data_out(1),
      I2 => al_rx_data_out(2),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(4),
      I5 => al_rx_data_out(5),
      O => \g0_b0__0_n_0\
    );
g0_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EDA5A55BCCCDCDB7"
    )
        port map (
      I0 => al_rx_data_out(0),
      I1 => al_rx_data_out(1),
      I2 => al_rx_data_out(2),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(4),
      I5 => al_rx_data_out(5),
      O => \out\(1)
    );
\g0_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEE8E880E8808080"
    )
        port map (
      I0 => al_rx_data_out(0),
      I1 => al_rx_data_out(1),
      I2 => al_rx_data_out(2),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(4),
      I5 => al_rx_data_out(5),
      O => \g0_b1__0_n_0\
    );
g0_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDB19967F0F1E5BF"
    )
        port map (
      I0 => al_rx_data_out(0),
      I1 => al_rx_data_out(1),
      I2 => al_rx_data_out(2),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(4),
      I5 => al_rx_data_out(5),
      O => \out\(2)
    );
\g0_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000080"
    )
        port map (
      I0 => al_rx_data_out(0),
      I1 => al_rx_data_out(1),
      I2 => al_rx_data_out(2),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(4),
      I5 => al_rx_data_out(5),
      O => \g0_b2__0_n_0\
    );
g0_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCA99697FF01FD3F"
    )
        port map (
      I0 => al_rx_data_out(0),
      I1 => al_rx_data_out(1),
      I2 => al_rx_data_out(2),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(4),
      I5 => al_rx_data_out(5),
      O => \out\(3)
    );
g0_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8FF8117FEE9971F"
    )
        port map (
      I0 => al_rx_data_out(0),
      I1 => al_rx_data_out(1),
      I2 => al_rx_data_out(2),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(4),
      I5 => al_rx_data_out(5),
      O => \out\(4)
    );
\gcerr.code_err_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F88080018001011F"
    )
        port map (
      I0 => al_rx_data_out(5),
      I1 => al_rx_data_out(4),
      I2 => al_rx_data_out(0),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(1),
      I5 => al_rx_data_out(2),
      O => \gcerr.code_err_i_10_n_0\
    );
\gcerr.code_err_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F88181179117177F"
    )
        port map (
      I0 => al_rx_data_out(5),
      I1 => al_rx_data_out(4),
      I2 => al_rx_data_out(0),
      I3 => al_rx_data_out(2),
      I4 => al_rx_data_out(1),
      I5 => al_rx_data_out(3),
      O => \gcerr.code_err_i_11_n_0\
    );
\gcerr.code_err_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEE8E881E881891F"
    )
        port map (
      I0 => al_rx_data_out(5),
      I1 => al_rx_data_out(4),
      I2 => al_rx_data_out(0),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(1),
      I5 => al_rx_data_out(2),
      O => \gcerr.code_err_i_12_n_0\
    );
\gcerr.code_err_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8818917D557577F"
    )
        port map (
      I0 => al_rx_data_out(5),
      I1 => al_rx_data_out(2),
      I2 => al_rx_data_out(1),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(0),
      I5 => al_rx_data_out(4),
      O => \gcerr.code_err_i_13_n_0\
    );
\gcerr.code_err_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B8BBB8BB"
    )
        port map (
      I0 => \gcerr.code_err_i_4_n_0\,
      I1 => al_rx_data_out(8),
      I2 => \gcerr.code_err_i_5_n_0\,
      I3 => al_rx_data_out(7),
      I4 => \gcerr.code_err_i_6_n_0\,
      I5 => al_rx_data_out(6),
      O => \gcerr.code_err_i_2_n_0\
    );
\gcerr.code_err_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0FFFFEFE00000"
    )
        port map (
      I0 => \gcerr.code_err_i_7_n_0\,
      I1 => al_rx_data_out(6),
      I2 => al_rx_data_out(7),
      I3 => \gcerr.code_err_i_5_n_0\,
      I4 => al_rx_data_out(8),
      I5 => \gcerr.code_err_i_8_n_0\,
      O => \gcerr.code_err_i_3_n_0\
    );
\gcerr.code_err_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8F3B8C0"
    )
        port map (
      I0 => \gcerr.code_err_i_9_n_0\,
      I1 => al_rx_data_out(7),
      I2 => \gcerr.code_err_i_10_n_0\,
      I3 => al_rx_data_out(6),
      I4 => \gcerr.code_err_i_11_n_0\,
      O => \gcerr.code_err_i_4_n_0\
    );
\gcerr.code_err_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gcerr.code_err_i_12_n_0\,
      I1 => al_rx_data_out(6),
      I2 => \gcerr.code_err_i_11_n_0\,
      O => \gcerr.code_err_i_5_n_0\
    );
\gcerr.code_err_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAFA7FFBFFFFFFF"
    )
        port map (
      I0 => al_rx_data_out(5),
      I1 => al_rx_data_out(4),
      I2 => al_rx_data_out(0),
      I3 => al_rx_data_out(2),
      I4 => al_rx_data_out(1),
      I5 => al_rx_data_out(3),
      O => \gcerr.code_err_i_6_n_0\
    );
\gcerr.code_err_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFDD7FFFDFD97"
    )
        port map (
      I0 => al_rx_data_out(5),
      I1 => al_rx_data_out(0),
      I2 => al_rx_data_out(1),
      I3 => al_rx_data_out(2),
      I4 => al_rx_data_out(3),
      I5 => al_rx_data_out(4),
      O => \gcerr.code_err_i_7_n_0\
    );
\gcerr.code_err_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8F3B8C0"
    )
        port map (
      I0 => \gcerr.code_err_i_12_n_0\,
      I1 => al_rx_data_out(7),
      I2 => \gcerr.code_err_i_10_n_0\,
      I3 => al_rx_data_out(6),
      I4 => \gcerr.code_err_i_13_n_0\,
      O => \gcerr.code_err_i_8_n_0\
    );
\gcerr.code_err_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEE8E889E899899F"
    )
        port map (
      I0 => al_rx_data_out(5),
      I1 => al_rx_data_out(4),
      I2 => al_rx_data_out(0),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(1),
      I5 => al_rx_data_out(2),
      O => \gcerr.code_err_i_9_n_0\
    );
\gcerr.code_err_reg_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gcerr.code_err_i_2_n_0\,
      I1 => \gcerr.code_err_i_3_n_0\,
      O => code_err_i,
      S => al_rx_data_out(9)
    );
\gdeni.disp_err_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555A9818115"
    )
        port map (
      I0 => \g0_b1__0_n_0\,
      I1 => al_rx_data_out(6),
      I2 => al_rx_data_out(7),
      I3 => al_rx_data_out(8),
      I4 => al_rx_data_out(9),
      I5 => \g0_b0__0_n_0\,
      O => \gdeni.disp_err_i_4_n_0\
    );
\gdeni.disp_err_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF11170000"
    )
        port map (
      I0 => al_rx_data_out(6),
      I1 => al_rx_data_out(7),
      I2 => al_rx_data_out(8),
      I3 => al_rx_data_out(9),
      I4 => \g0_b1__0_n_0\,
      I5 => \g0_b0__0_n_0\,
      O => \gdeni.disp_err_i_5_n_0\
    );
\gdeni.disp_err_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333322632262666"
    )
        port map (
      I0 => \g0_b1__0_n_0\,
      I1 => \g0_b0__0_n_0\,
      I2 => al_rx_data_out(8),
      I3 => al_rx_data_out(9),
      I4 => al_rx_data_out(6),
      I5 => al_rx_data_out(7),
      O => \gdeni.disp_err_i_6_n_0\
    );
\gdeni.disp_err_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"54404040AAAAAAAA"
    )
        port map (
      I0 => \g0_b1__0_n_0\,
      I1 => al_rx_data_out(7),
      I2 => al_rx_data_out(6),
      I3 => al_rx_data_out(9),
      I4 => al_rx_data_out(8),
      I5 => \g0_b0__0_n_0\,
      O => \gdeni.disp_err_i_7_n_0\
    );
\gdeni.disp_err_reg_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \gdeni.disp_err_reg_i_2_n_0\,
      I1 => \gdeni.disp_err_reg_i_3_n_0\,
      O => \grdni.run_disp_i_reg\,
      S => \gdeni.disp_err_reg\(0)
    );
\gdeni.disp_err_reg_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gdeni.disp_err_i_4_n_0\,
      I1 => \gdeni.disp_err_i_5_n_0\,
      O => \gdeni.disp_err_reg_i_2_n_0\,
      S => \g0_b2__0_n_0\
    );
\gdeni.disp_err_reg_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gdeni.disp_err_i_6_n_0\,
      I1 => \gdeni.disp_err_i_7_n_0\,
      O => \gdeni.disp_err_reg_i_3_n_0\,
      S => \g0_b2__0_n_0\
    );
gen_io_logic_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => Slve_Load_dly(1),
      I1 => Slve_Load_dly(0),
      O => BaseX_Idly_Load(1)
    );
gen_io_logic_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => Mstr_Load_dly(1),
      I1 => Mstr_Load_dly(0),
      O => BaseX_Idly_Load(0)
    );
\grdni.run_disp_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FCF3310030C020"
    )
        port map (
      I0 => \gdeni.disp_err_reg\(0),
      I1 => \g0_b2__0_n_0\,
      I2 => \grdni.run_disp_i_i_2_n_0\,
      I3 => \g0_b0__0_n_0\,
      I4 => \g0_b1__0_n_0\,
      I5 => \grdni.run_disp_i_i_3_n_0\,
      O => \grdni.run_disp_i_reg_0\
    );
\grdni.run_disp_i_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEA8"
    )
        port map (
      I0 => al_rx_data_out(9),
      I1 => al_rx_data_out(7),
      I2 => al_rx_data_out(6),
      I3 => al_rx_data_out(8),
      O => \grdni.run_disp_i_i_2_n_0\
    );
\grdni.run_disp_i_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA80"
    )
        port map (
      I0 => al_rx_data_out(9),
      I1 => al_rx_data_out(7),
      I2 => al_rx_data_out(6),
      I3 => al_rx_data_out(8),
      O => \grdni.run_disp_i_i_3_n_0\
    );
\hdataout[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \hdataout[0]_i_2_n_0\,
      I1 => \toggle_reg_n_0_[2]\,
      I2 => \holdreg_reg_n_0_[1]\,
      O => \hdataout[0]_i_1_n_0\
    );
\hdataout[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \holdreg_reg_n_0_[5]\,
      I1 => \holdreg_reg_n_0_[4]\,
      I2 => \holdreg_reg_n_0_[3]\,
      I3 => \toggle_reg_n_0_[1]\,
      I4 => \toggle_reg_n_0_[0]\,
      I5 => \holdreg_reg_n_0_[2]\,
      O => \hdataout[0]_i_2_n_0\
    );
\hdataout[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \hdataout[1]_i_2_n_0\,
      I1 => \toggle_reg_n_0_[2]\,
      I2 => \holdreg_reg_n_0_[2]\,
      O => \hdataout[1]_i_1_n_0\
    );
\hdataout[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \holdreg_reg_n_0_[6]\,
      I1 => \holdreg_reg_n_0_[5]\,
      I2 => \holdreg_reg_n_0_[4]\,
      I3 => \toggle_reg_n_0_[1]\,
      I4 => \toggle_reg_n_0_[0]\,
      I5 => \holdreg_reg_n_0_[3]\,
      O => \hdataout[1]_i_2_n_0\
    );
\hdataout[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \hdataout[2]_i_2_n_0\,
      I1 => \toggle_reg_n_0_[2]\,
      I2 => \holdreg_reg_n_0_[3]\,
      O => \hdataout[2]_i_1_n_0\
    );
\hdataout[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \holdreg_reg_n_0_[7]\,
      I1 => \holdreg_reg_n_0_[6]\,
      I2 => \holdreg_reg_n_0_[5]\,
      I3 => \toggle_reg_n_0_[1]\,
      I4 => \toggle_reg_n_0_[0]\,
      I5 => \holdreg_reg_n_0_[4]\,
      O => \hdataout[2]_i_2_n_0\
    );
\hdataout[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \hdataout[3]_i_2_n_0\,
      I1 => \toggle_reg_n_0_[2]\,
      I2 => \holdreg_reg_n_0_[4]\,
      O => \hdataout[3]_i_1_n_0\
    );
\hdataout[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \holdreg_reg_n_0_[8]\,
      I1 => \holdreg_reg_n_0_[7]\,
      I2 => \holdreg_reg_n_0_[6]\,
      I3 => \toggle_reg_n_0_[1]\,
      I4 => \toggle_reg_n_0_[0]\,
      I5 => \holdreg_reg_n_0_[5]\,
      O => \hdataout[3]_i_2_n_0\
    );
\hdataout[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \hdataout[4]_i_2_n_0\,
      I1 => \toggle_reg_n_0_[2]\,
      I2 => \holdreg_reg_n_0_[5]\,
      O => \hdataout[4]_i_1_n_0\
    );
\hdataout[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \holdreg_reg_n_0_[9]\,
      I1 => \holdreg_reg_n_0_[8]\,
      I2 => \holdreg_reg_n_0_[7]\,
      I3 => \toggle_reg_n_0_[1]\,
      I4 => \toggle_reg_n_0_[0]\,
      I5 => \holdreg_reg_n_0_[6]\,
      O => \hdataout[4]_i_2_n_0\
    );
\hdataout[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \hdataout[5]_i_2_n_0\,
      I1 => \toggle_reg_n_0_[2]\,
      I2 => \holdreg_reg_n_0_[6]\,
      O => \hdataout[5]_i_1_n_0\
    );
\hdataout[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \holdreg_reg_n_0_[10]\,
      I1 => \holdreg_reg_n_0_[9]\,
      I2 => \holdreg_reg_n_0_[8]\,
      I3 => \toggle_reg_n_0_[1]\,
      I4 => \toggle_reg_n_0_[0]\,
      I5 => \holdreg_reg_n_0_[7]\,
      O => \hdataout[5]_i_2_n_0\
    );
\hdataout[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \hdataout[6]_i_2_n_0\,
      I1 => \toggle_reg_n_0_[2]\,
      I2 => \holdreg_reg_n_0_[7]\,
      O => \hdataout[6]_i_1_n_0\
    );
\hdataout[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \holdreg_reg_n_0_[11]\,
      I1 => \holdreg_reg_n_0_[10]\,
      I2 => \holdreg_reg_n_0_[8]\,
      I3 => \toggle_reg_n_0_[0]\,
      I4 => \toggle_reg_n_0_[1]\,
      I5 => \holdreg_reg_n_0_[9]\,
      O => \hdataout[6]_i_2_n_0\
    );
\hdataout[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \hdataout[7]_i_2_n_0\,
      I1 => \toggle_reg_n_0_[2]\,
      I2 => \holdreg_reg_n_0_[8]\,
      O => \hdataout[7]_i_1_n_0\
    );
\hdataout[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \holdreg_reg_n_0_[12]\,
      I1 => \holdreg_reg_n_0_[11]\,
      I2 => \holdreg_reg_n_0_[10]\,
      I3 => \toggle_reg_n_0_[1]\,
      I4 => \toggle_reg_n_0_[0]\,
      I5 => \holdreg_reg_n_0_[9]\,
      O => \hdataout[7]_i_2_n_0\
    );
\hdataout[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \hdataout[8]_i_2_n_0\,
      I1 => \toggle_reg_n_0_[2]\,
      I2 => \holdreg_reg_n_0_[9]\,
      O => \hdataout[8]_i_1_n_0\
    );
\hdataout[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \holdreg_reg_n_0_[13]\,
      I1 => \holdreg_reg_n_0_[12]\,
      I2 => \holdreg_reg_n_0_[11]\,
      I3 => \toggle_reg_n_0_[1]\,
      I4 => \toggle_reg_n_0_[0]\,
      I5 => \holdreg_reg_n_0_[10]\,
      O => \hdataout[8]_i_2_n_0\
    );
\hdataout[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0155"
    )
        port map (
      I0 => p_0_in0,
      I1 => \toggle_reg_n_0_[1]\,
      I2 => \toggle_reg_n_0_[0]\,
      I3 => \toggle_reg_n_0_[2]\,
      O => p_1_out
    );
\hdataout[9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \hdataout[9]_i_3_n_0\,
      I1 => \toggle_reg_n_0_[2]\,
      I2 => \holdreg_reg_n_0_[10]\,
      O => \hdataout[9]_i_2_n_0\
    );
\hdataout[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \holdreg_reg_n_0_[14]\,
      I1 => \holdreg_reg_n_0_[13]\,
      I2 => \holdreg_reg_n_0_[12]\,
      I3 => \toggle_reg_n_0_[1]\,
      I4 => \toggle_reg_n_0_[0]\,
      I5 => \holdreg_reg_n_0_[11]\,
      O => \hdataout[9]_i_3_n_0\
    );
\hdataout_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => p_1_out,
      D => \hdataout[0]_i_1_n_0\,
      Q => hdataout(0),
      R => \^sr\(0)
    );
\hdataout_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => p_1_out,
      D => \hdataout[1]_i_1_n_0\,
      Q => hdataout(1),
      R => \^sr\(0)
    );
\hdataout_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => p_1_out,
      D => \hdataout[2]_i_1_n_0\,
      Q => hdataout(2),
      R => \^sr\(0)
    );
\hdataout_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => p_1_out,
      D => \hdataout[3]_i_1_n_0\,
      Q => hdataout(3),
      R => \^sr\(0)
    );
\hdataout_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => p_1_out,
      D => \hdataout[4]_i_1_n_0\,
      Q => hdataout(4),
      R => \^sr\(0)
    );
\hdataout_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => p_1_out,
      D => \hdataout[5]_i_1_n_0\,
      Q => hdataout(5),
      R => \^sr\(0)
    );
\hdataout_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => p_1_out,
      D => \hdataout[6]_i_1_n_0\,
      Q => hdataout(6),
      R => \^sr\(0)
    );
\hdataout_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => p_1_out,
      D => \hdataout[7]_i_1_n_0\,
      Q => hdataout(7),
      R => \^sr\(0)
    );
\hdataout_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => p_1_out,
      D => \hdataout[8]_i_1_n_0\,
      Q => hdataout(8),
      R => \^sr\(0)
    );
\hdataout_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => p_1_out,
      D => \hdataout[9]_i_2_n_0\,
      Q => hdataout(9),
      R => \^sr\(0)
    );
\holdreg[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \holdreg_reg_n_0_[13]\,
      I1 => \^insert3_reg_0\,
      I2 => \active_reg_n_0_[4]\,
      I3 => \^insert5_reg_0\,
      I4 => \holdreg_reg_n_0_[14]\,
      O => \holdreg[10]_i_1_n_0\
    );
\holdreg[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \holdreg_reg_n_0_[14]\,
      I1 => \^insert3_reg_0\,
      I2 => \active_reg_n_0_[5]\,
      I3 => \^insert5_reg_0\,
      I4 => \active_reg_n_0_[4]\,
      O => \holdreg[11]_i_1_n_0\
    );
\holdreg[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \active_reg_n_0_[4]\,
      I1 => \^insert3_reg_0\,
      I2 => \active_reg_n_0_[6]\,
      I3 => \^insert5_reg_0\,
      I4 => \active_reg_n_0_[5]\,
      O => \holdreg[12]_i_1_n_0\
    );
\holdreg[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \active_reg_n_0_[5]\,
      I1 => \^insert3_reg_0\,
      I2 => \active_reg_n_0_[7]\,
      I3 => \^insert5_reg_0\,
      I4 => \active_reg_n_0_[6]\,
      O => \holdreg[13]_i_1_n_0\
    );
\holdreg[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \active_reg_n_0_[6]\,
      I1 => \^insert3_reg_0\,
      I2 => p_3_out(4),
      I3 => \^insert5_reg_0\,
      I4 => \active_reg_n_0_[7]\,
      O => \holdreg[14]_i_1_n_0\
    );
\holdreg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \holdreg_reg_n_0_[4]\,
      I1 => \^insert3_reg_0\,
      I2 => \holdreg_reg_n_0_[6]\,
      I3 => \^insert5_reg_0\,
      I4 => \holdreg_reg_n_0_[5]\,
      O => \holdreg[1]_i_1_n_0\
    );
\holdreg[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \holdreg_reg_n_0_[5]\,
      I1 => \^insert3_reg_0\,
      I2 => \holdreg_reg_n_0_[7]\,
      I3 => \^insert5_reg_0\,
      I4 => \holdreg_reg_n_0_[6]\,
      O => \holdreg[2]_i_1_n_0\
    );
\holdreg[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \holdreg_reg_n_0_[6]\,
      I1 => \^insert3_reg_0\,
      I2 => \holdreg_reg_n_0_[8]\,
      I3 => \^insert5_reg_0\,
      I4 => \holdreg_reg_n_0_[7]\,
      O => \holdreg[3]_i_1_n_0\
    );
\holdreg[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \holdreg_reg_n_0_[7]\,
      I1 => \^insert3_reg_0\,
      I2 => \holdreg_reg_n_0_[9]\,
      I3 => \^insert5_reg_0\,
      I4 => \holdreg_reg_n_0_[8]\,
      O => \holdreg[4]_i_1_n_0\
    );
\holdreg[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \holdreg_reg_n_0_[8]\,
      I1 => \^insert3_reg_0\,
      I2 => \holdreg_reg_n_0_[10]\,
      I3 => \^insert5_reg_0\,
      I4 => \holdreg_reg_n_0_[9]\,
      O => \holdreg[5]_i_1_n_0\
    );
\holdreg[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \holdreg_reg_n_0_[9]\,
      I1 => \^insert3_reg_0\,
      I2 => \holdreg_reg_n_0_[11]\,
      I3 => \^insert5_reg_0\,
      I4 => \holdreg_reg_n_0_[10]\,
      O => \holdreg[6]_i_1_n_0\
    );
\holdreg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \holdreg_reg_n_0_[10]\,
      I1 => \^insert3_reg_0\,
      I2 => \holdreg_reg_n_0_[12]\,
      I3 => \^insert5_reg_0\,
      I4 => \holdreg_reg_n_0_[11]\,
      O => \holdreg[7]_i_1_n_0\
    );
\holdreg[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \holdreg_reg_n_0_[11]\,
      I1 => \^insert3_reg_0\,
      I2 => \holdreg_reg_n_0_[13]\,
      I3 => \^insert5_reg_0\,
      I4 => \holdreg_reg_n_0_[12]\,
      O => \holdreg[8]_i_1_n_0\
    );
\holdreg[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \holdreg_reg_n_0_[12]\,
      I1 => \^insert3_reg_0\,
      I2 => \holdreg_reg_n_0_[14]\,
      I3 => \^insert5_reg_0\,
      I4 => \holdreg_reg_n_0_[13]\,
      O => \holdreg[9]_i_1_n_0\
    );
\holdreg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[10]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[10]\,
      R => \^sr\(0)
    );
\holdreg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[11]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[11]\,
      R => \^sr\(0)
    );
\holdreg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[12]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[12]\,
      R => \^sr\(0)
    );
\holdreg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[13]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[13]\,
      R => \^sr\(0)
    );
\holdreg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[14]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[14]\,
      R => \^sr\(0)
    );
\holdreg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[1]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[1]\,
      R => \^sr\(0)
    );
\holdreg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[2]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[2]\,
      R => \^sr\(0)
    );
\holdreg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[3]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[3]\,
      R => \^sr\(0)
    );
\holdreg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[4]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[4]\,
      R => \^sr\(0)
    );
\holdreg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[5]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[5]\,
      R => \^sr\(0)
    );
\holdreg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[6]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[6]\,
      R => \^sr\(0)
    );
\holdreg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[7]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[7]\,
      R => \^sr\(0)
    );
\holdreg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[8]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[8]\,
      R => \^sr\(0)
    );
\holdreg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \holdreg[9]_i_1_n_0\,
      Q => \holdreg_reg_n_0_[9]\,
      R => \^sr\(0)
    );
\i___0_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^actcnt_ge_halfbt_reg_0\,
      I1 => \^q\(6),
      O => \i___0_carry_i_1_n_0\
    );
\i___0_carry_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^actcnt_ge_halfbt_reg_0\,
      I1 => \^mstr_cntvalin_out_reg[8]_0\(8),
      O => \i___0_carry_i_1__0_n_0\
    );
\i___0_carry_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(7),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^q\(5),
      O => \i___0_carry_i_2_n_0\
    );
\i___0_carry_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(7),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^mstr_cntvalin_out_reg[8]_0\(7),
      O => \i___0_carry_i_2__0_n_0\
    );
\i___0_carry_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(6),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^q\(4),
      O => \i___0_carry_i_3_n_0\
    );
\i___0_carry_i_3__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(6),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^mstr_cntvalin_out_reg[8]_0\(6),
      O => \i___0_carry_i_3__0_n_0\
    );
\i___0_carry_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(5),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^q\(3),
      O => \i___0_carry_i_4_n_0\
    );
\i___0_carry_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(5),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^mstr_cntvalin_out_reg[8]_0\(5),
      O => \i___0_carry_i_4__0_n_0\
    );
\i___0_carry_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(4),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^q\(2),
      O => \i___0_carry_i_5_n_0\
    );
\i___0_carry_i_5__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(4),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^mstr_cntvalin_out_reg[8]_0\(4),
      O => \i___0_carry_i_5__0_n_0\
    );
\i___0_carry_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(3),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^q\(1),
      O => \i___0_carry_i_6_n_0\
    );
\i___0_carry_i_6__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(3),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^mstr_cntvalin_out_reg[8]_0\(3),
      O => \i___0_carry_i_6__0_n_0\
    );
\i___0_carry_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(2),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^q\(0),
      O => \i___0_carry_i_7_n_0\
    );
\i___0_carry_i_7__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_1_in(2),
      I1 => \^actcnt_ge_halfbt_reg_0\,
      I2 => \^mstr_cntvalin_out_reg[8]_0\(2),
      O => \i___0_carry_i_7__0_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => p_1_in(7),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(7),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(6),
      I3 => p_1_in(6),
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => p_1_in(5),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(5),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(4),
      I3 => p_1_in(4),
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => p_1_in(3),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(3),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(2),
      I3 => p_1_in(2),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(0),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(1),
      O => \i__carry_i_4_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(8),
      O => \i__carry_i_5_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(7),
      I1 => p_1_in(7),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(6),
      I3 => p_1_in(6),
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(5),
      I1 => p_1_in(5),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(4),
      I3 => p_1_in(4),
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(3),
      I1 => p_1_in(3),
      I2 => \^mstr_cntvalin_out_reg[8]_0\(2),
      I3 => p_1_in(2),
      O => \i__carry_i_8_n_0\
    );
\i__carry_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^mstr_cntvalin_out_reg[8]_0\(1),
      I1 => \^mstr_cntvalin_out_reg[8]_0\(0),
      O => \i__carry_i_9_n_0\
    );
insert3_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => insert3_reg_1,
      Q => \^insert3_reg_0\,
      R => \^sr\(0)
    );
insert5_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30000001"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(3),
      I1 => \s_state_reg_n_0_[5]\,
      I2 => \^s_state_reg[4]_0\(1),
      I3 => \^s_state_reg[4]_0\(2),
      I4 => \^s_state_reg[4]_0\(0),
      O => \s_state_reg[3]_0\
    );
insert5_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => insert5_reg_1,
      Q => \^insert5_reg_0\,
      R => \^sr\(0)
    );
kout_i_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F10101010000000F"
    )
        port map (
      I0 => al_rx_data_out(8),
      I1 => al_rx_data_out(7),
      I2 => al_rx_data_out(5),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(2),
      I5 => al_rx_data_out(4),
      O => kout_i_i_2_n_0
    );
kout_i_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F00000008080808F"
    )
        port map (
      I0 => al_rx_data_out(7),
      I1 => al_rx_data_out(8),
      I2 => al_rx_data_out(5),
      I3 => al_rx_data_out(3),
      I4 => al_rx_data_out(2),
      I5 => al_rx_data_out(4),
      O => kout_i_i_3_n_0
    );
kout_i_reg_i_1: unisim.vcomponents.MUXF7
     port map (
      I0 => kout_i_i_2_n_0,
      I1 => kout_i_i_3_n_0,
      O => k,
      S => al_rx_data_out(9)
    );
\monitor[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => BaseX_Rx_Q_Out(0),
      I1 => \^activeisslve_reg_0\,
      I2 => BaseX_Rx_Q_Out(4),
      O => p_3_out(4)
    );
\monitor[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => BaseX_Rx_Q_Out(1),
      I1 => \^activeisslve_reg_0\,
      I2 => BaseX_Rx_Q_Out(5),
      O => p_3_out(5)
    );
\monitor[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => BaseX_Rx_Q_Out(2),
      I1 => \^activeisslve_reg_0\,
      I2 => BaseX_Rx_Q_Out(6),
      O => p_3_out(6)
    );
\monitor[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => BaseX_Rx_Q_Out(3),
      I1 => \^activeisslve_reg_0\,
      I2 => BaseX_Rx_Q_Out(7),
      O => p_3_out(7)
    );
monitor_late_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000002008"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(0),
      I1 => \^s_state_reg[4]_0\(4),
      I2 => \s_state_reg_n_0_[5]\,
      I3 => \^s_state_reg[4]_0\(1),
      I4 => \^s_state_reg[4]_0\(2),
      I5 => \^s_state_reg[4]_0\(3),
      O => \s_state_reg[0]_0\
    );
monitor_late_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => monitor_late_reg_1,
      Q => \^monitor_late_reg_0\,
      R => \^sr\(0)
    );
\monitor_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => monitor(7),
      Q => monitor(3),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\monitor_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => p_3_out(4),
      Q => monitor(4),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\monitor_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => p_3_out(5),
      Q => monitor(5),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\monitor_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => p_3_out(6),
      Q => monitor(6),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\monitor_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => p_3_out(7),
      Q => monitor(7),
      R => \IntReset_dly_reg_n_0_[1]\
    );
\mpx[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555500000004"
    )
        port map (
      I0 => \mpx[0]_i_2_n_0\,
      I1 => \mpx[0]_i_3_n_0\,
      I2 => \mpx[0]_i_4_n_0\,
      I3 => \mpx[0]_i_5_n_0\,
      I4 => \mpx[0]_i_6_n_0\,
      I5 => \mpx[3]_i_6_n_0\,
      O => \mpx[0]_i_1_n_0\
    );
\mpx[0]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \rxdh_reg_n_0_[4]\,
      I1 => \rxdh_reg_n_0_[5]\,
      I2 => \rxdh_reg_n_0_[7]\,
      I3 => \rxdh_reg_n_0_[8]\,
      O => \mpx[0]_i_10_n_0\
    );
\mpx[0]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \rxdh_reg_n_0_[3]\,
      I1 => \rxdh_reg_n_0_[6]\,
      I2 => \rxdh_reg_n_0_[2]\,
      O => \mpx[0]_i_11_n_0\
    );
\mpx[0]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \rxdh_reg_n_0_[6]\,
      I1 => data9(4),
      I2 => \rxdh_reg_n_0_[8]\,
      O => \mpx[0]_i_12_n_0\
    );
\mpx[0]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => data9(2),
      I1 => data9(3),
      I2 => data9(0),
      I3 => data9(1),
      O => \mpx[0]_i_13_n_0\
    );
\mpx[0]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => data9(6),
      I1 => data9(5),
      O => \mpx[0]_i_14_n_0\
    );
\mpx[0]_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => \rxdh_reg_n_0_[6]\,
      I1 => \rxdh_reg_n_0_[8]\,
      I2 => data9(4),
      O => \mpx[0]_i_15_n_0\
    );
\mpx[0]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => data9(2),
      I1 => data9(3),
      I2 => data9(0),
      I3 => data9(1),
      O => \mpx[0]_i_16_n_0\
    );
\mpx[0]_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => data9(5),
      I1 => data9(2),
      I2 => data9(3),
      O => \mpx[0]_i_17_n_0\
    );
\mpx[0]_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFDFF"
    )
        port map (
      I0 => data9(4),
      I1 => \rxdh_reg_n_0_[8]\,
      I2 => data9(6),
      I3 => data9(1),
      I4 => data9(0),
      O => \mpx[0]_i_18_n_0\
    );
\mpx[0]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => data9(2),
      I1 => data9(3),
      I2 => \rxdh_reg_n_0_[8]\,
      I3 => data9(4),
      O => \mpx[0]_i_19_n_0\
    );
\mpx[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \mpx[3]_i_7_n_0\,
      O => \mpx[0]_i_2_n_0\
    );
\mpx[0]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => data9(5),
      I1 => data9(1),
      I2 => data9(6),
      I3 => data9(0),
      O => \mpx[0]_i_20_n_0\
    );
\mpx[0]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \rxdh_reg_n_0_[7]\,
      I1 => \rxdh_reg_n_0_[8]\,
      I2 => \rxdh_reg_n_0_[6]\,
      I3 => data9(2),
      O => \mpx[0]_i_21_n_0\
    );
\mpx[0]_i_22\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => data9(0),
      I1 => data9(1),
      I2 => \rxdh_reg_n_0_[4]\,
      I3 => \rxdh_reg_n_0_[5]\,
      O => \mpx[0]_i_22_n_0\
    );
\mpx[0]_i_23\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \rxdh_reg_n_0_[6]\,
      I1 => data9(2),
      I2 => data9(0),
      I3 => data9(1),
      O => \mpx[0]_i_23_n_0\
    );
\mpx[0]_i_24\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => \rxdh_reg_n_0_[7]\,
      I1 => \rxdh_reg_n_0_[8]\,
      I2 => \rxdh_reg_n_0_[4]\,
      I3 => \rxdh_reg_n_0_[5]\,
      O => \mpx[0]_i_24_n_0\
    );
\mpx[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFEFAAEFFFEF"
    )
        port map (
      I0 => \mpx[0]_i_7_n_0\,
      I1 => \mpx[0]_i_8_n_0\,
      I2 => \mpx[0]_i_9_n_0\,
      I3 => data9(0),
      I4 => \mpx[0]_i_10_n_0\,
      I5 => \mpx[0]_i_11_n_0\,
      O => \mpx[0]_i_3_n_0\
    );
\mpx[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0200020F02000200"
    )
        port map (
      I0 => \mpx[0]_i_12_n_0\,
      I1 => \mpx[0]_i_13_n_0\,
      I2 => \mpx[0]_i_14_n_0\,
      I3 => \rxdh_reg_n_0_[7]\,
      I4 => \mpx[0]_i_15_n_0\,
      I5 => \mpx[0]_i_16_n_0\,
      O => \mpx[0]_i_4_n_0\
    );
\mpx[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000022F222F20000"
    )
        port map (
      I0 => \mpx[0]_i_17_n_0\,
      I1 => \mpx[0]_i_18_n_0\,
      I2 => \mpx[0]_i_19_n_0\,
      I3 => \mpx[0]_i_20_n_0\,
      I4 => data9(7),
      I5 => data9(8),
      O => \mpx[0]_i_5_n_0\
    );
\mpx[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000022F222F20000"
    )
        port map (
      I0 => \mpx[0]_i_21_n_0\,
      I1 => \mpx[0]_i_22_n_0\,
      I2 => \mpx[0]_i_23_n_0\,
      I3 => \mpx[0]_i_24_n_0\,
      I4 => data9(4),
      I5 => data9(3),
      O => \mpx[0]_i_6_n_0\
    );
\mpx[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => data9(2),
      I1 => data9(1),
      O => \mpx[0]_i_7_n_0\
    );
\mpx[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \rxdh_reg_n_0_[4]\,
      I1 => \rxdh_reg_n_0_[5]\,
      I2 => \rxdh_reg_n_0_[7]\,
      I3 => \rxdh_reg_n_0_[8]\,
      O => \mpx[0]_i_8_n_0\
    );
\mpx[0]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \rxdh_reg_n_0_[2]\,
      I1 => \rxdh_reg_n_0_[6]\,
      I2 => \rxdh_reg_n_0_[3]\,
      O => \mpx[0]_i_9_n_0\
    );
\mpx[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000101"
    )
        port map (
      I0 => \mpx[3]_i_6_n_0\,
      I1 => \mpx[3]_i_7_n_0\,
      I2 => \^sr\(0),
      I3 => \^rxdh_reg[7]_0\,
      I4 => \mpx[1]_i_2_n_0\,
      O => \mpx[1]_i_1_n_0\
    );
\mpx[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000099F9"
    )
        port map (
      I0 => data9(6),
      I1 => data9(7),
      I2 => \mpx[1]_i_3_n_0\,
      I3 => \mpx[1]_i_4_n_0\,
      I4 => \mpx[0]_i_4_n_0\,
      O => \mpx[1]_i_2_n_0\
    );
\mpx[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFBFFFF"
    )
        port map (
      I0 => data9(5),
      I1 => data9(4),
      I2 => \rxdh_reg_n_0_[8]\,
      I3 => \rxdh_reg_n_0_[7]\,
      I4 => \mpx[0]_i_16_n_0\,
      O => \mpx[1]_i_3_n_0\
    );
\mpx[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => \mpx[0]_i_19_n_0\,
      I1 => \rxdh_reg_n_0_[7]\,
      I2 => data9(5),
      I3 => data9(1),
      I4 => data9(0),
      O => \mpx[1]_i_4_n_0\
    );
\mpx[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \mpx[3]_i_6_n_0\,
      I1 => \mpx[3]_i_7_n_0\,
      I2 => \^sr\(0),
      I3 => \^rxdh_reg[16]_0\,
      I4 => \^rxdh_reg[7]_0\,
      O => \mpx[2]_i_1_n_0\
    );
\mpx[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFBAAAA"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \^rxdh_reg[16]_0\,
      I2 => \^rxdh_reg[18]_0\,
      I3 => \^rxdh_reg[7]_0\,
      I4 => \^rx_valid_int_reg_0\(0),
      O => \mpx[3]_i_1_n_0\
    );
\mpx[3]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40400000404000FF"
    )
        port map (
      I0 => \mpx[3]_i_26_n_0\,
      I1 => data9(5),
      I2 => data9(2),
      I3 => \mpx[3]_i_27_n_0\,
      I4 => data9(3),
      I5 => data9(4),
      O => \mpx[3]_i_10_n_0\
    );
\mpx[3]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => \rxdh_reg_n_0_[8]\,
      I1 => data9(1),
      I2 => \rxdh_reg_n_0_[3]\,
      I3 => data9(0),
      I4 => \rxdh_reg_n_0_[4]\,
      I5 => \mpx[3]_i_28_n_0\,
      O => \mpx[3]_i_11_n_0\
    );
\mpx[3]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => data9(1),
      I1 => \rxdh_reg_n_0_[4]\,
      I2 => \rxdh_reg_n_0_[3]\,
      I3 => data9(0),
      I4 => \rxdh_reg_n_0_[8]\,
      I5 => \mpx[3]_i_29_n_0\,
      O => \mpx[3]_i_12_n_0\
    );
\mpx[3]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \rxdh_reg_n_0_[4]\,
      I1 => \rxdh_reg_n_0_[5]\,
      I2 => \rxdh_reg_n_0_[3]\,
      I3 => \rxdh_reg_n_0_[6]\,
      O => \mpx[3]_i_13_n_0\
    );
\mpx[3]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => \rxdh_reg_n_0_[2]\,
      I1 => \rxdh_reg_n_0_[7]\,
      I2 => \rxdh_reg_n_0_[1]\,
      I3 => \rxdh_reg_n_0_[8]\,
      O => \mpx[3]_i_14_n_0\
    );
\mpx[3]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \rxdh_reg_n_0_[3]\,
      I1 => \rxdh_reg_n_0_[6]\,
      I2 => \rxdh_reg_n_0_[1]\,
      I3 => \rxdh_reg_n_0_[2]\,
      O => \mpx[3]_i_15_n_0\
    );
\mpx[3]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \rxdh_reg_n_0_[4]\,
      I1 => \rxdh_reg_n_0_[7]\,
      I2 => \rxdh_reg_n_0_[5]\,
      I3 => \rxdh_reg_n_0_[8]\,
      O => \mpx[3]_i_16_n_0\
    );
\mpx[3]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \rxdh_reg_n_0_[3]\,
      I1 => \rxdh_reg_n_0_[6]\,
      I2 => \rxdh_reg_n_0_[0]\,
      I3 => \rxdh_reg_n_0_[1]\,
      O => \mpx[3]_i_17_n_0\
    );
\mpx[3]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \rxdh_reg_n_0_[4]\,
      I1 => \rxdh_reg_n_0_[5]\,
      I2 => \rxdh_reg_n_0_[2]\,
      I3 => \rxdh_reg_n_0_[7]\,
      O => \mpx[3]_i_18_n_0\
    );
\mpx[3]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \rxdh_reg_n_0_[0]\,
      I1 => \rxdh_reg_n_0_[7]\,
      I2 => \rxdh_reg_n_0_[1]\,
      I3 => \rxdh_reg_n_0_[2]\,
      O => \mpx[3]_i_19_n_0\
    );
\mpx[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \mpx[3]_i_6_n_0\,
      I1 => \mpx[3]_i_7_n_0\,
      I2 => \^sr\(0),
      I3 => \^rxdh_reg[16]_0\,
      I4 => \^rxdh_reg[7]_0\,
      O => \mpx[3]_i_2_n_0\
    );
\mpx[3]_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \rxdh_reg_n_0_[8]\,
      I1 => \rxdh_reg_n_0_[7]\,
      O => \mpx[3]_i_20_n_0\
    );
\mpx[3]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => data9(0),
      I1 => data9(1),
      I2 => data9(5),
      I3 => \rxdh_reg_n_0_[7]\,
      O => \mpx[3]_i_21_n_0\
    );
\mpx[3]_i_22\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => data9(1),
      I1 => data9(2),
      I2 => data9(3),
      I3 => data9(0),
      O => \mpx[3]_i_22_n_0\
    );
\mpx[3]_i_23\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => \rxdh_reg_n_0_[7]\,
      I1 => \rxdh_reg_n_0_[8]\,
      I2 => \rxdh_reg_n_0_[5]\,
      I3 => \rxdh_reg_n_0_[6]\,
      O => \mpx[3]_i_23_n_0\
    );
\mpx[3]_i_24\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \rxdh_reg_n_0_[7]\,
      I1 => \rxdh_reg_n_0_[8]\,
      I2 => data9(1),
      I3 => data9(2),
      O => \mpx[3]_i_24_n_0\
    );
\mpx[3]_i_25\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \rxdh_reg_n_0_[5]\,
      I1 => \rxdh_reg_n_0_[6]\,
      I2 => data9(0),
      I3 => data9(3),
      O => \mpx[3]_i_25_n_0\
    );
\mpx[3]_i_26\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFDF"
    )
        port map (
      I0 => data9(6),
      I1 => data9(7),
      I2 => data9(4),
      I3 => data9(1),
      I4 => data9(0),
      O => \mpx[3]_i_26_n_0\
    );
\mpx[3]_i_27\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF7F"
    )
        port map (
      I0 => data9(7),
      I1 => data9(1),
      I2 => data9(0),
      I3 => data9(6),
      I4 => data9(5),
      I5 => data9(2),
      O => \mpx[3]_i_27_n_0\
    );
\mpx[3]_i_28\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \rxdh_reg_n_0_[6]\,
      I1 => \rxdh_reg_n_0_[5]\,
      O => \mpx[3]_i_28_n_0\
    );
\mpx[3]_i_29\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \rxdh_reg_n_0_[6]\,
      I1 => \rxdh_reg_n_0_[5]\,
      O => \mpx[3]_i_29_n_0\
    );
\mpx[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000005445"
    )
        port map (
      I0 => \mpx[0]_i_4_n_0\,
      I1 => \mpx[3]_i_8_n_0\,
      I2 => data9(7),
      I3 => data9(6),
      I4 => \mpx[0]_i_6_n_0\,
      I5 => \mpx[3]_i_9_n_0\,
      O => \^rxdh_reg[16]_0\
    );
\mpx[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF60"
    )
        port map (
      I0 => data9(9),
      I1 => data9(8),
      I2 => \mpx[3]_i_10_n_0\,
      I3 => \mpx[3]_i_7_n_0\,
      I4 => \mpx[3]_i_6_n_0\,
      I5 => \mpx[0]_i_5_n_0\,
      O => \^rxdh_reg[18]_0\
    );
\mpx[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55FDFD55555D5D55"
    )
        port map (
      I0 => \mpx[0]_i_3_n_0\,
      I1 => \mpx[3]_i_11_n_0\,
      I2 => \rxdh_reg_n_0_[7]\,
      I3 => data9(3),
      I4 => data9(2),
      I5 => \mpx[3]_i_12_n_0\,
      O => \^rxdh_reg[7]_0\
    );
\mpx[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000022F222F20000"
    )
        port map (
      I0 => \mpx[3]_i_13_n_0\,
      I1 => \mpx[3]_i_14_n_0\,
      I2 => \mpx[3]_i_15_n_0\,
      I3 => \mpx[3]_i_16_n_0\,
      I4 => data9(0),
      I5 => data9(1),
      O => \mpx[3]_i_6_n_0\
    );
\mpx[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000022F222F20000"
    )
        port map (
      I0 => \mpx[3]_i_17_n_0\,
      I1 => \mpx[3]_i_18_n_0\,
      I2 => \mpx[3]_i_13_n_0\,
      I3 => \mpx[3]_i_19_n_0\,
      I4 => \rxdh_reg_n_0_[8]\,
      I5 => data9(0),
      O => \mpx[3]_i_7_n_0\
    );
\mpx[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDF0000FFDFFFDF"
    )
        port map (
      I0 => \mpx[0]_i_16_n_0\,
      I1 => \mpx[3]_i_20_n_0\,
      I2 => data9(4),
      I3 => data9(5),
      I4 => \mpx[3]_i_21_n_0\,
      I5 => \mpx[0]_i_19_n_0\,
      O => \mpx[3]_i_8_n_0\
    );
\mpx[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0060006000606666"
    )
        port map (
      I0 => data9(5),
      I1 => data9(4),
      I2 => \mpx[3]_i_22_n_0\,
      I3 => \mpx[3]_i_23_n_0\,
      I4 => \mpx[3]_i_24_n_0\,
      I5 => \mpx[3]_i_25_n_0\,
      O => \mpx[3]_i_9_n_0\
    );
\mpx_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \mpx[3]_i_1_n_0\,
      D => \mpx[0]_i_1_n_0\,
      Q => \mpx__0\(0),
      R => '0'
    );
\mpx_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \mpx[3]_i_1_n_0\,
      D => \mpx[1]_i_1_n_0\,
      Q => \mpx__0\(1),
      R => '0'
    );
\mpx_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \mpx[3]_i_1_n_0\,
      D => \mpx[2]_i_1_n_0\,
      Q => \mpx__0\(2),
      R => '0'
    );
\mpx_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \mpx[3]_i_1_n_0\,
      D => \mpx[3]_i_2_n_0\,
      Q => \mpx__0\(3),
      R => '0'
    );
\pd_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \^pd_count_reg[4]_0\(0),
      I1 => PhaseDet_CntInc(0),
      I2 => PhaseDet_CntDec(0),
      O => \pd_count[0]_i_1_n_0\
    );
\pd_count[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669C33CC33C6996"
    )
        port map (
      I0 => PhaseDet_CntDec(0),
      I1 => PhaseDet_CntDec(1),
      I2 => \^pd_count_reg[4]_0\(1),
      I3 => PhaseDet_CntInc(1),
      I4 => PhaseDet_CntInc(0),
      I5 => \^pd_count_reg[4]_0\(0),
      O => \pd_count[1]_i_1_n_0\
    );
\pd_count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96669996"
    )
        port map (
      I0 => \pd_count[2]_i_2_n_0\,
      I1 => \pd_count[2]_i_3_n_0\,
      I2 => \^pd_count_reg[4]_0\(1),
      I3 => PhaseDet_CntInc(1),
      I4 => PhaseDet_CntDec(1),
      O => \pd_count[2]_i_1_n_0\
    );
\pd_count[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"69696900FF696969"
    )
        port map (
      I0 => PhaseDet_CntInc(1),
      I1 => \^pd_count_reg[4]_0\(1),
      I2 => PhaseDet_CntDec(1),
      I3 => \^pd_count_reg[4]_0\(0),
      I4 => PhaseDet_CntInc(0),
      I5 => PhaseDet_CntDec(0),
      O => \pd_count[2]_i_2_n_0\
    );
\pd_count[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => PhaseDet_CntDec(2),
      I1 => \^pd_count_reg[4]_0\(2),
      I2 => PhaseDet_CntInc(2),
      O => \pd_count[2]_i_3_n_0\
    );
\pd_count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69996669"
    )
        port map (
      I0 => \pd_count[4]_i_3_n_0\,
      I1 => \^pd_count_reg[4]_0\(3),
      I2 => \^pd_count_reg[4]_0\(2),
      I3 => PhaseDet_CntInc(2),
      I4 => PhaseDet_CntDec(2),
      O => \pd_count[3]_i_1_n_0\
    );
\pd_count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFFF"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(1),
      I1 => \^s_state_reg[4]_0\(0),
      I2 => \s_state[5]_i_3_n_0\,
      I3 => \^s_state_reg[4]_2\,
      I4 => \delay_change_reg_n_0_[0]\,
      I5 => \^sr\(0),
      O => pd_ovflw_up
    );
\pd_count[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F5780A8EAFE1501"
    )
        port map (
      I0 => \pd_count[4]_i_3_n_0\,
      I1 => \^pd_count_reg[4]_0\(2),
      I2 => PhaseDet_CntInc(2),
      I3 => PhaseDet_CntDec(2),
      I4 => \^pd_count_reg[4]_0\(4),
      I5 => \^pd_count_reg[4]_0\(3),
      O => \pd_count[4]_i_2_n_0\
    );
\pd_count[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF696900"
    )
        port map (
      I0 => PhaseDet_CntInc(2),
      I1 => \^pd_count_reg[4]_0\(2),
      I2 => PhaseDet_CntDec(2),
      I3 => \pd_count[4]_i_4_n_0\,
      I4 => \pd_count[2]_i_2_n_0\,
      O => \pd_count[4]_i_3_n_0\
    );
\pd_count[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8E"
    )
        port map (
      I0 => \^pd_count_reg[4]_0\(1),
      I1 => PhaseDet_CntInc(1),
      I2 => PhaseDet_CntDec(1),
      O => \pd_count[4]_i_4_n_0\
    );
\pd_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \pd_count[0]_i_1_n_0\,
      Q => \^pd_count_reg[4]_0\(0),
      R => pd_ovflw_up
    );
\pd_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \pd_count[1]_i_1_n_0\,
      Q => \^pd_count_reg[4]_0\(1),
      R => pd_ovflw_up
    );
\pd_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \pd_count[2]_i_1_n_0\,
      Q => \^pd_count_reg[4]_0\(2),
      R => pd_ovflw_up
    );
\pd_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \pd_count[3]_i_1_n_0\,
      Q => \^pd_count_reg[4]_0\(3),
      R => pd_ovflw_up
    );
\pd_count_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \pd_count[4]_i_2_n_0\,
      Q => \^pd_count_reg[4]_0\(4),
      S => pd_ovflw_up
    );
pd_ovflw_down_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => pd_ovflw_down_reg_1,
      Q => \^pd_ovflw_down_reg_0\,
      R => pd_ovflw_up
    );
pd_ovflw_up_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => pd_ovflw_up_reg_1,
      Q => \^pd_ovflw_up_reg_0\,
      R => pd_ovflw_up
    );
\rxdh_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => data9(1),
      Q => \rxdh_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\rxdh_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => hdataout(0),
      Q => data9(1),
      R => \^sr\(0)
    );
\rxdh_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => hdataout(1),
      Q => data9(2),
      R => \^sr\(0)
    );
\rxdh_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => hdataout(2),
      Q => data9(3),
      R => \^sr\(0)
    );
\rxdh_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => hdataout(3),
      Q => data9(4),
      R => \^sr\(0)
    );
\rxdh_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => hdataout(4),
      Q => data9(5),
      R => \^sr\(0)
    );
\rxdh_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => hdataout(5),
      Q => data9(6),
      R => \^sr\(0)
    );
\rxdh_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => hdataout(6),
      Q => data9(7),
      R => \^sr\(0)
    );
\rxdh_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => hdataout(7),
      Q => data9(8),
      R => \^sr\(0)
    );
\rxdh_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => hdataout(8),
      Q => data9(9),
      R => \^sr\(0)
    );
\rxdh_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => hdataout(9),
      Q => \rxdh_reg_n_0_[19]\,
      R => \^sr\(0)
    );
\rxdh_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => data9(2),
      Q => \rxdh_reg_n_0_[1]\,
      R => \^sr\(0)
    );
\rxdh_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => data9(3),
      Q => \rxdh_reg_n_0_[2]\,
      R => \^sr\(0)
    );
\rxdh_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => data9(4),
      Q => \rxdh_reg_n_0_[3]\,
      R => \^sr\(0)
    );
\rxdh_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => data9(5),
      Q => \rxdh_reg_n_0_[4]\,
      R => \^sr\(0)
    );
\rxdh_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => data9(6),
      Q => \rxdh_reg_n_0_[5]\,
      R => \^sr\(0)
    );
\rxdh_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => data9(7),
      Q => \rxdh_reg_n_0_[6]\,
      R => \^sr\(0)
    );
\rxdh_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => data9(8),
      Q => \rxdh_reg_n_0_[7]\,
      R => \^sr\(0)
    );
\rxdh_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => data9(9),
      Q => \rxdh_reg_n_0_[8]\,
      R => \^sr\(0)
    );
\rxdh_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^rx_valid_int_reg_0\(0),
      D => \rxdh_reg_n_0_[19]\,
      Q => data9(0),
      R => \^sr\(0)
    );
\s_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C3C3C3CC4C4C7C4"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(0),
      I1 => \s_state[5]_i_6_n_0\,
      I2 => \s_state[5]_i_9_n_0\,
      I3 => \s_state[0]_i_2_n_0\,
      I4 => \s_state[1]_i_2_n_0\,
      I5 => \s_state[5]_i_8_n_0\,
      O => \s_state[0]_i_1_n_0\
    );
\s_state[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => ActCnt_EQ_BTval,
      I1 => \^pd_ovflw_up_reg_0\,
      O => \s_state[0]_i_2_n_0\
    );
\s_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FC02FC32FC32FC02"
    )
        port map (
      I0 => \s_state[1]_i_2_n_0\,
      I1 => \s_state[5]_i_8_n_0\,
      I2 => \s_state[5]_i_6_n_0\,
      I3 => \s_state[5]_i_9_n_0\,
      I4 => \^s_state_reg[4]_0\(1),
      I5 => \^s_state_reg[4]_0\(0),
      O => \s_state[1]_i_1_n_0\
    );
\s_state[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => \^pd_ovflw_up_reg_0\,
      I1 => ActCnt_EQ_Zero,
      I2 => \^pd_ovflw_down_reg_0\,
      O => \s_state[1]_i_2_n_0\
    );
\s_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFFFFEF000000"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(3),
      I1 => \^s_state_reg[4]_0\(4),
      I2 => \s_state_reg_n_0_[5]\,
      I3 => \^s_state_reg[4]_0\(1),
      I4 => \^s_state_reg[4]_0\(0),
      I5 => \^s_state_reg[4]_0\(2),
      O => \s_state[2]_i_1_n_0\
    );
\s_state[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(3),
      I1 => \^s_state_reg[4]_0\(1),
      I2 => \^s_state_reg[4]_0\(2),
      I3 => \^s_state_reg[4]_0\(0),
      O => \s_state[3]_i_1_n_0\
    );
\s_state[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAA6AA8AAAA"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(4),
      I1 => \^s_state_reg[4]_0\(3),
      I2 => \^s_state_reg[4]_0\(1),
      I3 => \^s_state_reg[4]_0\(2),
      I4 => \^s_state_reg[4]_0\(0),
      I5 => \s_state_reg_n_0_[5]\,
      O => \s_state[4]_i_1_n_0\
    );
\s_state[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFFF"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(1),
      I1 => \^s_state_reg[4]_0\(0),
      I2 => \s_state[5]_i_3_n_0\,
      I3 => \^s_state_reg[4]_2\,
      I4 => \^pd_ovflw_up_reg_0\,
      I5 => \^pd_ovflw_down_reg_0\,
      O => s_state
    );
\s_state[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF0000B8"
    )
        port map (
      I0 => \s_state[5]_i_5_n_0\,
      I1 => \s_state[5]_i_6_n_0\,
      I2 => \s_state[5]_i_7_n_0\,
      I3 => \s_state[5]_i_8_n_0\,
      I4 => \s_state[5]_i_9_n_0\,
      O => \s_state[5]_i_2_n_0\
    );
\s_state[5]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(3),
      I1 => \^s_state_reg[4]_0\(2),
      O => \s_state[5]_i_3_n_0\
    );
\s_state[5]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(4),
      I1 => \s_state_reg_n_0_[5]\,
      O => \^s_state_reg[4]_2\
    );
\s_state[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \s_state_reg_n_0_[5]\,
      I1 => \^s_state_reg[4]_0\(0),
      I2 => \^s_state_reg[4]_0\(2),
      I3 => \^s_state_reg[4]_0\(1),
      I4 => \^s_state_reg[4]_0\(3),
      I5 => \^s_state_reg[4]_0\(4),
      O => \s_state[5]_i_5_n_0\
    );
\s_state[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFFFFFFDDBE"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(1),
      I1 => \^s_state_reg[4]_0\(4),
      I2 => \^s_state_reg[4]_0\(0),
      I3 => \s_state_reg_n_0_[5]\,
      I4 => \^s_state_reg[4]_0\(2),
      I5 => \^s_state_reg[4]_0\(3),
      O => \s_state[5]_i_6_n_0\
    );
\s_state[5]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"550C"
    )
        port map (
      I0 => ActCnt_EQ_BTval,
      I1 => \^pd_ovflw_down_reg_0\,
      I2 => ActCnt_EQ_Zero,
      I3 => \^pd_ovflw_up_reg_0\,
      O => \s_state[5]_i_7_n_0\
    );
\s_state[5]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00030100"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(1),
      I1 => \^s_state_reg[4]_0\(3),
      I2 => \^s_state_reg[4]_0\(2),
      I3 => \^s_state_reg[4]_0\(4),
      I4 => \s_state_reg_n_0_[5]\,
      O => \s_state[5]_i_8_n_0\
    );
\s_state[5]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040010101010100"
    )
        port map (
      I0 => \^s_state_reg[4]_0\(4),
      I1 => \^s_state_reg[4]_0\(2),
      I2 => \^s_state_reg[4]_0\(3),
      I3 => \s_state_reg_n_0_[5]\,
      I4 => \^s_state_reg[4]_0\(0),
      I5 => \^s_state_reg[4]_0\(1),
      O => \s_state[5]_i_9_n_0\
    );
\s_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => s_state,
      D => \s_state[0]_i_1_n_0\,
      Q => \^s_state_reg[4]_0\(0),
      R => \^sr\(0)
    );
\s_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => s_state,
      D => \s_state[1]_i_1_n_0\,
      Q => \^s_state_reg[4]_0\(1),
      R => \^sr\(0)
    );
\s_state_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => s_state,
      D => \s_state[2]_i_1_n_0\,
      Q => \^s_state_reg[4]_0\(2),
      R => \^sr\(0)
    );
\s_state_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => s_state,
      D => \s_state[3]_i_1_n_0\,
      Q => \^s_state_reg[4]_0\(3),
      R => \^sr\(0)
    );
\s_state_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => s_state,
      D => \s_state[4]_i_1_n_0\,
      Q => \^s_state_reg[4]_0\(4),
      R => \^sr\(0)
    );
\s_state_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => s_state,
      D => \s_state[5]_i_2_n_0\,
      Q => \s_state_reg_n_0_[5]\,
      R => \^sr\(0)
    );
\toggle[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"56"
    )
        port map (
      I0 => \toggle_reg_n_0_[0]\,
      I1 => \^insert3_reg_0\,
      I2 => \^insert5_reg_0\,
      O => \toggle[0]_i_1_n_0\
    );
\toggle[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9D409D9D62229D62"
    )
        port map (
      I0 => \^insert3_reg_0\,
      I1 => \toggle_reg_n_0_[0]\,
      I2 => \^insert5_reg_0\,
      I3 => p_0_in0,
      I4 => \toggle_reg_n_0_[2]\,
      I5 => \toggle_reg_n_0_[1]\,
      O => \toggle[1]_i_1_n_0\
    );
\toggle[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080DD3D3300CCDD"
    )
        port map (
      I0 => p_0_in0,
      I1 => \toggle_reg_n_0_[1]\,
      I2 => \^insert5_reg_0\,
      I3 => \^insert3_reg_0\,
      I4 => \toggle_reg_n_0_[2]\,
      I5 => \toggle_reg_n_0_[0]\,
      O => \toggle[2]_i_1_n_0\
    );
\toggle[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"522852281042500A"
    )
        port map (
      I0 => \toggle_reg_n_0_[2]\,
      I1 => \toggle_reg_n_0_[0]\,
      I2 => \toggle_reg_n_0_[1]\,
      I3 => p_0_in0,
      I4 => \^insert5_reg_0\,
      I5 => \^insert3_reg_0\,
      O => \toggle[3]_i_1_n_0\
    );
\toggle_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \toggle[0]_i_1_n_0\,
      Q => \toggle_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\toggle_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \toggle[1]_i_1_n_0\,
      Q => \toggle_reg_n_0_[1]\,
      R => \^sr\(0)
    );
\toggle_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \toggle[2]_i_1_n_0\,
      Q => \toggle_reg_n_0_[2]\,
      R => \^sr\(0)
    );
\toggle_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \toggle[3]_i_1_n_0\,
      Q => p_0_in0,
      R => \^sr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block is
  port (
    data_out : out STD_LOGIC;
    speed_is_100_0 : in STD_LOGIC;
    Tx_WrClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => speed_is_100_0,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_1 is
  port (
    data_out : out STD_LOGIC;
    speed_is_10_100_0 : in STD_LOGIC;
    Tx_WrClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_1 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_1;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_1 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => speed_is_10_100_0,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10 is
  port (
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \wr_occupancy_reg[6]\ : in STD_LOGIC;
    \wr_occupancy_reg[6]_0\ : in STD_LOGIC;
    \wr_occupancy_reg[6]_1\ : in STD_LOGIC;
    \wr_occupancy_reg[6]_2\ : in STD_LOGIC;
    data_sync_reg1_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Rx_SysClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync_reg1_0(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
wr_occupancy0_carry_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
        port map (
      I0 => Q(0),
      I1 => \^data_out\,
      I2 => \wr_occupancy_reg[6]\,
      I3 => \wr_occupancy_reg[6]_0\,
      I4 => \wr_occupancy_reg[6]_1\,
      I5 => \wr_occupancy_reg[6]_2\,
      O => S(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11 is
  port (
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \wr_occupancy_reg[6]\ : in STD_LOGIC;
    \wr_occupancy_reg[6]_0\ : in STD_LOGIC;
    \wr_occupancy_reg[6]_1\ : in STD_LOGIC;
    data_sync_reg1_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Rx_SysClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync_reg1_0(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
wr_occupancy0_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => Q(0),
      I1 => \^data_out\,
      I2 => \wr_occupancy_reg[6]\,
      I3 => \wr_occupancy_reg[6]_0\,
      I4 => \wr_occupancy_reg[6]_1\,
      O => S(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12 is
  port (
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \wr_occupancy_reg[6]\ : in STD_LOGIC;
    \wr_occupancy_reg[6]_0\ : in STD_LOGIC;
    data_sync_reg1_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Rx_SysClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync_reg1_0(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
wr_occupancy0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => Q(0),
      I1 => \^data_out\,
      I2 => \wr_occupancy_reg[6]\,
      I3 => \wr_occupancy_reg[6]_0\,
      O => S(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13 is
  port (
    S : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \wr_occupancy_reg[6]\ : in STD_LOGIC;
    data_in : in STD_LOGIC;
    Rx_SysClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
wr_occupancy0_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(1),
      I1 => \^data_out\,
      O => S(1)
    );
wr_occupancy0_carry_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => Q(0),
      I1 => \^data_out\,
      I2 => \wr_occupancy_reg[6]\,
      O => S(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14 is
  port (
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    Tx_WrClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => Q(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15 is
  port (
    S : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_sync_reg6_0 : out STD_LOGIC;
    rd_wr_addr : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    data_out : in STD_LOGIC;
    data_sync_reg1_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Tx_WrClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync_reg1_0(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync5,
      Q => data_sync_reg6_0,
      R => '0'
    );
rd_occupancy0_carry_i_12: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rd_wr_addr(0),
      I1 => Q(1),
      O => S(1)
    );
rd_occupancy0_carry_i_13: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => rd_wr_addr(0),
      I1 => data_out,
      I2 => Q(0),
      O => S(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16 is
  port (
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    Tx_WrClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => Q(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_17 is
  port (
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    \rd_occupancy_reg[6]\ : in STD_LOGIC;
    \rd_occupancy_reg[6]_0\ : in STD_LOGIC;
    \rd_occupancy_reg[6]_1\ : in STD_LOGIC;
    \rd_occupancy_reg[6]_2\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    data_sync_reg1_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Tx_WrClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_17 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_17;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_17 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync_reg1_0(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
rd_occupancy0_carry_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
        port map (
      I0 => \^data_out\,
      I1 => \rd_occupancy_reg[6]\,
      I2 => \rd_occupancy_reg[6]_0\,
      I3 => \rd_occupancy_reg[6]_1\,
      I4 => \rd_occupancy_reg[6]_2\,
      I5 => Q(0),
      O => S(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_18 is
  port (
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    \rd_occupancy_reg[6]\ : in STD_LOGIC;
    \rd_occupancy_reg[6]_0\ : in STD_LOGIC;
    \rd_occupancy_reg[6]_1\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    data_sync_reg1_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Tx_WrClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_18 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_18;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_18 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync_reg1_0(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
rd_occupancy0_carry_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \^data_out\,
      I1 => \rd_occupancy_reg[6]\,
      I2 => \rd_occupancy_reg[6]_0\,
      I3 => \rd_occupancy_reg[6]_1\,
      I4 => Q(0),
      O => S(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_19 is
  port (
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    \rd_occupancy_reg[6]\ : in STD_LOGIC;
    \rd_occupancy_reg[6]_0\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    data_sync_reg1_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Tx_WrClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_19 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_19;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_19 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync_reg1_0(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
rd_occupancy0_carry_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => \^data_out\,
      I1 => \rd_occupancy_reg[6]\,
      I2 => \rd_occupancy_reg[6]_0\,
      I3 => Q(0),
      O => S(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_20 is
  port (
    S : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_out : out STD_LOGIC;
    \rd_occupancy_reg[6]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    data_sync_reg1_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Tx_WrClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_20 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_20;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_20 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync_reg1_0(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
rd_occupancy0_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^data_out\,
      I1 => Q(1),
      O => S(1)
    );
rd_occupancy0_carry_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \^data_out\,
      I1 => \rd_occupancy_reg[6]\,
      I2 => Q(0),
      O => S(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_21 is
  port (
    data_out : out STD_LOGIC;
    data_sync_reg1_0 : in STD_LOGIC;
    Tx_WrClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_21 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_21;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_21 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync_reg1_0,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7 is
  port (
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    Rx_SysClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => Q(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8 is
  port (
    S : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    data_out : in STD_LOGIC;
    wr_occupancy0_carry_i_7_0 : in STD_LOGIC;
    wr_occupancy0_carry_i_7_1 : in STD_LOGIC;
    wr_occupancy0_carry_i_7_2 : in STD_LOGIC;
    wr_occupancy0_carry_i_7_3 : in STD_LOGIC;
    \wr_occupancy_reg[6]\ : in STD_LOGIC;
    data_sync_reg1_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Rx_SysClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal p_8_in : STD_LOGIC;
  signal wr_rd_addr_gray_1 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync_reg1_0(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync5,
      Q => wr_rd_addr_gray_1,
      R => '0'
    );
wr_occupancy0_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Q(1),
      I1 => p_8_in,
      O => S(1)
    );
wr_occupancy0_carry_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => Q(0),
      I1 => p_8_in,
      I2 => \wr_occupancy_reg[6]\,
      O => S(0)
    );
wr_occupancy0_carry_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => wr_rd_addr_gray_1,
      I1 => data_out,
      I2 => wr_occupancy0_carry_i_7_0,
      I3 => wr_occupancy0_carry_i_7_1,
      I4 => wr_occupancy0_carry_i_7_2,
      I5 => wr_occupancy0_carry_i_7_3,
      O => p_8_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9 is
  port (
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    Rx_SysClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => Q(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_tx_rate_adapt is
  port (
    gmii_tx_en_out : out STD_LOGIC;
    gmii_tx_er_out : out STD_LOGIC;
    gmii_txd_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    reset_out : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    gmii_tx_en_0 : in STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    gmii_tx_er_0 : in STD_LOGIC;
    gmii_txd_0 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_tx_rate_adapt : entity is "gig_ethernet_pcs_pma_0_tx_rate_adapt";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_tx_rate_adapt;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_tx_rate_adapt is
begin
gmii_tx_en_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => E(0),
      D => gmii_tx_en_0,
      Q => gmii_tx_en_out,
      R => reset_out
    );
gmii_tx_er_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => E(0),
      D => gmii_tx_er_0,
      Q => gmii_tx_er_out,
      R => reset_out
    );
\gmii_txd_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => E(0),
      D => gmii_txd_0(0),
      Q => gmii_txd_out(0),
      R => reset_out
    );
\gmii_txd_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => E(0),
      D => gmii_txd_0(1),
      Q => gmii_txd_out(1),
      R => reset_out
    );
\gmii_txd_out_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => E(0),
      D => gmii_txd_0(2),
      Q => gmii_txd_out(2),
      R => reset_out
    );
\gmii_txd_out_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => E(0),
      D => gmii_txd_0(3),
      Q => gmii_txd_out(3),
      R => reset_out
    );
\gmii_txd_out_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => E(0),
      D => gmii_txd_0(4),
      Q => gmii_txd_out(4),
      R => reset_out
    );
\gmii_txd_out_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => E(0),
      D => gmii_txd_0(5),
      Q => gmii_txd_out(5),
      R => reset_out
    );
\gmii_txd_out_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => E(0),
      D => gmii_txd_0(6),
      Q => gmii_txd_out(6),
      R => reset_out
    );
\gmii_txd_out_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => E(0),
      D => gmii_txd_0(7),
      Q => gmii_txd_out(7),
      R => reset_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_tx_ten_to_eight is
  port (
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    IntRdEna_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \DataOut_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Tx_WrClk : in STD_LOGIC;
    tx_data_10b : in STD_LOGIC_VECTOR ( 9 downto 0 );
    reset_out : in STD_LOGIC;
    IntRdEna_reg_1 : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_tx_ten_to_eight : entity is "gig_ethernet_pcs_pma_0_tx_ten_to_eight";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_tx_ten_to_eight;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_tx_ten_to_eight is
  signal \DataOut[0]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[0]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[1]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[1]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[2]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[2]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[3]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[3]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[4]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[4]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[5]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[5]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[6]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[6]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[7]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[7]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_IntState[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_IntState[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_IntState[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_IntState[2]_i_3_n_0\ : STD_LOGIC;
  signal \IntLastOut_reg_n_0_[4]\ : STD_LOGIC;
  signal \IntLastOut_reg_n_0_[5]\ : STD_LOGIC;
  signal \IntLastOut_reg_n_0_[6]\ : STD_LOGIC;
  signal \IntLastOut_reg_n_0_[7]\ : STD_LOGIC;
  signal IntRamOut : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal IntRdAddr : STD_LOGIC;
  signal IntRdAddr_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal IntRdEna_Sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of IntRdEna_Sync : signal is "true";
  signal \^intrdena_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal IntState : STD_LOGIC;
  signal \IntState__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Reset_Sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of Reset_Sync : signal is "true";
  signal in3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \p_0_in__2\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \p_0_in__4\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_FIFO_ram_inst0_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_FIFO_ram_inst1_DOC_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_FIFO_ram_inst1_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute box_type : string;
  attribute box_type of FIFO_ram_inst0 : label is "PRIMITIVE";
  attribute box_type of FIFO_ram_inst1 : label is "PRIMITIVE";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_IntState[1]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \FSM_sequential_IntState[2]_i_3\ : label is "soft_lutpair85";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_IntState_reg[0]\ : label is "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:011,iSTATE3:100,";
  attribute FSM_ENCODED_STATES of \FSM_sequential_IntState_reg[1]\ : label is "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:011,iSTATE3:100,";
  attribute FSM_ENCODED_STATES of \FSM_sequential_IntState_reg[2]\ : label is "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:011,iSTATE3:100,";
  attribute SOFT_HLUTNM of \IntRdAddr[0]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \IntRdAddr[1]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \IntRdAddr[2]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \IntRdAddr[3]_i_2\ : label is "soft_lutpair84";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \IntRdEna_Sync_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \IntRdEna_Sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \IntRdEna_Sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \IntRdEna_Sync_reg[1]\ : label is "yes";
  attribute SOFT_HLUTNM of \IntWrAddr[0]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \IntWrAddr[1]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \IntWrAddr[2]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \IntWrAddr[3]_i_1\ : label is "soft_lutpair83";
  attribute ASYNC_REG_boolean of \Reset_Sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \Reset_Sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \Reset_Sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \Reset_Sync_reg[1]\ : label is "yes";
begin
  IntRdEna_reg_0(0) <= \^intrdena_reg_0\(0);
  Q(3 downto 0) <= \^q\(3 downto 0);
\DataOut[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => IntRamOut(2),
      I1 => \IntState__0\(2),
      I2 => \DataOut[0]_i_2_n_0\,
      O => \DataOut[0]_i_1_n_0\
    );
\DataOut[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \IntLastOut_reg_n_0_[4]\,
      I1 => \IntLastOut_reg_n_0_[6]\,
      I2 => \IntState__0\(1),
      I3 => in3(0),
      I4 => \IntState__0\(0),
      I5 => IntRamOut(0),
      O => \DataOut[0]_i_2_n_0\
    );
\DataOut[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => IntRamOut(3),
      I1 => \IntState__0\(2),
      I2 => \DataOut[1]_i_2_n_0\,
      O => \DataOut[1]_i_1_n_0\
    );
\DataOut[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \IntLastOut_reg_n_0_[5]\,
      I1 => \IntLastOut_reg_n_0_[7]\,
      I2 => \IntState__0\(1),
      I3 => in3(1),
      I4 => \IntState__0\(0),
      I5 => IntRamOut(1),
      O => \DataOut[1]_i_2_n_0\
    );
\DataOut[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => IntRamOut(4),
      I1 => \IntState__0\(2),
      I2 => \DataOut[2]_i_2_n_0\,
      O => \DataOut[2]_i_1_n_0\
    );
\DataOut[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \IntLastOut_reg_n_0_[6]\,
      I1 => in3(0),
      I2 => \IntState__0\(1),
      I3 => IntRamOut(0),
      I4 => \IntState__0\(0),
      I5 => IntRamOut(2),
      O => \DataOut[2]_i_2_n_0\
    );
\DataOut[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => IntRamOut(5),
      I1 => \IntState__0\(2),
      I2 => \DataOut[3]_i_2_n_0\,
      O => \DataOut[3]_i_1_n_0\
    );
\DataOut[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \IntLastOut_reg_n_0_[7]\,
      I1 => in3(1),
      I2 => \IntState__0\(1),
      I3 => IntRamOut(1),
      I4 => \IntState__0\(0),
      I5 => IntRamOut(3),
      O => \DataOut[3]_i_2_n_0\
    );
\DataOut[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => IntRamOut(6),
      I1 => \IntState__0\(2),
      I2 => \DataOut[4]_i_2_n_0\,
      O => \DataOut[4]_i_1_n_0\
    );
\DataOut[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => in3(0),
      I1 => IntRamOut(0),
      I2 => \IntState__0\(1),
      I3 => IntRamOut(2),
      I4 => \IntState__0\(0),
      I5 => IntRamOut(4),
      O => \DataOut[4]_i_2_n_0\
    );
\DataOut[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => IntRamOut(7),
      I1 => \IntState__0\(2),
      I2 => \DataOut[5]_i_2_n_0\,
      O => \DataOut[5]_i_1_n_0\
    );
\DataOut[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => in3(1),
      I1 => IntRamOut(1),
      I2 => \IntState__0\(1),
      I3 => IntRamOut(3),
      I4 => \IntState__0\(0),
      I5 => IntRamOut(5),
      O => \DataOut[5]_i_2_n_0\
    );
\DataOut[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => IntRamOut(8),
      I1 => \IntState__0\(2),
      I2 => \DataOut[6]_i_2_n_0\,
      O => \DataOut[6]_i_1_n_0\
    );
\DataOut[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => IntRamOut(0),
      I1 => IntRamOut(2),
      I2 => \IntState__0\(1),
      I3 => IntRamOut(4),
      I4 => \IntState__0\(0),
      I5 => IntRamOut(6),
      O => \DataOut[6]_i_2_n_0\
    );
\DataOut[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => IntRamOut(9),
      I1 => \IntState__0\(2),
      I2 => \DataOut[7]_i_2_n_0\,
      O => \DataOut[7]_i_1_n_0\
    );
\DataOut[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => IntRamOut(1),
      I1 => IntRamOut(3),
      I2 => \IntState__0\(1),
      I3 => IntRamOut(5),
      I4 => \IntState__0\(0),
      I5 => IntRamOut(7),
      O => \DataOut[7]_i_2_n_0\
    );
\DataOut_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => IntState,
      D => \DataOut[0]_i_1_n_0\,
      Q => \DataOut_reg[7]_0\(0),
      S => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\DataOut_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => IntState,
      D => \DataOut[1]_i_1_n_0\,
      Q => \DataOut_reg[7]_0\(1),
      S => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\DataOut_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => IntState,
      D => \DataOut[2]_i_1_n_0\,
      Q => \DataOut_reg[7]_0\(2),
      S => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\DataOut_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => IntState,
      D => \DataOut[3]_i_1_n_0\,
      Q => \DataOut_reg[7]_0\(3),
      S => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\DataOut_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => IntState,
      D => \DataOut[4]_i_1_n_0\,
      Q => \DataOut_reg[7]_0\(4),
      S => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\DataOut_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => IntState,
      D => \DataOut[5]_i_1_n_0\,
      Q => \DataOut_reg[7]_0\(5),
      S => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\DataOut_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => IntState,
      D => \DataOut[6]_i_1_n_0\,
      Q => \DataOut_reg[7]_0\(6),
      S => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\DataOut_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => IntState,
      D => \DataOut[7]_i_1_n_0\,
      Q => \DataOut_reg[7]_0\(7),
      S => \FSM_sequential_IntState[2]_i_1_n_0\
    );
FIFO_ram_inst0: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      IS_WCLK_INVERTED => '0'
    )
        port map (
      ADDRA(4) => '0',
      ADDRA(3 downto 0) => IntRdAddr_reg(3 downto 0),
      ADDRB(4) => '0',
      ADDRB(3 downto 0) => IntRdAddr_reg(3 downto 0),
      ADDRC(4) => '0',
      ADDRC(3 downto 0) => IntRdAddr_reg(3 downto 0),
      ADDRD(4) => '0',
      ADDRD(3 downto 0) => \^q\(3 downto 0),
      DIA(1 downto 0) => tx_data_10b(1 downto 0),
      DIB(1 downto 0) => tx_data_10b(3 downto 2),
      DIC(1 downto 0) => tx_data_10b(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => IntRamOut(1 downto 0),
      DOB(1 downto 0) => IntRamOut(3 downto 2),
      DOC(1 downto 0) => IntRamOut(5 downto 4),
      DOD(1 downto 0) => NLW_FIFO_ram_inst0_DOD_UNCONNECTED(1 downto 0),
      WCLK => Tx_WrClk,
      WE => '1'
    );
FIFO_ram_inst1: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      IS_WCLK_INVERTED => '0'
    )
        port map (
      ADDRA(4) => '0',
      ADDRA(3 downto 0) => IntRdAddr_reg(3 downto 0),
      ADDRB(4) => '0',
      ADDRB(3 downto 0) => IntRdAddr_reg(3 downto 0),
      ADDRC(4 downto 0) => B"00000",
      ADDRD(4) => '0',
      ADDRD(3 downto 0) => \^q\(3 downto 0),
      DIA(1 downto 0) => tx_data_10b(7 downto 6),
      DIB(1 downto 0) => tx_data_10b(9 downto 8),
      DIC(1 downto 0) => B"00",
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => IntRamOut(7 downto 6),
      DOB(1 downto 0) => IntRamOut(9 downto 8),
      DOC(1 downto 0) => NLW_FIFO_ram_inst1_DOC_UNCONNECTED(1 downto 0),
      DOD(1 downto 0) => NLW_FIFO_ram_inst1_DOD_UNCONNECTED(1 downto 0),
      WCLK => Tx_WrClk,
      WE => '1'
    );
\FSM_sequential_IntState[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IntState__0\(0),
      I1 => \IntState__0\(2),
      O => \FSM_sequential_IntState[0]_i_1_n_0\
    );
\FSM_sequential_IntState[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => \IntState__0\(1),
      I1 => \IntState__0\(0),
      I2 => \IntState__0\(2),
      O => \FSM_sequential_IntState[1]_i_1_n_0\
    );
\FSM_sequential_IntState[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => Reset_Sync(1),
      I1 => IntRdEna_Sync(1),
      O => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\FSM_sequential_IntState[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"57"
    )
        port map (
      I0 => \IntState__0\(2),
      I1 => \IntState__0\(1),
      I2 => \IntState__0\(0),
      O => IntState
    );
\FSM_sequential_IntState[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \IntState__0\(2),
      I1 => \IntState__0\(0),
      I2 => \IntState__0\(1),
      O => \FSM_sequential_IntState[2]_i_3_n_0\
    );
\FSM_sequential_IntState_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => IntState,
      D => \FSM_sequential_IntState[0]_i_1_n_0\,
      Q => \IntState__0\(0),
      R => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\FSM_sequential_IntState_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => IntState,
      D => \FSM_sequential_IntState[1]_i_1_n_0\,
      Q => \IntState__0\(1),
      R => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\FSM_sequential_IntState_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => IntState,
      D => \FSM_sequential_IntState[2]_i_3_n_0\,
      Q => \IntState__0\(2),
      R => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\IntLastOut_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => IntRamOut(4),
      Q => \IntLastOut_reg_n_0_[4]\,
      R => '0'
    );
\IntLastOut_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => IntRamOut(5),
      Q => \IntLastOut_reg_n_0_[5]\,
      R => '0'
    );
\IntLastOut_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => IntRamOut(6),
      Q => \IntLastOut_reg_n_0_[6]\,
      R => '0'
    );
\IntLastOut_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => IntRamOut(7),
      Q => \IntLastOut_reg_n_0_[7]\,
      R => '0'
    );
\IntLastOut_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => IntRamOut(8),
      Q => in3(0),
      R => '0'
    );
\IntLastOut_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => IntRamOut(9),
      Q => in3(1),
      R => '0'
    );
\IntRdAddr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => IntRdAddr_reg(0),
      O => \p_0_in__4\(0)
    );
\IntRdAddr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => IntRdAddr_reg(0),
      I1 => IntRdAddr_reg(1),
      O => \p_0_in__4\(1)
    );
\IntRdAddr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => IntRdAddr_reg(0),
      I1 => IntRdAddr_reg(1),
      I2 => IntRdAddr_reg(2),
      O => \p_0_in__4\(2)
    );
\IntRdAddr[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"17"
    )
        port map (
      I0 => \IntState__0\(1),
      I1 => \IntState__0\(2),
      I2 => \IntState__0\(0),
      O => IntRdAddr
    );
\IntRdAddr[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => IntRdAddr_reg(1),
      I1 => IntRdAddr_reg(0),
      I2 => IntRdAddr_reg(2),
      I3 => IntRdAddr_reg(3),
      O => \p_0_in__4\(3)
    );
\IntRdAddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => IntRdAddr,
      D => \p_0_in__4\(0),
      Q => IntRdAddr_reg(0),
      R => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\IntRdAddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => IntRdAddr,
      D => \p_0_in__4\(1),
      Q => IntRdAddr_reg(1),
      R => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\IntRdAddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => IntRdAddr,
      D => \p_0_in__4\(2),
      Q => IntRdAddr_reg(2),
      R => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\IntRdAddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => IntRdAddr,
      D => \p_0_in__4\(3),
      Q => IntRdAddr_reg(3),
      R => \FSM_sequential_IntState[2]_i_1_n_0\
    );
\IntRdEna_Sync_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \^intrdena_reg_0\(0),
      Q => IntRdEna_Sync(0),
      R => Reset_Sync(1)
    );
\IntRdEna_Sync_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => IntRdEna_Sync(0),
      Q => IntRdEna_Sync(1),
      R => Reset_Sync(1)
    );
IntRdEna_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => IntRdEna_reg_1,
      Q => \^intrdena_reg_0\(0),
      R => reset_out
    );
\IntWrAddr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \p_0_in__2\(0)
    );
\IntWrAddr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \p_0_in__2\(1)
    );
\IntWrAddr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \p_0_in__2\(2)
    );
\IntWrAddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      O => \p_0_in__2\(3)
    );
\IntWrAddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \p_0_in__2\(0),
      Q => \^q\(0),
      R => reset_out
    );
\IntWrAddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \p_0_in__2\(1),
      Q => \^q\(1),
      R => reset_out
    );
\IntWrAddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \p_0_in__2\(2),
      Q => \^q\(2),
      R => reset_out
    );
\IntWrAddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \p_0_in__2\(3),
      Q => \^q\(3),
      R => reset_out
    );
\Reset_Sync_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => CLK,
      CE => '1',
      D => '0',
      PRE => reset_out,
      Q => Reset_Sync(0)
    );
\Reset_Sync_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => CLK,
      CE => '1',
      D => Reset_Sync(0),
      PRE => reset_out,
      Q => Reset_Sync(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_AUTO_NEG is
  port (
    status_vector : out STD_LOGIC_VECTOR ( 5 downto 0 );
    XMIT_DATA_INT : out STD_LOGIC;
    RECEIVED_IDLE : out STD_LOGIC;
    RX_CONFIG_REG_NULL_reg_0 : out STD_LOGIC;
    an_interrupt : out STD_LOGIC;
    \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg[0]\ : out STD_LOGIC;
    XMIT_CONFIG : out STD_LOGIC;
    RX_DV0 : out STD_LOGIC;
    XMIT_DATA : out STD_LOGIC;
    \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg[0]_0\ : out STD_LOGIC;
    \RX_CONFIG_SNAPSHOT_reg[0]_0\ : out STD_LOGIC;
    \MASK_RUDI_BUFERR_TIMER_reg[3]_0\ : out STD_LOGIC;
    \MR_LP_ADV_ABILITY_INT_reg[13]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \RX_CONFIG_REG_REG_reg[5]_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \RX_CONFIG_SNAPSHOT_reg[13]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \out\ : in STD_LOGIC;
    userclk2 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    BASEX_REMOTE_FAULT_RSLVD : in STD_LOGIC_VECTOR ( 0 to 0 );
    RX_RUDI_INVALID_REG_reg_0 : in STD_LOGIC;
    RX_RUDI_INVALID : in STD_LOGIC;
    MR_AN_ENABLE_REG1_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    RESTART_AN_SET : in STD_LOGIC;
    RX_CONFIG_VALID : in STD_LOGIC;
    RX_IDLE : in STD_LOGIC;
    RECEIVED_IDLE_reg_0 : in STD_LOGIC;
    RX_CONFIG_REG_NULL_reg_1 : in STD_LOGIC;
    RXSYNC_STATUS : in STD_LOGIC;
    data_out : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    SOP_REG3 : in STD_LOGIC;
    RX_INVALID : in STD_LOGIC;
    RECEIVE : in STD_LOGIC;
    CONFIG_REG_MATCH_reg_0 : in STD_LOGIC;
    CONSISTENCY_MATCH_reg_0 : in STD_LOGIC;
    MASK_RUDI_CLKCOR_reg_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    an_adv_config_vector : in STD_LOGIC_VECTOR ( 0 to 0 );
    \MASK_RUDI_BUFERR_TIMER_reg[12]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_AUTO_NEG : entity is "AUTO_NEG";
end gig_ethernet_pcs_pma_0_AUTO_NEG;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_AUTO_NEG is
  signal ABILITY_MATCH : STD_LOGIC;
  signal ABILITY_MATCH_2 : STD_LOGIC;
  signal ABILITY_MATCH_2_i_3_n_0 : STD_LOGIC;
  signal ABILITY_MATCH_2_i_4_n_0 : STD_LOGIC;
  signal ABILITY_MATCH_2_i_5_n_0 : STD_LOGIC;
  signal ABILITY_MATCH_2_i_7_n_0 : STD_LOGIC;
  signal ABILITY_MATCH_2_i_8_n_0 : STD_LOGIC;
  signal ABILITY_MATCH_i_1_n_0 : STD_LOGIC;
  signal ACKNOWLEDGE_MATCH_2 : STD_LOGIC;
  signal ACKNOWLEDGE_MATCH_20 : STD_LOGIC;
  signal ACKNOWLEDGE_MATCH_3 : STD_LOGIC;
  signal ACKNOWLEDGE_MATCH_30 : STD_LOGIC;
  signal ACKNOWLEDGE_MATCH_3_reg_n_0 : STD_LOGIC;
  signal AN_SYNC_STATUS : STD_LOGIC;
  signal AN_SYNC_STATUS_i_1_n_0 : STD_LOGIC;
  signal CONFIG_REG_MATCH : STD_LOGIC;
  signal CONFIG_REG_MATCH_COMB : STD_LOGIC;
  signal CONSISTENCY_MATCH : STD_LOGIC;
  signal CONSISTENCY_MATCH_COMB : STD_LOGIC;
  signal CONSISTENCY_MATCH_i_2_n_0 : STD_LOGIC;
  signal CONSISTENCY_MATCH_i_4_n_0 : STD_LOGIC;
  signal \^d\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal GENERATE_REMOTE_FAULT : STD_LOGIC;
  signal GENERATE_REMOTE_FAULT0 : STD_LOGIC;
  signal GENERATE_REMOTE_FAULT_i_2_n_0 : STD_LOGIC;
  signal GENERATE_REMOTE_FAULT_i_3_n_0 : STD_LOGIC;
  signal GENERATE_REMOTE_FAULT_i_4_n_0 : STD_LOGIC;
  signal GENERATE_REMOTE_FAULT_i_5_n_0 : STD_LOGIC;
  signal GENERATE_REMOTE_FAULT_i_6_n_0 : STD_LOGIC;
  signal GENERATE_REMOTE_FAULT_i_7_n_0 : STD_LOGIC;
  signal IDLE_INSERTED : STD_LOGIC;
  signal IDLE_INSERTED0 : STD_LOGIC;
  signal IDLE_INSERTED_REG1 : STD_LOGIC;
  signal IDLE_INSERTED_REG2 : STD_LOGIC;
  signal IDLE_INSERTED_REG3 : STD_LOGIC;
  signal IDLE_INSERTED_REG30 : STD_LOGIC;
  signal IDLE_INSERTED_REG4 : STD_LOGIC;
  signal IDLE_MATCH : STD_LOGIC;
  signal IDLE_MATCH0 : STD_LOGIC;
  signal IDLE_MATCH_2 : STD_LOGIC;
  signal IDLE_MATCH_20 : STD_LOGIC;
  signal IDLE_REMOVED : STD_LOGIC;
  signal IDLE_REMOVED0 : STD_LOGIC;
  signal IDLE_REMOVED_REG1 : STD_LOGIC;
  signal IDLE_REMOVED_REG2 : STD_LOGIC;
  signal \LINK_TIMER[0]_i_1_n_0\ : STD_LOGIC;
  signal \LINK_TIMER[9]_i_1_n_0\ : STD_LOGIC;
  signal \LINK_TIMER[9]_i_3_n_0\ : STD_LOGIC;
  signal LINK_TIMER_DONE : STD_LOGIC;
  signal LINK_TIMER_DONE_i_1_n_0 : STD_LOGIC;
  signal LINK_TIMER_DONE_i_2_n_0 : STD_LOGIC;
  signal LINK_TIMER_DONE_i_3_n_0 : STD_LOGIC;
  signal LINK_TIMER_DONE_i_4_n_0 : STD_LOGIC;
  signal LINK_TIMER_SATURATED : STD_LOGIC;
  signal LINK_TIMER_SATURATED_COMB : STD_LOGIC;
  signal LINK_TIMER_SATURATED_i_2_n_0 : STD_LOGIC;
  signal LINK_TIMER_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal MASK_RUDI_BUFERR : STD_LOGIC;
  signal MASK_RUDI_BUFERR_TIMER : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \MASK_RUDI_BUFERR_TIMER[0]_i_1_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[10]_i_1_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[11]_i_1_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[12]_i_2_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[12]_i_4_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[12]_i_5_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[1]_i_1_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[2]_i_1_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[3]_i_1_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[4]_i_1_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[5]_i_1_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[6]_i_1_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[7]_i_1_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[8]_i_1_n_0\ : STD_LOGIC;
  signal \MASK_RUDI_BUFERR_TIMER[9]_i_1_n_0\ : STD_LOGIC;
  signal \^mask_rudi_buferr_timer_reg[3]_0\ : STD_LOGIC;
  signal MASK_RUDI_BUFERR_i_1_n_0 : STD_LOGIC;
  signal MASK_RUDI_CLKCOR : STD_LOGIC;
  signal MASK_RUDI_CLKCOR_i_1_n_0 : STD_LOGIC;
  signal MR_AN_COMPLETE_i_1_n_0 : STD_LOGIC;
  signal MR_AN_ENABLE_CHANGE : STD_LOGIC;
  signal MR_AN_ENABLE_CHANGE0 : STD_LOGIC;
  signal MR_AN_ENABLE_REG1 : STD_LOGIC;
  signal MR_AN_ENABLE_REG2 : STD_LOGIC;
  signal \MR_LP_ADV_ABILITY_INT_reg_n_0_[16]\ : STD_LOGIC;
  signal MR_PAGE_RX_SET0 : STD_LOGIC;
  signal MR_REMOTE_FAULT_i_1_n_0 : STD_LOGIC;
  signal MR_RESTART_AN_INT : STD_LOGIC;
  signal MR_RESTART_AN_INT_i_1_n_0 : STD_LOGIC;
  signal MR_RESTART_AN_SET_REG1 : STD_LOGIC;
  signal MR_RESTART_AN_SET_REG2 : STD_LOGIC;
  signal \^no_management.configuration_vector_reg_reg[0]\ : STD_LOGIC;
  signal PREVIOUS_STATE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PULSE4096 : STD_LOGIC;
  signal PULSE40960 : STD_LOGIC;
  signal \^received_idle\ : STD_LOGIC;
  signal \^rx_config_reg_null_reg_0\ : STD_LOGIC;
  signal \RX_CONFIG_REG_REG_reg_n_0_[0]\ : STD_LOGIC;
  signal \RX_CONFIG_REG_REG_reg_n_0_[10]\ : STD_LOGIC;
  signal \RX_CONFIG_REG_REG_reg_n_0_[11]\ : STD_LOGIC;
  signal \RX_CONFIG_REG_REG_reg_n_0_[12]\ : STD_LOGIC;
  signal \RX_CONFIG_REG_REG_reg_n_0_[13]\ : STD_LOGIC;
  signal \RX_CONFIG_REG_REG_reg_n_0_[1]\ : STD_LOGIC;
  signal \RX_CONFIG_REG_REG_reg_n_0_[2]\ : STD_LOGIC;
  signal \RX_CONFIG_REG_REG_reg_n_0_[6]\ : STD_LOGIC;
  signal \RX_CONFIG_REG_REG_reg_n_0_[7]\ : STD_LOGIC;
  signal \RX_CONFIG_REG_REG_reg_n_0_[8]\ : STD_LOGIC;
  signal \RX_CONFIG_REG_REG_reg_n_0_[9]\ : STD_LOGIC;
  signal RX_CONFIG_SNAPSHOT : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT[15]_i_2_n_0\ : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT[15]_i_3_n_0\ : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT_reg_n_0_[0]\ : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT_reg_n_0_[10]\ : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT_reg_n_0_[11]\ : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT_reg_n_0_[15]\ : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT_reg_n_0_[1]\ : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT_reg_n_0_[2]\ : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT_reg_n_0_[6]\ : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT_reg_n_0_[7]\ : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT_reg_n_0_[8]\ : STD_LOGIC;
  signal \RX_CONFIG_SNAPSHOT_reg_n_0_[9]\ : STD_LOGIC;
  signal RX_IDLE_REG1 : STD_LOGIC;
  signal RX_IDLE_REG2 : STD_LOGIC;
  signal RX_RUDI_INVALID_DELAY : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal RX_RUDI_INVALID_DELAY0 : STD_LOGIC;
  signal RX_RUDI_INVALID_REG : STD_LOGIC;
  signal \SGMII_SPEED[1]_i_2_n_0\ : STD_LOGIC;
  signal START_LINK_TIMER : STD_LOGIC;
  signal START_LINK_TIMER_REG : STD_LOGIC;
  signal START_LINK_TIMER_REG2 : STD_LOGIC;
  signal START_LINK_TIMER_REG_i_2_n_0 : STD_LOGIC;
  signal START_LINK_TIMER_REG_i_3_n_0 : STD_LOGIC;
  signal STATE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \STATE[0]_i_1_n_0\ : STD_LOGIC;
  signal \STATE[0]_i_2_n_0\ : STD_LOGIC;
  signal \STATE[0]_i_3_n_0\ : STD_LOGIC;
  signal \STATE[0]_i_4_n_0\ : STD_LOGIC;
  signal \STATE[1]_i_1_n_0\ : STD_LOGIC;
  signal \STATE[1]_i_2_n_0\ : STD_LOGIC;
  signal \STATE[1]_i_3_n_0\ : STD_LOGIC;
  signal \STATE[1]_i_4_n_0\ : STD_LOGIC;
  signal \STATE[1]_i_5_n_0\ : STD_LOGIC;
  signal \STATE[1]_i_6_n_0\ : STD_LOGIC;
  signal \STATE[2]_i_1_n_0\ : STD_LOGIC;
  signal \STATE[2]_i_2_n_0\ : STD_LOGIC;
  signal \STATE[2]_i_3_n_0\ : STD_LOGIC;
  signal \STATE[2]_i_4_n_0\ : STD_LOGIC;
  signal \STATE[2]_i_5_n_0\ : STD_LOGIC;
  signal \STATE[2]_i_6_n_0\ : STD_LOGIC;
  signal \STATE[3]_i_1_n_0\ : STD_LOGIC;
  signal \STATE[3]_i_2_n_0\ : STD_LOGIC;
  signal \STATE[3]_i_3_n_0\ : STD_LOGIC;
  signal \STATE[3]_i_4_n_0\ : STD_LOGIC;
  signal SYNC_STATUS_HELD : STD_LOGIC;
  signal SYNC_STATUS_HELD_i_1_n_0 : STD_LOGIC;
  signal TIMER4096_MSB_REG : STD_LOGIC;
  signal TIMER4096_reg : STD_LOGIC_VECTOR ( 11 to 11 );
  signal \TIMER4096_reg_n_0_[0]\ : STD_LOGIC;
  signal \TIMER4096_reg_n_0_[10]\ : STD_LOGIC;
  signal \TIMER4096_reg_n_0_[1]\ : STD_LOGIC;
  signal \TIMER4096_reg_n_0_[2]\ : STD_LOGIC;
  signal \TIMER4096_reg_n_0_[3]\ : STD_LOGIC;
  signal \TIMER4096_reg_n_0_[4]\ : STD_LOGIC;
  signal \TIMER4096_reg_n_0_[5]\ : STD_LOGIC;
  signal \TIMER4096_reg_n_0_[6]\ : STD_LOGIC;
  signal \TIMER4096_reg_n_0_[7]\ : STD_LOGIC;
  signal \TIMER4096_reg_n_0_[8]\ : STD_LOGIC;
  signal \TIMER4096_reg_n_0_[9]\ : STD_LOGIC;
  signal TOGGLE_RX : STD_LOGIC;
  signal TOGGLE_TX : STD_LOGIC;
  signal TOGGLE_TX_i_1_n_0 : STD_LOGIC;
  signal TOGGLE_TX_i_2_n_0 : STD_LOGIC;
  signal \TX_CONFIG_REG_INT[0]_i_1_n_0\ : STD_LOGIC;
  signal \TX_CONFIG_REG_INT[11]_i_1_n_0\ : STD_LOGIC;
  signal \TX_CONFIG_REG_INT[11]_i_2_n_0\ : STD_LOGIC;
  signal \TX_CONFIG_REG_INT[14]_i_1_n_0\ : STD_LOGIC;
  signal XMIT_CONFIG_INT : STD_LOGIC;
  signal XMIT_CONFIG_INT_i_1_n_0 : STD_LOGIC;
  signal \XMIT_CONFIG_INT_i_2__0_n_0\ : STD_LOGIC;
  signal \^xmit_data\ : STD_LOGIC;
  signal \^xmit_data_int\ : STD_LOGIC;
  signal XMIT_DATA_INT0 : STD_LOGIC;
  signal \^an_interrupt\ : STD_LOGIC;
  signal p_0_in0_in : STD_LOGIC;
  signal p_0_in26_in : STD_LOGIC;
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \plusOp__1\ : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal \plusOp_carry__0_n_6\ : STD_LOGIC;
  signal \plusOp_carry__0_n_7\ : STD_LOGIC;
  signal plusOp_carry_n_0 : STD_LOGIC;
  signal plusOp_carry_n_1 : STD_LOGIC;
  signal plusOp_carry_n_2 : STD_LOGIC;
  signal plusOp_carry_n_3 : STD_LOGIC;
  signal plusOp_carry_n_4 : STD_LOGIC;
  signal plusOp_carry_n_5 : STD_LOGIC;
  signal plusOp_carry_n_6 : STD_LOGIC;
  signal plusOp_carry_n_7 : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_12\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_13\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_14\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_15\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_10\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_11\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_12\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_13\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_14\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_15\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_8\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_9\ : STD_LOGIC;
  signal \^status_vector\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \NLW_plusOp_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_plusOp_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_plusOp_inferred__0/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_plusOp_inferred__0/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 4 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ACKNOWLEDGE_MATCH_2_i_1 : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of ACKNOWLEDGE_MATCH_3_i_1 : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of AN_SYNC_STATUS_i_1 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of GENERATE_REMOTE_FAULT_i_4 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of GENERATE_REMOTE_FAULT_i_5 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of GENERATE_REMOTE_FAULT_i_7 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of IDLE_INSERTED_i_1 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of IDLE_MATCH_2_i_1 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of IDLE_MATCH_i_1 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of IDLE_REMOVED_i_1 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \LINK_TIMER[1]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \LINK_TIMER[2]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \LINK_TIMER[3]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \LINK_TIMER[4]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \LINK_TIMER[6]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \LINK_TIMER[7]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \LINK_TIMER[8]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \LINK_TIMER[9]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of LINK_TIMER_DONE_i_4 : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[0]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[10]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[11]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[12]_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[2]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[3]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[4]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[5]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[6]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[7]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[8]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[9]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \RX_CONFIG_SNAPSHOT[15]_i_2\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \RX_CONFIG_SNAPSHOT[15]_i_3\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of RX_ER_i_2 : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \SGMII_SPEED[1]_i_2\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of START_LINK_TIMER_REG_i_2 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \STATE[0]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \STATE[1]_i_4\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \STATE[1]_i_5\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \STATE[1]_i_6\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \STATE[2]_i_3\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \STATE[2]_i_4\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \STATE[2]_i_5\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \STATE[2]_i_6\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \STATE[3]_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of STATUS_VECTOR_0_PRE_i_1 : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of SYNC_STATUS_HELD_i_1 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of TOGGLE_TX_i_2 : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \TX_CONFIG_REG_INT[0]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \TX_CONFIG_REG_INT[14]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of XMIT_CONFIG_INT_i_2 : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \XMIT_CONFIG_INT_i_2__0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of XMIT_DATA_INT_i_1 : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \XMIT_DATA_INT_i_1__0\ : label is "soft_lutpair33";
begin
  D(2 downto 0) <= \^d\(2 downto 0);
  \MASK_RUDI_BUFERR_TIMER_reg[3]_0\ <= \^mask_rudi_buferr_timer_reg[3]_0\;
  \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg[0]\ <= \^no_management.configuration_vector_reg_reg[0]\;
  RECEIVED_IDLE <= \^received_idle\;
  RX_CONFIG_REG_NULL_reg_0 <= \^rx_config_reg_null_reg_0\;
  XMIT_DATA <= \^xmit_data\;
  XMIT_DATA_INT <= \^xmit_data_int\;
  an_interrupt <= \^an_interrupt\;
  status_vector(5 downto 0) <= \^status_vector\(5 downto 0);
ABILITY_MATCH_2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => MASK_RUDI_BUFERR,
      I1 => RX_IDLE,
      I2 => \out\,
      O => ACKNOWLEDGE_MATCH_3
    );
ABILITY_MATCH_2_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => ABILITY_MATCH_2_i_3_n_0,
      I1 => ABILITY_MATCH_2_i_4_n_0,
      I2 => ABILITY_MATCH_2_i_5_n_0,
      I3 => CONFIG_REG_MATCH_reg_0,
      I4 => ABILITY_MATCH_2_i_7_n_0,
      I5 => ABILITY_MATCH_2_i_8_n_0,
      O => CONFIG_REG_MATCH_COMB
    );
ABILITY_MATCH_2_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => \^received_idle\,
      I1 => p_0_in0_in,
      I2 => Q(15),
      O => ABILITY_MATCH_2_i_3_n_0
    );
ABILITY_MATCH_2_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \RX_CONFIG_REG_REG_reg_n_0_[6]\,
      I1 => Q(6),
      I2 => Q(7),
      I3 => \RX_CONFIG_REG_REG_reg_n_0_[7]\,
      I4 => Q(8),
      I5 => \RX_CONFIG_REG_REG_reg_n_0_[8]\,
      O => ABILITY_MATCH_2_i_4_n_0
    );
ABILITY_MATCH_2_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \RX_CONFIG_REG_REG_reg_n_0_[12]\,
      I1 => Q(12),
      I2 => \RX_CONFIG_REG_REG_reg_n_0_[13]\,
      I3 => Q(13),
      O => ABILITY_MATCH_2_i_5_n_0
    );
ABILITY_MATCH_2_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \RX_CONFIG_REG_REG_reg_n_0_[0]\,
      I1 => Q(0),
      I2 => Q(2),
      I3 => \RX_CONFIG_REG_REG_reg_n_0_[2]\,
      I4 => Q(1),
      I5 => \RX_CONFIG_REG_REG_reg_n_0_[1]\,
      O => ABILITY_MATCH_2_i_7_n_0
    );
ABILITY_MATCH_2_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \RX_CONFIG_REG_REG_reg_n_0_[9]\,
      I1 => Q(9),
      I2 => Q(10),
      I3 => \RX_CONFIG_REG_REG_reg_n_0_[10]\,
      I4 => \RX_CONFIG_REG_REG_reg_n_0_[11]\,
      I5 => Q(11),
      O => ABILITY_MATCH_2_i_8_n_0
    );
ABILITY_MATCH_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => CONFIG_REG_MATCH_COMB,
      Q => ABILITY_MATCH_2,
      R => ACKNOWLEDGE_MATCH_3
    );
ABILITY_MATCH_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008F80"
    )
        port map (
      I0 => CONFIG_REG_MATCH_COMB,
      I1 => ABILITY_MATCH_2,
      I2 => RX_CONFIG_VALID,
      I3 => ABILITY_MATCH,
      I4 => MASK_RUDI_BUFERR,
      I5 => SR(0),
      O => ABILITY_MATCH_i_1_n_0
    );
ABILITY_MATCH_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => ABILITY_MATCH_i_1_n_0,
      Q => ABILITY_MATCH,
      R => '0'
    );
ACKNOWLEDGE_MATCH_2_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in26_in,
      I1 => Q(14),
      O => ACKNOWLEDGE_MATCH_20
    );
ACKNOWLEDGE_MATCH_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => ACKNOWLEDGE_MATCH_20,
      Q => ACKNOWLEDGE_MATCH_2,
      R => ACKNOWLEDGE_MATCH_3
    );
ACKNOWLEDGE_MATCH_3_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ACKNOWLEDGE_MATCH_2,
      I1 => Q(14),
      I2 => p_0_in26_in,
      O => ACKNOWLEDGE_MATCH_30
    );
ACKNOWLEDGE_MATCH_3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => ACKNOWLEDGE_MATCH_30,
      Q => ACKNOWLEDGE_MATCH_3_reg_n_0,
      R => ACKNOWLEDGE_MATCH_3
    );
AN_SYNC_STATUS_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBFFF80"
    )
        port map (
      I0 => SYNC_STATUS_HELD,
      I1 => LINK_TIMER_SATURATED,
      I2 => PULSE4096,
      I3 => RXSYNC_STATUS,
      I4 => AN_SYNC_STATUS,
      O => AN_SYNC_STATUS_i_1_n_0
    );
AN_SYNC_STATUS_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => AN_SYNC_STATUS_i_1_n_0,
      Q => AN_SYNC_STATUS,
      R => \out\
    );
\BASEX_REMOTE_FAULT_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => MR_PAGE_RX_SET0,
      D => BASEX_REMOTE_FAULT_RSLVD(0),
      Q => \^status_vector\(2),
      R => \out\
    );
CONFIG_REG_MATCH_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => CONFIG_REG_MATCH_COMB,
      Q => CONFIG_REG_MATCH,
      R => \out\
    );
CONSISTENCY_MATCH_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000009"
    )
        port map (
      I0 => \RX_CONFIG_SNAPSHOT_reg_n_0_[15]\,
      I1 => Q(15),
      I2 => CONSISTENCY_MATCH_i_2_n_0,
      I3 => CONSISTENCY_MATCH_reg_0,
      I4 => CONSISTENCY_MATCH_i_4_n_0,
      O => CONSISTENCY_MATCH_COMB
    );
CONSISTENCY_MATCH_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \RX_CONFIG_SNAPSHOT_reg_n_0_[6]\,
      I1 => Q(6),
      I2 => Q(7),
      I3 => \RX_CONFIG_SNAPSHOT_reg_n_0_[7]\,
      I4 => Q(8),
      I5 => \RX_CONFIG_SNAPSHOT_reg_n_0_[8]\,
      O => CONSISTENCY_MATCH_i_2_n_0
    );
CONSISTENCY_MATCH_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \RX_CONFIG_SNAPSHOT_reg_n_0_[9]\,
      I1 => Q(9),
      I2 => Q(10),
      I3 => \RX_CONFIG_SNAPSHOT_reg_n_0_[10]\,
      I4 => Q(11),
      I5 => \RX_CONFIG_SNAPSHOT_reg_n_0_[11]\,
      O => CONSISTENCY_MATCH_i_4_n_0
    );
CONSISTENCY_MATCH_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \RX_CONFIG_SNAPSHOT_reg_n_0_[0]\,
      I1 => Q(0),
      I2 => Q(1),
      I3 => \RX_CONFIG_SNAPSHOT_reg_n_0_[1]\,
      I4 => Q(2),
      I5 => \RX_CONFIG_SNAPSHOT_reg_n_0_[2]\,
      O => \RX_CONFIG_SNAPSHOT_reg[0]_0\
    );
CONSISTENCY_MATCH_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => CONSISTENCY_MATCH_COMB,
      Q => CONSISTENCY_MATCH,
      R => \out\
    );
GENERATE_REMOTE_FAULT_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000D0000000000"
    )
        port map (
      I0 => \STATE[1]_i_3_n_0\,
      I1 => GENERATE_REMOTE_FAULT_i_2_n_0,
      I2 => STATE(3),
      I3 => \STATE[3]_i_3_n_0\,
      I4 => GENERATE_REMOTE_FAULT_i_3_n_0,
      I5 => GENERATE_REMOTE_FAULT_i_4_n_0,
      O => GENERATE_REMOTE_FAULT0
    );
GENERATE_REMOTE_FAULT_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00004000FFFFFFFF"
    )
        port map (
      I0 => \STATE[1]_i_4_n_0\,
      I1 => STATE(0),
      I2 => IDLE_MATCH,
      I3 => LINK_TIMER_DONE,
      I4 => \STATE[1]_i_6_n_0\,
      I5 => \STATE[2]_i_4_n_0\,
      O => GENERATE_REMOTE_FAULT_i_2_n_0
    );
GENERATE_REMOTE_FAULT_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAABAAABAAAA"
    )
        port map (
      I0 => STATE(3),
      I1 => \STATE[0]_i_4_n_0\,
      I2 => GENERATE_REMOTE_FAULT_i_5_n_0,
      I3 => GENERATE_REMOTE_FAULT_i_6_n_0,
      I4 => \STATE[2]_i_4_n_0\,
      I5 => GENERATE_REMOTE_FAULT_i_7_n_0,
      O => GENERATE_REMOTE_FAULT_i_3_n_0
    );
GENERATE_REMOTE_FAULT_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => STATE(3),
      I1 => STATE(0),
      I2 => STATE(2),
      I3 => STATE(1),
      O => GENERATE_REMOTE_FAULT_i_4_n_0
    );
GENERATE_REMOTE_FAULT_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001150"
    )
        port map (
      I0 => STATE(1),
      I1 => LINK_TIMER_DONE,
      I2 => MR_AN_ENABLE_REG1_reg_0(3),
      I3 => STATE(0),
      I4 => STATE(2),
      O => GENERATE_REMOTE_FAULT_i_5_n_0
    );
GENERATE_REMOTE_FAULT_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0700070007000000"
    )
        port map (
      I0 => ABILITY_MATCH,
      I1 => \^rx_config_reg_null_reg_0\,
      I2 => STATE(1),
      I3 => STATE(2),
      I4 => STATE(0),
      I5 => LINK_TIMER_DONE,
      O => GENERATE_REMOTE_FAULT_i_6_n_0
    );
GENERATE_REMOTE_FAULT_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"990F"
    )
        port map (
      I0 => TOGGLE_RX,
      I1 => \RX_CONFIG_REG_REG_reg_n_0_[11]\,
      I2 => STATE(0),
      I3 => ABILITY_MATCH,
      O => GENERATE_REMOTE_FAULT_i_7_n_0
    );
GENERATE_REMOTE_FAULT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => GENERATE_REMOTE_FAULT0,
      Q => GENERATE_REMOTE_FAULT,
      R => \out\
    );
IDLE_INSERTED_REG1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => IDLE_INSERTED,
      Q => IDLE_INSERTED_REG1,
      R => \out\
    );
IDLE_INSERTED_REG2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => IDLE_INSERTED_REG1,
      Q => IDLE_INSERTED_REG2,
      R => \out\
    );
IDLE_INSERTED_REG3_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IDLE_INSERTED_REG2,
      I1 => RX_IDLE_REG2,
      O => IDLE_INSERTED_REG30
    );
IDLE_INSERTED_REG3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => IDLE_INSERTED_REG30,
      Q => IDLE_INSERTED_REG3,
      R => \out\
    );
IDLE_INSERTED_REG4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => IDLE_INSERTED_REG3,
      Q => IDLE_INSERTED_REG4,
      R => \out\
    );
IDLE_INSERTED_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => MASK_RUDI_CLKCOR_reg_0(1),
      I1 => MASK_RUDI_CLKCOR_reg_0(0),
      I2 => XMIT_CONFIG_INT,
      O => IDLE_INSERTED0
    );
IDLE_INSERTED_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => IDLE_INSERTED0,
      Q => IDLE_INSERTED,
      R => \out\
    );
IDLE_MATCH_2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => IDLE_INSERTED_REG2,
      I1 => RX_IDLE,
      I2 => IDLE_INSERTED_REG4,
      O => IDLE_MATCH_20
    );
IDLE_MATCH_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_IDLE_REG2,
      D => IDLE_MATCH_20,
      Q => IDLE_MATCH_2,
      R => \out\
    );
IDLE_MATCH_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4440"
    )
        port map (
      I0 => IDLE_INSERTED_REG2,
      I1 => RX_IDLE,
      I2 => IDLE_REMOVED_REG2,
      I3 => IDLE_MATCH_2,
      O => IDLE_MATCH0
    );
IDLE_MATCH_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_IDLE_REG2,
      D => IDLE_MATCH0,
      Q => IDLE_MATCH,
      R => \out\
    );
IDLE_REMOVED_REG1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => IDLE_REMOVED,
      Q => IDLE_REMOVED_REG1,
      R => \out\
    );
IDLE_REMOVED_REG2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => IDLE_REMOVED_REG1,
      Q => IDLE_REMOVED_REG2,
      R => \out\
    );
IDLE_REMOVED_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => MASK_RUDI_CLKCOR_reg_0(1),
      I1 => MASK_RUDI_CLKCOR_reg_0(0),
      I2 => XMIT_CONFIG_INT,
      O => IDLE_REMOVED0
    );
IDLE_REMOVED_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => IDLE_REMOVED0,
      Q => IDLE_REMOVED,
      R => \out\
    );
\LINK_TIMER[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => LINK_TIMER_reg(0),
      O => \LINK_TIMER[0]_i_1_n_0\
    );
\LINK_TIMER[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => LINK_TIMER_reg(1),
      I1 => LINK_TIMER_reg(0),
      O => \plusOp__1\(1)
    );
\LINK_TIMER[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => LINK_TIMER_reg(2),
      I1 => LINK_TIMER_reg(1),
      I2 => LINK_TIMER_reg(0),
      O => \plusOp__1\(2)
    );
\LINK_TIMER[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => LINK_TIMER_reg(3),
      I1 => LINK_TIMER_reg(0),
      I2 => LINK_TIMER_reg(1),
      I3 => LINK_TIMER_reg(2),
      O => \plusOp__1\(3)
    );
\LINK_TIMER[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => LINK_TIMER_reg(4),
      I1 => LINK_TIMER_reg(2),
      I2 => LINK_TIMER_reg(1),
      I3 => LINK_TIMER_reg(0),
      I4 => LINK_TIMER_reg(3),
      O => \plusOp__1\(4)
    );
\LINK_TIMER[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => LINK_TIMER_reg(3),
      I1 => LINK_TIMER_reg(0),
      I2 => LINK_TIMER_reg(1),
      I3 => LINK_TIMER_reg(2),
      I4 => LINK_TIMER_reg(4),
      I5 => LINK_TIMER_reg(5),
      O => \plusOp__1\(5)
    );
\LINK_TIMER[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => LINK_TIMER_reg(6),
      I1 => \LINK_TIMER[9]_i_3_n_0\,
      O => \plusOp__1\(6)
    );
\LINK_TIMER[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => LINK_TIMER_reg(7),
      I1 => \LINK_TIMER[9]_i_3_n_0\,
      I2 => LINK_TIMER_reg(6),
      O => \plusOp__1\(7)
    );
\LINK_TIMER[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => LINK_TIMER_reg(8),
      I1 => LINK_TIMER_reg(6),
      I2 => \LINK_TIMER[9]_i_3_n_0\,
      I3 => LINK_TIMER_reg(7),
      O => \plusOp__1\(8)
    );
\LINK_TIMER[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF8"
    )
        port map (
      I0 => LINK_TIMER_SATURATED,
      I1 => PULSE4096,
      I2 => START_LINK_TIMER_REG,
      I3 => \out\,
      O => \LINK_TIMER[9]_i_1_n_0\
    );
\LINK_TIMER[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => LINK_TIMER_reg(9),
      I1 => LINK_TIMER_reg(7),
      I2 => \LINK_TIMER[9]_i_3_n_0\,
      I3 => LINK_TIMER_reg(6),
      I4 => LINK_TIMER_reg(8),
      O => \plusOp__1\(9)
    );
\LINK_TIMER[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => LINK_TIMER_reg(5),
      I1 => LINK_TIMER_reg(4),
      I2 => LINK_TIMER_reg(2),
      I3 => LINK_TIMER_reg(1),
      I4 => LINK_TIMER_reg(0),
      I5 => LINK_TIMER_reg(3),
      O => \LINK_TIMER[9]_i_3_n_0\
    );
LINK_TIMER_DONE_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008088"
    )
        port map (
      I0 => LINK_TIMER_DONE_i_2_n_0,
      I1 => \STATE[3]_i_3_n_0\,
      I2 => STATE(3),
      I3 => \STATE[2]_i_2_n_0\,
      I4 => LINK_TIMER_DONE_i_3_n_0,
      O => LINK_TIMER_DONE_i_1_n_0
    );
LINK_TIMER_DONE_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001110"
    )
        port map (
      I0 => START_LINK_TIMER_REG,
      I1 => \out\,
      I2 => LINK_TIMER_SATURATED,
      I3 => LINK_TIMER_DONE,
      I4 => START_LINK_TIMER_REG2,
      O => LINK_TIMER_DONE_i_2_n_0
    );
LINK_TIMER_DONE_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000E00000002"
    )
        port map (
      I0 => MR_AN_ENABLE_REG1_reg_0(3),
      I1 => STATE(2),
      I2 => STATE(1),
      I3 => STATE(3),
      I4 => STATE(0),
      I5 => LINK_TIMER_DONE_i_4_n_0,
      O => LINK_TIMER_DONE_i_3_n_0
    );
LINK_TIMER_DONE_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => LINK_TIMER_DONE,
      I1 => \^rx_config_reg_null_reg_0\,
      I2 => ABILITY_MATCH,
      O => LINK_TIMER_DONE_i_4_n_0
    );
LINK_TIMER_DONE_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => LINK_TIMER_DONE_i_1_n_0,
      Q => LINK_TIMER_DONE,
      R => '0'
    );
LINK_TIMER_SATURATED_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => LINK_TIMER_reg(3),
      I1 => LINK_TIMER_reg(9),
      I2 => LINK_TIMER_reg(4),
      I3 => LINK_TIMER_reg(5),
      I4 => LINK_TIMER_SATURATED_i_2_n_0,
      O => LINK_TIMER_SATURATED_COMB
    );
LINK_TIMER_SATURATED_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFD"
    )
        port map (
      I0 => LINK_TIMER_reg(1),
      I1 => LINK_TIMER_reg(0),
      I2 => LINK_TIMER_reg(6),
      I3 => LINK_TIMER_reg(7),
      I4 => LINK_TIMER_reg(2),
      I5 => LINK_TIMER_reg(8),
      O => LINK_TIMER_SATURATED_i_2_n_0
    );
LINK_TIMER_SATURATED_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => LINK_TIMER_SATURATED_COMB,
      Q => LINK_TIMER_SATURATED,
      R => \out\
    );
\LINK_TIMER_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => PULSE4096,
      D => \LINK_TIMER[0]_i_1_n_0\,
      Q => LINK_TIMER_reg(0),
      R => \LINK_TIMER[9]_i_1_n_0\
    );
\LINK_TIMER_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => PULSE4096,
      D => \plusOp__1\(1),
      Q => LINK_TIMER_reg(1),
      R => \LINK_TIMER[9]_i_1_n_0\
    );
\LINK_TIMER_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => PULSE4096,
      D => \plusOp__1\(2),
      Q => LINK_TIMER_reg(2),
      R => \LINK_TIMER[9]_i_1_n_0\
    );
\LINK_TIMER_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => PULSE4096,
      D => \plusOp__1\(3),
      Q => LINK_TIMER_reg(3),
      R => \LINK_TIMER[9]_i_1_n_0\
    );
\LINK_TIMER_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => PULSE4096,
      D => \plusOp__1\(4),
      Q => LINK_TIMER_reg(4),
      R => \LINK_TIMER[9]_i_1_n_0\
    );
\LINK_TIMER_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => PULSE4096,
      D => \plusOp__1\(5),
      Q => LINK_TIMER_reg(5),
      R => \LINK_TIMER[9]_i_1_n_0\
    );
\LINK_TIMER_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => PULSE4096,
      D => \plusOp__1\(6),
      Q => LINK_TIMER_reg(6),
      R => \LINK_TIMER[9]_i_1_n_0\
    );
\LINK_TIMER_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => PULSE4096,
      D => \plusOp__1\(7),
      Q => LINK_TIMER_reg(7),
      R => \LINK_TIMER[9]_i_1_n_0\
    );
\LINK_TIMER_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => PULSE4096,
      D => \plusOp__1\(8),
      Q => LINK_TIMER_reg(8),
      R => \LINK_TIMER[9]_i_1_n_0\
    );
\LINK_TIMER_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => PULSE4096,
      D => \plusOp__1\(9),
      Q => LINK_TIMER_reg(9),
      R => \LINK_TIMER[9]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5155"
    )
        port map (
      I0 => MASK_RUDI_BUFERR_TIMER(0),
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[0]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry__0_n_14\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[10]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry__0_n_13\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[11]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry__0_n_12\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[12]_i_2_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[12]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \MASK_RUDI_BUFERR_TIMER[12]_i_4_n_0\,
      I1 => \MASK_RUDI_BUFERR_TIMER[12]_i_5_n_0\,
      I2 => MASK_RUDI_BUFERR_TIMER(3),
      I3 => MASK_RUDI_BUFERR_TIMER(1),
      I4 => MASK_RUDI_BUFERR_TIMER(8),
      O => \^mask_rudi_buferr_timer_reg[3]_0\
    );
\MASK_RUDI_BUFERR_TIMER[12]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => MASK_RUDI_BUFERR_TIMER(10),
      I1 => MASK_RUDI_BUFERR_TIMER(12),
      I2 => MASK_RUDI_BUFERR_TIMER(0),
      I3 => MASK_RUDI_BUFERR_TIMER(2),
      I4 => MASK_RUDI_BUFERR_TIMER(7),
      I5 => MASK_RUDI_BUFERR_TIMER(4),
      O => \MASK_RUDI_BUFERR_TIMER[12]_i_4_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[12]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => MASK_RUDI_BUFERR_TIMER(6),
      I1 => MASK_RUDI_BUFERR_TIMER(5),
      I2 => MASK_RUDI_BUFERR_TIMER(11),
      I3 => MASK_RUDI_BUFERR_TIMER(9),
      O => \MASK_RUDI_BUFERR_TIMER[12]_i_5_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry_n_15\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[1]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry_n_14\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[2]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry_n_13\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[3]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry_n_12\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[4]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry_n_11\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[5]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry_n_10\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[6]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry_n_9\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[7]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry_n_8\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[8]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A2AA"
    )
        port map (
      I0 => \plusOp_inferred__0/i__carry__0_n_15\,
      I1 => data_out,
      I2 => MR_AN_ENABLE_REG1_reg_0(1),
      I3 => p_0_in,
      O => \MASK_RUDI_BUFERR_TIMER[9]_i_1_n_0\
    );
\MASK_RUDI_BUFERR_TIMER_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[0]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(0),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[10]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[10]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(10),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[11]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[11]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(11),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[12]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[12]_i_2_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(12),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[1]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(1),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[2]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(2),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[3]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(3),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[4]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(4),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[5]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(5),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[6]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(6),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[7]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(7),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[8]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(8),
      S => \out\
    );
\MASK_RUDI_BUFERR_TIMER_reg[9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \MASK_RUDI_BUFERR_TIMER_reg[12]_0\,
      D => \MASK_RUDI_BUFERR_TIMER[9]_i_1_n_0\,
      Q => MASK_RUDI_BUFERR_TIMER(9),
      S => \out\
    );
MASK_RUDI_BUFERR_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20FF2020"
    )
        port map (
      I0 => data_out,
      I1 => MR_AN_ENABLE_REG1_reg_0(1),
      I2 => p_0_in,
      I3 => \^mask_rudi_buferr_timer_reg[3]_0\,
      I4 => MASK_RUDI_BUFERR,
      O => MASK_RUDI_BUFERR_i_1_n_0
    );
MASK_RUDI_BUFERR_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => MASK_RUDI_BUFERR_i_1_n_0,
      Q => MASK_RUDI_BUFERR,
      R => \out\
    );
MASK_RUDI_CLKCOR_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFBFFF0"
    )
        port map (
      I0 => RX_RUDI_INVALID,
      I1 => RX_RUDI_INVALID_REG,
      I2 => MASK_RUDI_CLKCOR_reg_0(1),
      I3 => MASK_RUDI_CLKCOR_reg_0(0),
      I4 => MASK_RUDI_CLKCOR,
      O => MASK_RUDI_CLKCOR_i_1_n_0
    );
MASK_RUDI_CLKCOR_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => MASK_RUDI_CLKCOR_i_1_n_0,
      Q => MASK_RUDI_CLKCOR,
      R => RX_RUDI_INVALID_REG_reg_0
    );
MR_AN_COMPLETE_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2232222222222020"
    )
        port map (
      I0 => \^an_interrupt\,
      I1 => \out\,
      I2 => STATE(2),
      I3 => STATE(3),
      I4 => STATE(0),
      I5 => STATE(1),
      O => MR_AN_COMPLETE_i_1_n_0
    );
MR_AN_COMPLETE_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => MR_AN_COMPLETE_i_1_n_0,
      Q => \^an_interrupt\,
      R => '0'
    );
MR_AN_ENABLE_CHANGE_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => MR_AN_ENABLE_REG2,
      I1 => MR_AN_ENABLE_REG1,
      O => MR_AN_ENABLE_CHANGE0
    );
MR_AN_ENABLE_CHANGE_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => MR_AN_ENABLE_CHANGE0,
      Q => MR_AN_ENABLE_CHANGE,
      R => \out\
    );
MR_AN_ENABLE_REG1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => MR_AN_ENABLE_REG1_reg_0(3),
      Q => MR_AN_ENABLE_REG1,
      R => \out\
    );
MR_AN_ENABLE_REG2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => MR_AN_ENABLE_REG1,
      Q => MR_AN_ENABLE_REG2,
      R => \out\
    );
\MR_LP_ADV_ABILITY_INT_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => MR_PAGE_RX_SET0,
      D => Q(12),
      Q => \MR_LP_ADV_ABILITY_INT_reg[13]_0\(0),
      R => \out\
    );
\MR_LP_ADV_ABILITY_INT_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => MR_PAGE_RX_SET0,
      D => Q(15),
      Q => \MR_LP_ADV_ABILITY_INT_reg_n_0_[16]\,
      R => \out\
    );
MR_REMOTE_FAULT_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \MR_LP_ADV_ABILITY_INT_reg_n_0_[16]\,
      I1 => GENERATE_REMOTE_FAULT,
      I2 => \^status_vector\(5),
      O => MR_REMOTE_FAULT_i_1_n_0
    );
MR_REMOTE_FAULT_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => MR_REMOTE_FAULT_i_1_n_0,
      Q => \^status_vector\(5),
      R => \out\
    );
MR_RESTART_AN_INT_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AE0C0C0C"
    )
        port map (
      I0 => START_LINK_TIMER_REG_i_2_n_0,
      I1 => MR_RESTART_AN_SET_REG1,
      I2 => MR_RESTART_AN_SET_REG2,
      I3 => MR_AN_ENABLE_REG1_reg_0(3),
      I4 => MR_RESTART_AN_INT,
      O => MR_RESTART_AN_INT_i_1_n_0
    );
MR_RESTART_AN_INT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => MR_RESTART_AN_INT_i_1_n_0,
      Q => MR_RESTART_AN_INT,
      R => \out\
    );
MR_RESTART_AN_SET_REG1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RESTART_AN_SET,
      Q => MR_RESTART_AN_SET_REG1,
      R => \out\
    );
MR_RESTART_AN_SET_REG2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => MR_RESTART_AN_SET_REG1,
      Q => MR_RESTART_AN_SET_REG2,
      R => \out\
    );
\PREVIOUS_STATE_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => STATE(0),
      Q => PREVIOUS_STATE(0),
      R => \out\
    );
\PREVIOUS_STATE_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => STATE(1),
      Q => PREVIOUS_STATE(1),
      R => \out\
    );
\PREVIOUS_STATE_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => STATE(2),
      Q => PREVIOUS_STATE(2),
      R => \out\
    );
\PREVIOUS_STATE_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => STATE(3),
      Q => PREVIOUS_STATE(3),
      R => \out\
    );
PULSE4096_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => TIMER4096_MSB_REG,
      I1 => TIMER4096_reg(11),
      O => PULSE40960
    );
PULSE4096_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => PULSE40960,
      Q => PULSE4096,
      R => \out\
    );
RECEIVED_IDLE_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RECEIVED_IDLE_reg_0,
      Q => \^received_idle\,
      R => \out\
    );
RUDI_INVALID_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => RX_RUDI_INVALID_DELAY(1),
      Q => \^status_vector\(0),
      R => \out\
    );
RX_CONFIG_REG_NULL_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RX_CONFIG_REG_NULL_reg_1,
      Q => \^rx_config_reg_null_reg_0\,
      R => \out\
    );
\RX_CONFIG_REG_REG_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(0),
      Q => \RX_CONFIG_REG_REG_reg_n_0_[0]\,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(10),
      Q => \RX_CONFIG_REG_REG_reg_n_0_[10]\,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(11),
      Q => \RX_CONFIG_REG_REG_reg_n_0_[11]\,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(12),
      Q => \RX_CONFIG_REG_REG_reg_n_0_[12]\,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(13),
      Q => \RX_CONFIG_REG_REG_reg_n_0_[13]\,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(14),
      Q => p_0_in26_in,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(15),
      Q => p_0_in0_in,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(1),
      Q => \RX_CONFIG_REG_REG_reg_n_0_[1]\,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(2),
      Q => \RX_CONFIG_REG_REG_reg_n_0_[2]\,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(3),
      Q => \RX_CONFIG_REG_REG_reg[5]_0\(0),
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(4),
      Q => \RX_CONFIG_REG_REG_reg[5]_0\(1),
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(5),
      Q => \RX_CONFIG_REG_REG_reg[5]_0\(2),
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(6),
      Q => \RX_CONFIG_REG_REG_reg_n_0_[6]\,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(7),
      Q => \RX_CONFIG_REG_REG_reg_n_0_[7]\,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(8),
      Q => \RX_CONFIG_REG_REG_reg_n_0_[8]\,
      R => SR(0)
    );
\RX_CONFIG_REG_REG_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_VALID,
      D => Q(9),
      Q => \RX_CONFIG_REG_REG_reg_n_0_[9]\,
      R => SR(0)
    );
\RX_CONFIG_SNAPSHOT[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0D00000000000000"
    )
        port map (
      I0 => \RX_CONFIG_SNAPSHOT[15]_i_2_n_0\,
      I1 => \RX_CONFIG_SNAPSHOT[15]_i_3_n_0\,
      I2 => ABILITY_MATCH,
      I3 => RX_CONFIG_VALID,
      I4 => ABILITY_MATCH_2,
      I5 => CONFIG_REG_MATCH,
      O => RX_CONFIG_SNAPSHOT
    );
\RX_CONFIG_SNAPSHOT[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => STATE(0),
      I1 => STATE(1),
      O => \RX_CONFIG_SNAPSHOT[15]_i_2_n_0\
    );
\RX_CONFIG_SNAPSHOT[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => STATE(2),
      I1 => STATE(3),
      O => \RX_CONFIG_SNAPSHOT[15]_i_3_n_0\
    );
\RX_CONFIG_SNAPSHOT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(0),
      Q => \RX_CONFIG_SNAPSHOT_reg_n_0_[0]\,
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(10),
      Q => \RX_CONFIG_SNAPSHOT_reg_n_0_[10]\,
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(11),
      Q => \RX_CONFIG_SNAPSHOT_reg_n_0_[11]\,
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(12),
      Q => \RX_CONFIG_SNAPSHOT_reg[13]_0\(3),
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(13),
      Q => \RX_CONFIG_SNAPSHOT_reg[13]_0\(4),
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(15),
      Q => \RX_CONFIG_SNAPSHOT_reg_n_0_[15]\,
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(1),
      Q => \RX_CONFIG_SNAPSHOT_reg_n_0_[1]\,
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(2),
      Q => \RX_CONFIG_SNAPSHOT_reg_n_0_[2]\,
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(3),
      Q => \RX_CONFIG_SNAPSHOT_reg[13]_0\(0),
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(4),
      Q => \RX_CONFIG_SNAPSHOT_reg[13]_0\(1),
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(5),
      Q => \RX_CONFIG_SNAPSHOT_reg[13]_0\(2),
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(6),
      Q => \RX_CONFIG_SNAPSHOT_reg_n_0_[6]\,
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(7),
      Q => \RX_CONFIG_SNAPSHOT_reg_n_0_[7]\,
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(8),
      Q => \RX_CONFIG_SNAPSHOT_reg_n_0_[8]\,
      R => \out\
    );
\RX_CONFIG_SNAPSHOT_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => RX_CONFIG_SNAPSHOT,
      D => Q(9),
      Q => \RX_CONFIG_SNAPSHOT_reg_n_0_[9]\,
      R => \out\
    );
RX_DV_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \^no_management.configuration_vector_reg_reg[0]\,
      I1 => SOP_REG3,
      I2 => MR_AN_ENABLE_REG1_reg_0(2),
      I3 => MR_AN_ENABLE_REG1_reg_0(1),
      O => RX_DV0
    );
RX_ER_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F2F2F200"
    )
        port map (
      I0 => MR_AN_ENABLE_REG1_reg_0(0),
      I1 => MR_AN_ENABLE_REG1_reg_0(3),
      I2 => \^xmit_data_int\,
      I3 => RECEIVE,
      I4 => RXSYNC_STATUS,
      O => \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg[0]_0\
    );
RX_IDLE_REG1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RX_IDLE,
      Q => RX_IDLE_REG1,
      R => \out\
    );
RX_IDLE_REG2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RX_IDLE_REG1,
      Q => RX_IDLE_REG2,
      R => \out\
    );
\RX_RUDI_INVALID_DELAY[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000000AB"
    )
        port map (
      I0 => RX_INVALID,
      I1 => \^xmit_data\,
      I2 => RXSYNC_STATUS,
      I3 => MASK_RUDI_BUFERR,
      I4 => MASK_RUDI_CLKCOR,
      O => RX_RUDI_INVALID_DELAY0
    );
\RX_RUDI_INVALID_DELAY_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RX_RUDI_INVALID_DELAY0,
      Q => RX_RUDI_INVALID_DELAY(0),
      R => \out\
    );
\RX_RUDI_INVALID_DELAY_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RX_RUDI_INVALID_DELAY(0),
      Q => RX_RUDI_INVALID_DELAY(1),
      R => \out\
    );
RX_RUDI_INVALID_REG_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RX_RUDI_INVALID,
      Q => RX_RUDI_INVALID_REG,
      R => RX_RUDI_INVALID_REG_reg_0
    );
SGMII_PHY_STATUS_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => MR_PAGE_RX_SET0,
      D => Q(15),
      Q => \^status_vector\(1),
      R => \out\
    );
\SGMII_SPEED[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => \SGMII_SPEED[1]_i_2_n_0\,
      I1 => PREVIOUS_STATE(3),
      I2 => PREVIOUS_STATE(2),
      I3 => PREVIOUS_STATE(0),
      I4 => PREVIOUS_STATE(1),
      O => MR_PAGE_RX_SET0
    );
\SGMII_SPEED[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => STATE(2),
      I1 => STATE(1),
      I2 => STATE(3),
      I3 => STATE(0),
      O => \SGMII_SPEED[1]_i_2_n_0\
    );
\SGMII_SPEED_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => MR_PAGE_RX_SET0,
      D => Q(10),
      Q => \^status_vector\(3),
      R => \out\
    );
\SGMII_SPEED_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => MR_PAGE_RX_SET0,
      D => Q(11),
      Q => \^status_vector\(4),
      S => \out\
    );
START_LINK_TIMER_REG2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => START_LINK_TIMER_REG,
      Q => START_LINK_TIMER_REG2,
      R => \out\
    );
START_LINK_TIMER_REG_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4F4FFF4FFFFFFFF"
    )
        port map (
      I0 => START_LINK_TIMER_REG_i_2_n_0,
      I1 => MR_AN_ENABLE_REG1_reg_0(3),
      I2 => START_LINK_TIMER_REG_i_3_n_0,
      I3 => \STATE[2]_i_2_n_0\,
      I4 => STATE(3),
      I5 => \STATE[3]_i_3_n_0\,
      O => START_LINK_TIMER
    );
START_LINK_TIMER_REG_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => STATE(1),
      I1 => STATE(0),
      I2 => STATE(3),
      I3 => STATE(2),
      O => START_LINK_TIMER_REG_i_2_n_0
    );
START_LINK_TIMER_REG_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000070"
    )
        port map (
      I0 => ABILITY_MATCH,
      I1 => \^rx_config_reg_null_reg_0\,
      I2 => LINK_TIMER_DONE,
      I3 => STATE(0),
      I4 => STATE(3),
      I5 => \STATE[1]_i_4_n_0\,
      O => START_LINK_TIMER_REG_i_3_n_0
    );
START_LINK_TIMER_REG_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => START_LINK_TIMER,
      Q => START_LINK_TIMER_REG,
      R => \out\
    );
\STATE[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AAA2"
    )
        port map (
      I0 => \STATE[3]_i_3_n_0\,
      I1 => \STATE[0]_i_2_n_0\,
      I2 => \STATE[0]_i_3_n_0\,
      I3 => \STATE[0]_i_4_n_0\,
      I4 => STATE(3),
      O => \STATE[0]_i_1_n_0\
    );
\STATE[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFABABEF"
    )
        port map (
      I0 => \STATE[2]_i_4_n_0\,
      I1 => ABILITY_MATCH,
      I2 => STATE(0),
      I3 => \RX_CONFIG_REG_REG_reg_n_0_[11]\,
      I4 => TOGGLE_RX,
      O => \STATE[0]_i_2_n_0\
    );
\STATE[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000047447370"
    )
        port map (
      I0 => \STATE[1]_i_6_n_0\,
      I1 => STATE(2),
      I2 => STATE(0),
      I3 => MR_AN_ENABLE_REG1_reg_0(3),
      I4 => LINK_TIMER_DONE,
      I5 => STATE(1),
      O => \STATE[0]_i_3_n_0\
    );
\STATE[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000007CC00000000"
    )
        port map (
      I0 => ACKNOWLEDGE_MATCH_3_reg_n_0,
      I1 => STATE(0),
      I2 => \^rx_config_reg_null_reg_0\,
      I3 => ABILITY_MATCH,
      I4 => STATE(2),
      I5 => STATE(1),
      O => \STATE[0]_i_4_n_0\
    );
\STATE[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40444444"
    )
        port map (
      I0 => STATE(3),
      I1 => \STATE[3]_i_3_n_0\,
      I2 => \STATE[1]_i_2_n_0\,
      I3 => \STATE[2]_i_4_n_0\,
      I4 => \STATE[1]_i_3_n_0\,
      O => \STATE[1]_i_1_n_0\
    );
\STATE[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000070000000"
    )
        port map (
      I0 => ABILITY_MATCH,
      I1 => \^rx_config_reg_null_reg_0\,
      I2 => LINK_TIMER_DONE,
      I3 => IDLE_MATCH,
      I4 => STATE(0),
      I5 => \STATE[1]_i_4_n_0\,
      O => \STATE[1]_i_2_n_0\
    );
\STATE[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFD0D00FFF"
    )
        port map (
      I0 => \STATE[1]_i_5_n_0\,
      I1 => \STATE[1]_i_6_n_0\,
      I2 => STATE(0),
      I3 => LINK_TIMER_DONE,
      I4 => STATE(1),
      I5 => STATE(2),
      O => \STATE[1]_i_3_n_0\
    );
\STATE[1]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => STATE(1),
      I1 => STATE(2),
      O => \STATE[1]_i_4_n_0\
    );
\STATE[1]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => ABILITY_MATCH,
      I1 => ACKNOWLEDGE_MATCH_3_reg_n_0,
      O => \STATE[1]_i_5_n_0\
    );
\STATE[1]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ABILITY_MATCH,
      I1 => \^rx_config_reg_null_reg_0\,
      O => \STATE[1]_i_6_n_0\
    );
\STATE[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4440444444404440"
    )
        port map (
      I0 => STATE(3),
      I1 => \STATE[3]_i_3_n_0\,
      I2 => \STATE[2]_i_2_n_0\,
      I3 => \STATE[2]_i_3_n_0\,
      I4 => \STATE[2]_i_4_n_0\,
      I5 => \STATE[2]_i_5_n_0\,
      O => \STATE[2]_i_1_n_0\
    );
\STATE[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040000000000000"
    )
        port map (
      I0 => \^rx_config_reg_null_reg_0\,
      I1 => STATE(0),
      I2 => CONSISTENCY_MATCH,
      I3 => \STATE[2]_i_6_n_0\,
      I4 => ABILITY_MATCH,
      I5 => ACKNOWLEDGE_MATCH_3_reg_n_0,
      O => \STATE[2]_i_2_n_0\
    );
\STATE[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0222"
    )
        port map (
      I0 => STATE(2),
      I1 => STATE(1),
      I2 => \^rx_config_reg_null_reg_0\,
      I3 => ABILITY_MATCH,
      O => \STATE[2]_i_3_n_0\
    );
\STATE[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C8FFFFFF"
    )
        port map (
      I0 => \^rx_config_reg_null_reg_0\,
      I1 => ABILITY_MATCH,
      I2 => STATE(0),
      I3 => STATE(2),
      I4 => STATE(1),
      O => \STATE[2]_i_4_n_0\
    );
\STATE[2]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D7"
    )
        port map (
      I0 => ABILITY_MATCH,
      I1 => \RX_CONFIG_REG_REG_reg_n_0_[11]\,
      I2 => TOGGLE_RX,
      O => \STATE[2]_i_5_n_0\
    );
\STATE[2]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => STATE(2),
      I1 => STATE(1),
      O => \STATE[2]_i_6_n_0\
    );
\STATE[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => \STATE[3]_i_2_n_0\,
      I1 => \STATE[3]_i_3_n_0\,
      I2 => AN_SYNC_STATUS,
      I3 => MR_AN_ENABLE_REG1_reg_0(3),
      O => \STATE[3]_i_1_n_0\
    );
\STATE[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100011"
    )
        port map (
      I0 => STATE(1),
      I1 => STATE(0),
      I2 => STATE(3),
      I3 => STATE(2),
      I4 => MR_AN_ENABLE_REG1_reg_0(3),
      O => \STATE[3]_i_2_n_0\
    );
\STATE[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FDFF"
    )
        port map (
      I0 => XMIT_CONFIG_INT,
      I1 => MASK_RUDI_CLKCOR,
      I2 => MASK_RUDI_BUFERR,
      I3 => RX_RUDI_INVALID,
      I4 => \STATE[3]_i_4_n_0\,
      O => \STATE[3]_i_3_n_0\
    );
\STATE[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => AN_SYNC_STATUS,
      I1 => MR_RESTART_AN_INT,
      I2 => MR_AN_ENABLE_CHANGE,
      O => \STATE[3]_i_4_n_0\
    );
\STATE_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \STATE[0]_i_1_n_0\,
      Q => STATE(0),
      R => \out\
    );
\STATE_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \STATE[1]_i_1_n_0\,
      Q => STATE(1),
      R => \out\
    );
\STATE_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \STATE[2]_i_1_n_0\,
      Q => STATE(2),
      R => \out\
    );
\STATE_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \STATE[3]_i_1_n_0\,
      Q => STATE(3),
      R => \out\
    );
STATUS_VECTOR_0_PRE_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F200"
    )
        port map (
      I0 => MR_AN_ENABLE_REG1_reg_0(0),
      I1 => MR_AN_ENABLE_REG1_reg_0(3),
      I2 => \^xmit_data_int\,
      I3 => RXSYNC_STATUS,
      O => \^no_management.configuration_vector_reg_reg[0]\
    );
SYNC_STATUS_HELD_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFAA"
    )
        port map (
      I0 => RXSYNC_STATUS,
      I1 => LINK_TIMER_SATURATED,
      I2 => PULSE4096,
      I3 => SYNC_STATUS_HELD,
      O => SYNC_STATUS_HELD_i_1_n_0
    );
SYNC_STATUS_HELD_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => SYNC_STATUS_HELD_i_1_n_0,
      Q => SYNC_STATUS_HELD,
      R => \out\
    );
\TIMER4096[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \TIMER4096_reg_n_0_[0]\,
      O => \plusOp__0\(0)
    );
TIMER4096_MSB_REG_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => TIMER4096_reg(11),
      Q => TIMER4096_MSB_REG,
      R => \out\
    );
\TIMER4096_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(0),
      Q => \TIMER4096_reg_n_0_[0]\,
      R => \out\
    );
\TIMER4096_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(10),
      Q => \TIMER4096_reg_n_0_[10]\,
      R => \out\
    );
\TIMER4096_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(11),
      Q => TIMER4096_reg(11),
      R => \out\
    );
\TIMER4096_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(1),
      Q => \TIMER4096_reg_n_0_[1]\,
      R => \out\
    );
\TIMER4096_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(2),
      Q => \TIMER4096_reg_n_0_[2]\,
      R => \out\
    );
\TIMER4096_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(3),
      Q => \TIMER4096_reg_n_0_[3]\,
      R => \out\
    );
\TIMER4096_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(4),
      Q => \TIMER4096_reg_n_0_[4]\,
      R => \out\
    );
\TIMER4096_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(5),
      Q => \TIMER4096_reg_n_0_[5]\,
      R => \out\
    );
\TIMER4096_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(6),
      Q => \TIMER4096_reg_n_0_[6]\,
      R => \out\
    );
\TIMER4096_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(7),
      Q => \TIMER4096_reg_n_0_[7]\,
      R => \out\
    );
\TIMER4096_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(8),
      Q => \TIMER4096_reg_n_0_[8]\,
      R => \out\
    );
\TIMER4096_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \plusOp__0\(9),
      Q => \TIMER4096_reg_n_0_[9]\,
      R => \out\
    );
TOGGLE_RX_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => MR_PAGE_RX_SET0,
      D => Q(11),
      Q => TOGGLE_RX,
      R => \out\
    );
TOGGLE_TX_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33BA33BBCC8ACC88"
    )
        port map (
      I0 => an_adv_config_vector(0),
      I1 => MR_PAGE_RX_SET0,
      I2 => TOGGLE_TX_i_2_n_0,
      I3 => STATE(2),
      I4 => STATE(1),
      I5 => TOGGLE_TX,
      O => TOGGLE_TX_i_1_n_0
    );
TOGGLE_TX_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => STATE(0),
      I1 => STATE(3),
      O => TOGGLE_TX_i_2_n_0
    );
TOGGLE_TX_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => TOGGLE_TX_i_1_n_0,
      Q => TOGGLE_TX,
      R => \out\
    );
\TX_CONFIG_REG_INT[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => STATE(1),
      I1 => STATE(2),
      O => \TX_CONFIG_REG_INT[0]_i_1_n_0\
    );
\TX_CONFIG_REG_INT[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"000D"
    )
        port map (
      I0 => STATE(2),
      I1 => STATE(1),
      I2 => STATE(3),
      I3 => STATE(0),
      O => \TX_CONFIG_REG_INT[11]_i_1_n_0\
    );
\TX_CONFIG_REG_INT[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => STATE(2),
      I1 => TOGGLE_TX,
      O => \TX_CONFIG_REG_INT[11]_i_2_n_0\
    );
\TX_CONFIG_REG_INT[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FAFE0200"
    )
        port map (
      I0 => STATE(0),
      I1 => STATE(2),
      I2 => STATE(3),
      I3 => STATE(1),
      I4 => \^d\(2),
      O => \TX_CONFIG_REG_INT[14]_i_1_n_0\
    );
\TX_CONFIG_REG_INT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \TX_CONFIG_REG_INT[11]_i_1_n_0\,
      D => \TX_CONFIG_REG_INT[0]_i_1_n_0\,
      Q => \^d\(0),
      R => \out\
    );
\TX_CONFIG_REG_INT_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => \TX_CONFIG_REG_INT[11]_i_1_n_0\,
      D => \TX_CONFIG_REG_INT[11]_i_2_n_0\,
      Q => \^d\(1),
      R => \out\
    );
\TX_CONFIG_REG_INT_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \TX_CONFIG_REG_INT[14]_i_1_n_0\,
      Q => \^d\(2),
      R => \out\
    );
XMIT_CONFIG_INT_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0F002F20"
    )
        port map (
      I0 => XMIT_CONFIG_INT,
      I1 => \XMIT_CONFIG_INT_i_2__0_n_0\,
      I2 => START_LINK_TIMER_REG_i_2_n_0,
      I3 => MR_AN_ENABLE_REG1_reg_0(3),
      I4 => GENERATE_REMOTE_FAULT_i_4_n_0,
      I5 => \out\,
      O => XMIT_CONFIG_INT_i_1_n_0
    );
XMIT_CONFIG_INT_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => XMIT_CONFIG_INT,
      I1 => MR_AN_ENABLE_REG1_reg_0(3),
      I2 => MR_AN_ENABLE_REG1_reg_0(0),
      O => XMIT_CONFIG
    );
\XMIT_CONFIG_INT_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => STATE(1),
      I1 => STATE(0),
      I2 => STATE(3),
      I3 => STATE(2),
      O => \XMIT_CONFIG_INT_i_2__0_n_0\
    );
XMIT_CONFIG_INT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => XMIT_CONFIG_INT_i_1_n_0,
      Q => XMIT_CONFIG_INT,
      R => '0'
    );
XMIT_DATA_INT_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^xmit_data_int\,
      I1 => MR_AN_ENABLE_REG1_reg_0(3),
      I2 => MR_AN_ENABLE_REG1_reg_0(0),
      O => \^xmit_data\
    );
\XMIT_DATA_INT_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0180"
    )
        port map (
      I0 => STATE(2),
      I1 => STATE(1),
      I2 => STATE(0),
      I3 => STATE(3),
      O => XMIT_DATA_INT0
    );
XMIT_DATA_INT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => XMIT_DATA_INT0,
      Q => \^xmit_data_int\,
      R => \out\
    );
plusOp_carry: unisim.vcomponents.CARRY8
     port map (
      CI => \TIMER4096_reg_n_0_[0]\,
      CI_TOP => '0',
      CO(7) => plusOp_carry_n_0,
      CO(6) => plusOp_carry_n_1,
      CO(5) => plusOp_carry_n_2,
      CO(4) => plusOp_carry_n_3,
      CO(3) => plusOp_carry_n_4,
      CO(2) => plusOp_carry_n_5,
      CO(1) => plusOp_carry_n_6,
      CO(0) => plusOp_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \plusOp__0\(8 downto 1),
      S(7) => \TIMER4096_reg_n_0_[8]\,
      S(6) => \TIMER4096_reg_n_0_[7]\,
      S(5) => \TIMER4096_reg_n_0_[6]\,
      S(4) => \TIMER4096_reg_n_0_[5]\,
      S(3) => \TIMER4096_reg_n_0_[4]\,
      S(2) => \TIMER4096_reg_n_0_[3]\,
      S(1) => \TIMER4096_reg_n_0_[2]\,
      S(0) => \TIMER4096_reg_n_0_[1]\
    );
\plusOp_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => plusOp_carry_n_0,
      CI_TOP => '0',
      CO(7 downto 2) => \NLW_plusOp_carry__0_CO_UNCONNECTED\(7 downto 2),
      CO(1) => \plusOp_carry__0_n_6\,
      CO(0) => \plusOp_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 3) => \NLW_plusOp_carry__0_O_UNCONNECTED\(7 downto 3),
      O(2 downto 0) => \plusOp__0\(11 downto 9),
      S(7 downto 3) => B"00000",
      S(2) => TIMER4096_reg(11),
      S(1) => \TIMER4096_reg_n_0_[10]\,
      S(0) => \TIMER4096_reg_n_0_[9]\
    );
\plusOp_inferred__0/i__carry\: unisim.vcomponents.CARRY8
     port map (
      CI => MASK_RUDI_BUFERR_TIMER(0),
      CI_TOP => '0',
      CO(7) => \plusOp_inferred__0/i__carry_n_0\,
      CO(6) => \plusOp_inferred__0/i__carry_n_1\,
      CO(5) => \plusOp_inferred__0/i__carry_n_2\,
      CO(4) => \plusOp_inferred__0/i__carry_n_3\,
      CO(3) => \plusOp_inferred__0/i__carry_n_4\,
      CO(2) => \plusOp_inferred__0/i__carry_n_5\,
      CO(1) => \plusOp_inferred__0/i__carry_n_6\,
      CO(0) => \plusOp_inferred__0/i__carry_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \plusOp_inferred__0/i__carry_n_8\,
      O(6) => \plusOp_inferred__0/i__carry_n_9\,
      O(5) => \plusOp_inferred__0/i__carry_n_10\,
      O(4) => \plusOp_inferred__0/i__carry_n_11\,
      O(3) => \plusOp_inferred__0/i__carry_n_12\,
      O(2) => \plusOp_inferred__0/i__carry_n_13\,
      O(1) => \plusOp_inferred__0/i__carry_n_14\,
      O(0) => \plusOp_inferred__0/i__carry_n_15\,
      S(7 downto 0) => MASK_RUDI_BUFERR_TIMER(8 downto 1)
    );
\plusOp_inferred__0/i__carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => \plusOp_inferred__0/i__carry_n_0\,
      CI_TOP => '0',
      CO(7 downto 3) => \NLW_plusOp_inferred__0/i__carry__0_CO_UNCONNECTED\(7 downto 3),
      CO(2) => \plusOp_inferred__0/i__carry__0_n_5\,
      CO(1) => \plusOp_inferred__0/i__carry__0_n_6\,
      CO(0) => \plusOp_inferred__0/i__carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 4) => \NLW_plusOp_inferred__0/i__carry__0_O_UNCONNECTED\(7 downto 4),
      O(3) => \plusOp_inferred__0/i__carry__0_n_12\,
      O(2) => \plusOp_inferred__0/i__carry__0_n_13\,
      O(1) => \plusOp_inferred__0/i__carry__0_n_14\,
      O(0) => \plusOp_inferred__0/i__carry__0_n_15\,
      S(7 downto 4) => B"0000",
      S(3 downto 0) => MASK_RUDI_BUFERR_TIMER(12 downto 9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_RX is
  port (
    K28p5_REG1 : out STD_LOGIC;
    RX_IDLE : out STD_LOGIC;
    S2 : out STD_LOGIC;
    SOP_REG3 : out STD_LOGIC;
    gmii_rx_er : out STD_LOGIC;
    RX_CONFIG_VALID : out STD_LOGIC;
    status_vector : out STD_LOGIC_VECTOR ( 1 downto 0 );
    RECEIVE : out STD_LOGIC;
    gmii_rx_dv : out STD_LOGIC;
    RX_INVALID : out STD_LOGIC;
    RX_RUDI_INVALID : out STD_LOGIC;
    \MGT_RESET.SRESET_reg\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \RX_CONFIG_REG_reg[4]_0\ : out STD_LOGIC;
    \RX_CONFIG_REG_reg[15]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \RX_CONFIG_REG_reg[13]_0\ : out STD_LOGIC;
    BASEX_REMOTE_FAULT_RSLVD : out STD_LOGIC_VECTOR ( 0 to 0 );
    I_REG_reg_0 : out STD_LOGIC;
    RX_CONFIG_VALID_INT_reg_0 : out STD_LOGIC;
    gmii_rxd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    userclk2 : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    SYNC_STATUS_REG0 : in STD_LOGIC;
    RXCHARISK_REG1_reg_0 : in STD_LOGIC;
    RXEVEN0_out : in STD_LOGIC;
    \RX_CONFIG_REG_reg[7]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    RX_INVALID_reg_0 : in STD_LOGIC;
    RXSYNC_STATUS : in STD_LOGIC;
    XMIT_DATA_INT : in STD_LOGIC;
    RX_RUDI_INVALID_REG_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    RX_ER_reg_0 : in STD_LOGIC;
    RXNOTINTABLE_INT : in STD_LOGIC;
    FALSE_NIT_reg_0 : in STD_LOGIC;
    EXTEND_reg_0 : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    CONFIG_REG_MATCH_reg : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CONSISTENCY_MATCH_reg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    CONSISTENCY_MATCH_reg_0 : in STD_LOGIC;
    D : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    RX_DV0 : in STD_LOGIC;
    XMIT_DATA : in STD_LOGIC;
    RECEIVED_IDLE : in STD_LOGIC;
    RX_CONFIG_REG_NULL_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_RX : entity is "RX";
end gig_ethernet_pcs_pma_0_RX;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_RX is
  signal C : STD_LOGIC;
  signal C0 : STD_LOGIC;
  signal CGBAD : STD_LOGIC;
  signal CGBAD_REG1 : STD_LOGIC;
  signal CGBAD_REG2 : STD_LOGIC;
  signal CGBAD_REG3 : STD_LOGIC;
  signal CONSISTENCY_MATCH_i_6_n_0 : STD_LOGIC;
  signal C_HDR_REMOVED : STD_LOGIC;
  signal C_HDR_REMOVED_REG : STD_LOGIC;
  signal C_REG1 : STD_LOGIC;
  signal C_REG2 : STD_LOGIC;
  signal C_REG3 : STD_LOGIC;
  signal D0p0 : STD_LOGIC;
  signal D0p0_REG : STD_LOGIC;
  signal D0p0_REG_i_2_n_0 : STD_LOGIC;
  signal EOP : STD_LOGIC;
  signal EOP0 : STD_LOGIC;
  signal EOP_REG1 : STD_LOGIC;
  signal EOP_REG10 : STD_LOGIC;
  signal EOP_i_2_n_0 : STD_LOGIC;
  signal EXTEND : STD_LOGIC;
  signal EXTEND_ERR : STD_LOGIC;
  signal EXTEND_ERR0 : STD_LOGIC;
  signal EXTEND_REG1 : STD_LOGIC;
  signal EXTEND_REG2 : STD_LOGIC;
  signal EXTEND_REG3 : STD_LOGIC;
  signal EXTEND_i_1_n_0 : STD_LOGIC;
  signal EXT_ILLEGAL_K : STD_LOGIC;
  signal EXT_ILLEGAL_K0 : STD_LOGIC;
  signal EXT_ILLEGAL_K_REG1 : STD_LOGIC;
  signal EXT_ILLEGAL_K_REG2 : STD_LOGIC;
  signal FALSE_CARRIER : STD_LOGIC;
  signal FALSE_CARRIER0 : STD_LOGIC;
  signal FALSE_CARRIER_REG1 : STD_LOGIC;
  signal FALSE_CARRIER_REG2 : STD_LOGIC;
  signal FALSE_CARRIER_REG3 : STD_LOGIC;
  signal FALSE_CARRIER_i_1_n_0 : STD_LOGIC;
  signal FALSE_CARRIER_i_3_n_0 : STD_LOGIC;
  signal FALSE_DATA : STD_LOGIC;
  signal FALSE_DATA0 : STD_LOGIC;
  signal FALSE_DATA_i_2_n_0 : STD_LOGIC;
  signal FALSE_DATA_i_3_n_0 : STD_LOGIC;
  signal FALSE_K : STD_LOGIC;
  signal FALSE_K0 : STD_LOGIC;
  signal FALSE_K_i_2_n_0 : STD_LOGIC;
  signal FALSE_NIT : STD_LOGIC;
  signal FALSE_NIT0 : STD_LOGIC;
  signal FALSE_NIT_i_2_n_0 : STD_LOGIC;
  signal FALSE_NIT_i_3_n_0 : STD_LOGIC;
  signal FROM_IDLE_D : STD_LOGIC;
  signal FROM_IDLE_D0 : STD_LOGIC;
  signal FROM_RX_CX : STD_LOGIC;
  signal FROM_RX_CX0 : STD_LOGIC;
  signal FROM_RX_K : STD_LOGIC;
  signal FROM_RX_K0 : STD_LOGIC;
  signal I : STD_LOGIC;
  signal I0 : STD_LOGIC;
  signal \IDLE_REG_reg_n_0_[0]\ : STD_LOGIC;
  signal \IDLE_REG_reg_n_0_[2]\ : STD_LOGIC;
  signal ILLEGAL_K : STD_LOGIC;
  signal ILLEGAL_K0 : STD_LOGIC;
  signal ILLEGAL_K_REG1 : STD_LOGIC;
  signal ILLEGAL_K_REG2 : STD_LOGIC;
  signal I_i_2_n_0 : STD_LOGIC;
  signal I_i_3_n_0 : STD_LOGIC;
  signal I_i_4_n_0 : STD_LOGIC;
  signal I_i_5_n_0 : STD_LOGIC;
  signal K23p7 : STD_LOGIC;
  signal \^k28p5_reg1\ : STD_LOGIC;
  signal K28p5_REG1_i_1_n_0 : STD_LOGIC;
  signal K28p5_REG2 : STD_LOGIC;
  signal K29p7 : STD_LOGIC;
  signal R : STD_LOGIC;
  signal \^receive\ : STD_LOGIC;
  signal RECEIVE_i_1_n_0 : STD_LOGIC;
  signal \RUDI_C0__0\ : STD_LOGIC;
  signal RUDI_I0 : STD_LOGIC;
  signal RXCHARISK_REG1 : STD_LOGIC;
  signal RXDATA_REG5 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \RXD[0]_i_1_n_0\ : STD_LOGIC;
  signal \RXD[1]_i_1_n_0\ : STD_LOGIC;
  signal \RXD[2]_i_1_n_0\ : STD_LOGIC;
  signal \RXD[3]_i_1_n_0\ : STD_LOGIC;
  signal \RXD[4]_i_1_n_0\ : STD_LOGIC;
  signal \RXD[5]_i_1_n_0\ : STD_LOGIC;
  signal \RXD[6]_i_1_n_0\ : STD_LOGIC;
  signal \RXD[7]_i_1_n_0\ : STD_LOGIC;
  signal \RX_CONFIG_REG[15]_i_1_n_0\ : STD_LOGIC;
  signal \RX_CONFIG_REG[7]_i_1_n_0\ : STD_LOGIC;
  signal RX_CONFIG_REG_NULL_i_2_n_0 : STD_LOGIC;
  signal RX_CONFIG_REG_NULL_i_3_n_0 : STD_LOGIC;
  signal RX_CONFIG_REG_NULL_i_4_n_0 : STD_LOGIC;
  signal RX_CONFIG_REG_NULL_i_5_n_0 : STD_LOGIC;
  signal \^rx_config_reg_reg[15]_0\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^rx_config_valid\ : STD_LOGIC;
  signal RX_CONFIG_VALID_INT0 : STD_LOGIC;
  signal RX_CONFIG_VALID_INT_i_2_n_0 : STD_LOGIC;
  signal \RX_CONFIG_VALID_REG_reg_n_0_[0]\ : STD_LOGIC;
  signal \RX_CONFIG_VALID_REG_reg_n_0_[3]\ : STD_LOGIC;
  signal RX_DATA_ERROR : STD_LOGIC;
  signal RX_DATA_ERROR0 : STD_LOGIC;
  signal RX_DATA_ERROR_i_2_n_0 : STD_LOGIC;
  signal RX_DATA_ERROR_i_4_n_0 : STD_LOGIC;
  signal RX_DV_i_1_n_0 : STD_LOGIC;
  signal RX_ER0 : STD_LOGIC;
  signal RX_ER_i_3_n_0 : STD_LOGIC;
  signal \^rx_idle\ : STD_LOGIC;
  signal \^rx_invalid\ : STD_LOGIC;
  signal RX_INVALID_i_1_n_0 : STD_LOGIC;
  signal R_REG1 : STD_LOGIC;
  signal R_i_2_n_0 : STD_LOGIC;
  signal S : STD_LOGIC;
  signal S0 : STD_LOGIC;
  signal \^s2\ : STD_LOGIC;
  signal SOP : STD_LOGIC;
  signal SOP0 : STD_LOGIC;
  signal SOP_REG1 : STD_LOGIC;
  signal SOP_REG2 : STD_LOGIC;
  signal \^sop_reg3\ : STD_LOGIC;
  signal SYNC_STATUS_REG : STD_LOGIC;
  signal S_i_2_n_0 : STD_LOGIC;
  signal T : STD_LOGIC;
  signal T_REG1 : STD_LOGIC;
  signal T_REG2 : STD_LOGIC;
  signal WAIT_FOR_K : STD_LOGIC;
  signal WAIT_FOR_K_i_1_n_0 : STD_LOGIC;
  signal \^gmii_rx_dv\ : STD_LOGIC;
  signal p_0_in1_in : STD_LOGIC;
  signal p_0_in2_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \BASEX_REMOTE_FAULT[1]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of CGBAD_i_1 : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of FALSE_NIT_i_1 : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of FROM_RX_K_i_1 : label is "soft_lutpair71";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \RXDATA_REG5_reg[0]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg ";
  attribute srl_name : string;
  attribute srl_name of \RXDATA_REG5_reg[0]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[0]_srl5 ";
  attribute srl_bus_name of \RXDATA_REG5_reg[1]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg ";
  attribute srl_name of \RXDATA_REG5_reg[1]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[1]_srl5 ";
  attribute srl_bus_name of \RXDATA_REG5_reg[2]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg ";
  attribute srl_name of \RXDATA_REG5_reg[2]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[2]_srl5 ";
  attribute srl_bus_name of \RXDATA_REG5_reg[3]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg ";
  attribute srl_name of \RXDATA_REG5_reg[3]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[3]_srl5 ";
  attribute srl_bus_name of \RXDATA_REG5_reg[4]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg ";
  attribute srl_name of \RXDATA_REG5_reg[4]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[4]_srl5 ";
  attribute srl_bus_name of \RXDATA_REG5_reg[5]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg ";
  attribute srl_name of \RXDATA_REG5_reg[5]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[5]_srl5 ";
  attribute srl_bus_name of \RXDATA_REG5_reg[6]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg ";
  attribute srl_name of \RXDATA_REG5_reg[6]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[6]_srl5 ";
  attribute srl_bus_name of \RXDATA_REG5_reg[7]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg ";
  attribute srl_name of \RXDATA_REG5_reg[7]_srl5\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[7]_srl5 ";
  attribute SOFT_HLUTNM of \RXD[0]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \RXD[2]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \RXD[3]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \RXD[4]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \RXD[5]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \RXD[6]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \RXD[7]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of RX_CONFIG_REG_NULL_i_2 : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \RX_CONFIG_REG_REG[15]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of RX_CONFIG_VALID_INT_i_2 : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of RX_DATA_ERROR_i_4 : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of RX_ER_i_3 : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of R_i_2 : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of S_i_2 : label is "soft_lutpair65";
begin
  K28p5_REG1 <= \^k28p5_reg1\;
  RECEIVE <= \^receive\;
  \RX_CONFIG_REG_reg[15]_0\(15 downto 0) <= \^rx_config_reg_reg[15]_0\(15 downto 0);
  RX_CONFIG_VALID <= \^rx_config_valid\;
  RX_IDLE <= \^rx_idle\;
  RX_INVALID <= \^rx_invalid\;
  S2 <= \^s2\;
  SOP_REG3 <= \^sop_reg3\;
  gmii_rx_dv <= \^gmii_rx_dv\;
ABILITY_MATCH_2_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \^rx_config_reg_reg[15]_0\(4),
      I1 => CONFIG_REG_MATCH_reg(1),
      I2 => \^rx_config_reg_reg[15]_0\(5),
      I3 => CONFIG_REG_MATCH_reg(2),
      I4 => CONFIG_REG_MATCH_reg(0),
      I5 => \^rx_config_reg_reg[15]_0\(3),
      O => \RX_CONFIG_REG_reg[4]_0\
    );
\BASEX_REMOTE_FAULT[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^rx_config_reg_reg[15]_0\(15),
      O => BASEX_REMOTE_FAULT_RSLVD(0)
    );
CGBAD_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => CGBAD,
      Q => CGBAD_REG1,
      R => '0'
    );
CGBAD_REG2_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => CGBAD_REG1,
      Q => CGBAD_REG2,
      R => '0'
    );
CGBAD_REG3_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => CGBAD_REG2,
      Q => CGBAD_REG3,
      R => SR(0)
    );
CGBAD_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => RXNOTINTABLE_INT,
      I1 => D,
      I2 => p_0_in,
      O => \^s2\
    );
CGBAD_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \^s2\,
      Q => CGBAD,
      R => SR(0)
    );
CONSISTENCY_MATCH_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF6FF6"
    )
        port map (
      I0 => \^rx_config_reg_reg[15]_0\(13),
      I1 => CONSISTENCY_MATCH_reg(4),
      I2 => \^rx_config_reg_reg[15]_0\(12),
      I3 => CONSISTENCY_MATCH_reg(3),
      I4 => CONSISTENCY_MATCH_reg_0,
      I5 => CONSISTENCY_MATCH_i_6_n_0,
      O => \RX_CONFIG_REG_reg[13]_0\
    );
CONSISTENCY_MATCH_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \^rx_config_reg_reg[15]_0\(4),
      I1 => CONSISTENCY_MATCH_reg(1),
      I2 => \^rx_config_reg_reg[15]_0\(5),
      I3 => CONSISTENCY_MATCH_reg(2),
      I4 => CONSISTENCY_MATCH_reg(0),
      I5 => \^rx_config_reg_reg[15]_0\(3),
      O => CONSISTENCY_MATCH_i_6_n_0
    );
C_HDR_REMOVED_REG_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => C_REG2,
      I1 => \RX_CONFIG_REG_reg[7]_0\(0),
      I2 => \RX_CONFIG_REG_reg[7]_0\(1),
      O => C_HDR_REMOVED
    );
C_HDR_REMOVED_REG_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => C_HDR_REMOVED,
      Q => C_HDR_REMOVED_REG,
      R => '0'
    );
C_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => C,
      Q => C_REG1,
      R => '0'
    );
C_REG2_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => C_REG1,
      Q => C_REG2,
      R => '0'
    );
C_REG3_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => C_REG2,
      Q => C_REG3,
      R => '0'
    );
C_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^k28p5_reg1\,
      I1 => I_i_3_n_0,
      O => C0
    );
C_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => C0,
      Q => C,
      R => '0'
    );
D0p0_REG_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => Q(0),
      I1 => Q(2),
      I2 => RXCHARISK_REG1_reg_0,
      I3 => D0p0_REG_i_2_n_0,
      O => D0p0
    );
D0p0_REG_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Q(3),
      I1 => Q(4),
      I2 => Q(1),
      I3 => Q(6),
      I4 => Q(7),
      I5 => Q(5),
      O => D0p0_REG_i_2_n_0
    );
D0p0_REG_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => D0p0,
      Q => D0p0_REG,
      R => '0'
    );
EOP_REG1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => EOP,
      I1 => EXTEND,
      I2 => EXTEND_REG1,
      O => EOP_REG10
    );
EOP_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => EOP_REG10,
      Q => EOP_REG1,
      R => SR(0)
    );
EOP_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888000"
    )
        port map (
      I0 => T_REG2,
      I1 => R_REG1,
      I2 => RXEVEN0_out,
      I3 => \^k28p5_reg1\,
      I4 => R,
      I5 => EOP_i_2_n_0,
      O => EOP0
    );
EOP_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF808080"
    )
        port map (
      I0 => C_REG1,
      I1 => D0p0_REG,
      I2 => RXEVEN0_out,
      I3 => \^rx_idle\,
      I4 => \^k28p5_reg1\,
      O => EOP_i_2_n_0
    );
EOP_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => EOP0,
      Q => EOP,
      R => SR(0)
    );
EXTEND_ERR_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => EXT_ILLEGAL_K_REG2,
      I1 => EXTEND_REG3,
      I2 => CGBAD_REG3,
      O => EXTEND_ERR0
    );
EXTEND_ERR_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => EXTEND_ERR0,
      Q => EXTEND_ERR,
      R => SYNC_STATUS_REG0
    );
EXTEND_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => EXTEND,
      Q => EXTEND_REG1,
      R => '0'
    );
EXTEND_REG2_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => EXTEND_REG1,
      Q => EXTEND_REG2,
      R => '0'
    );
EXTEND_REG3_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => EXTEND_REG2,
      Q => EXTEND_REG3,
      R => '0'
    );
EXTEND_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"808080FF80808080"
    )
        port map (
      I0 => R_REG1,
      I1 => R,
      I2 => \^receive\,
      I3 => EXTEND_reg_0,
      I4 => S,
      I5 => EXTEND,
      O => EXTEND_i_1_n_0
    );
EXTEND_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => EXTEND_i_1_n_0,
      Q => EXTEND,
      R => SYNC_STATUS_REG0
    );
EXT_ILLEGAL_K_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => EXT_ILLEGAL_K,
      Q => EXT_ILLEGAL_K_REG1,
      R => SYNC_STATUS_REG0
    );
EXT_ILLEGAL_K_REG2_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => EXT_ILLEGAL_K_REG1,
      Q => EXT_ILLEGAL_K_REG2,
      R => SYNC_STATUS_REG0
    );
EXT_ILLEGAL_K_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000700"
    )
        port map (
      I0 => RXEVEN0_out,
      I1 => \^k28p5_reg1\,
      I2 => S,
      I3 => EXTEND_REG1,
      I4 => R,
      O => EXT_ILLEGAL_K0
    );
EXT_ILLEGAL_K_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => EXT_ILLEGAL_K0,
      Q => EXT_ILLEGAL_K,
      R => SYNC_STATUS_REG0
    );
FALSE_CARRIER_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => FALSE_CARRIER,
      Q => FALSE_CARRIER_REG1,
      R => '0'
    );
FALSE_CARRIER_REG2_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => FALSE_CARRIER_REG1,
      Q => FALSE_CARRIER_REG2,
      R => '0'
    );
FALSE_CARRIER_REG3_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => FALSE_CARRIER_REG2,
      Q => FALSE_CARRIER_REG3,
      R => SYNC_STATUS_REG0
    );
FALSE_CARRIER_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F7F0"
    )
        port map (
      I0 => \^k28p5_reg1\,
      I1 => RXEVEN0_out,
      I2 => FALSE_CARRIER0,
      I3 => FALSE_CARRIER,
      O => FALSE_CARRIER_i_1_n_0
    );
FALSE_CARRIER_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => FALSE_CARRIER_i_3_n_0,
      I1 => FALSE_K,
      I2 => FALSE_DATA,
      I3 => FALSE_NIT,
      I4 => \^k28p5_reg1\,
      I5 => S,
      O => FALSE_CARRIER0
    );
FALSE_CARRIER_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80888080"
    )
        port map (
      I0 => \^rx_idle\,
      I1 => RXSYNC_STATUS,
      I2 => XMIT_DATA_INT,
      I3 => RX_RUDI_INVALID_REG_reg(3),
      I4 => RX_RUDI_INVALID_REG_reg(0),
      O => FALSE_CARRIER_i_3_n_0
    );
FALSE_CARRIER_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => FALSE_CARRIER_i_1_n_0,
      Q => FALSE_CARRIER,
      R => SYNC_STATUS_REG0
    );
FALSE_DATA_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000008882220"
    )
        port map (
      I0 => FALSE_DATA_i_2_n_0,
      I1 => Q(1),
      I2 => Q(3),
      I3 => Q(4),
      I4 => Q(0),
      I5 => FALSE_DATA_i_3_n_0,
      O => FALSE_DATA0
    );
FALSE_DATA_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A0000C0"
    )
        port map (
      I0 => Q(2),
      I1 => Q(0),
      I2 => Q(6),
      I3 => Q(5),
      I4 => Q(7),
      O => FALSE_DATA_i_2_n_0
    );
FALSE_DATA_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => RXNOTINTABLE_INT,
      I1 => RXCHARISK_REG1_reg_0,
      I2 => Q(4),
      I3 => Q(3),
      I4 => Q(0),
      I5 => Q(2),
      O => FALSE_DATA_i_3_n_0
    );
FALSE_DATA_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => FALSE_DATA0,
      Q => FALSE_DATA,
      R => SR(0)
    );
FALSE_K_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008200"
    )
        port map (
      I0 => FALSE_K_i_2_n_0,
      I1 => Q(5),
      I2 => Q(6),
      I3 => Q(7),
      I4 => RXNOTINTABLE_INT,
      O => FALSE_K0
    );
FALSE_K_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000400000000000"
    )
        port map (
      I0 => Q(0),
      I1 => Q(2),
      I2 => Q(4),
      I3 => Q(3),
      I4 => Q(1),
      I5 => RXCHARISK_REG1_reg_0,
      O => FALSE_K_i_2_n_0
    );
FALSE_K_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => FALSE_K0,
      Q => FALSE_K,
      R => SR(0)
    );
FALSE_NIT_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RXNOTINTABLE_INT,
      I1 => FALSE_NIT_i_2_n_0,
      O => FALSE_NIT0
    );
FALSE_NIT_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAFAFFCAFFCFCCF"
    )
        port map (
      I0 => D0p0_REG_i_2_n_0,
      I1 => FALSE_NIT_i_3_n_0,
      I2 => RXCHARISK_REG1_reg_0,
      I3 => FALSE_NIT_reg_0,
      I4 => Q(0),
      I5 => Q(2),
      O => FALSE_NIT_i_2_n_0
    );
FALSE_NIT_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => Q(3),
      I1 => Q(5),
      I2 => Q(7),
      I3 => Q(6),
      I4 => Q(4),
      I5 => Q(1),
      O => FALSE_NIT_i_3_n_0
    );
FALSE_NIT_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => FALSE_NIT0,
      Q => FALSE_NIT,
      R => SR(0)
    );
FROM_IDLE_D_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \^k28p5_reg1\,
      I1 => \^rx_idle\,
      I2 => WAIT_FOR_K,
      I3 => RX_INVALID_reg_0,
      O => FROM_IDLE_D0
    );
FROM_IDLE_D_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => FROM_IDLE_D0,
      Q => FROM_IDLE_D,
      R => SYNC_STATUS_REG0
    );
FROM_RX_CX_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8FFFCFCA8A8"
    )
        port map (
      I0 => RXCHARISK_REG1,
      I1 => C_REG1,
      I2 => C_REG2,
      I3 => EXTEND_reg_0,
      I4 => CGBAD,
      I5 => C_REG3,
      O => FROM_RX_CX0
    );
FROM_RX_CX_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => FROM_RX_CX0,
      Q => FROM_RX_CX,
      R => SYNC_STATUS_REG0
    );
FROM_RX_K_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E0"
    )
        port map (
      I0 => RXCHARISK_REG1,
      I1 => CGBAD,
      I2 => K28p5_REG2,
      I3 => RX_INVALID_reg_0,
      O => FROM_RX_K0
    );
FROM_RX_K_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => FROM_RX_K0,
      Q => FROM_RX_K,
      R => SYNC_STATUS_REG0
    );
\IDLE_REG_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \^rx_idle\,
      Q => \IDLE_REG_reg_n_0_[0]\,
      R => SR(0)
    );
\IDLE_REG_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \IDLE_REG_reg_n_0_[0]\,
      Q => p_0_in1_in,
      R => SR(0)
    );
\IDLE_REG_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => p_0_in1_in,
      Q => \IDLE_REG_reg_n_0_[2]\,
      R => SR(0)
    );
ILLEGAL_K_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => ILLEGAL_K,
      Q => ILLEGAL_K_REG1,
      R => SYNC_STATUS_REG0
    );
ILLEGAL_K_REG2_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => ILLEGAL_K_REG1,
      Q => ILLEGAL_K_REG2,
      R => SYNC_STATUS_REG0
    );
ILLEGAL_K_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => R,
      I1 => \^k28p5_reg1\,
      I2 => RXCHARISK_REG1,
      I3 => T,
      O => ILLEGAL_K0
    );
ILLEGAL_K_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => ILLEGAL_K0,
      Q => ILLEGAL_K,
      R => SYNC_STATUS_REG0
    );
I_REG_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => I,
      Q => \^rx_idle\,
      R => '0'
    );
I_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000E0EC"
    )
        port map (
      I0 => \^rx_idle\,
      I1 => \^k28p5_reg1\,
      I2 => RX_INVALID_reg_0,
      I3 => RXCHARISK_REG1_reg_0,
      I4 => I_i_2_n_0,
      I5 => I_i_3_n_0,
      O => I0
    );
I_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001FFFF"
    )
        port map (
      I0 => \^k28p5_reg1\,
      I1 => FALSE_NIT,
      I2 => FALSE_DATA,
      I3 => FALSE_K,
      I4 => RXEVEN0_out,
      O => I_i_2_n_0
    );
I_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00043004"
    )
        port map (
      I0 => I_i_4_n_0,
      I1 => Q(6),
      I2 => Q(5),
      I3 => Q(7),
      I4 => I_i_5_n_0,
      O => I_i_3_n_0
    );
I_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => Q(4),
      I1 => Q(3),
      I2 => Q(1),
      I3 => Q(0),
      I4 => Q(2),
      I5 => RXCHARISK_REG1_reg_0,
      O => I_i_4_n_0
    );
I_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFF7FFFF"
    )
        port map (
      I0 => Q(0),
      I1 => Q(2),
      I2 => Q(3),
      I3 => Q(1),
      I4 => Q(4),
      I5 => RXCHARISK_REG1_reg_0,
      O => I_i_5_n_0
    );
I_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => I0,
      Q => I,
      R => '0'
    );
K28p5_REG1_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => FALSE_K_i_2_n_0,
      I1 => Q(7),
      I2 => Q(5),
      I3 => Q(6),
      O => K28p5_REG1_i_1_n_0
    );
K28p5_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => K28p5_REG1_i_1_n_0,
      Q => \^k28p5_reg1\,
      R => '0'
    );
K28p5_REG2_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \^k28p5_reg1\,
      Q => K28p5_REG2,
      R => '0'
    );
RECEIVED_IDLE_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^rx_idle\,
      I1 => \^rx_config_valid\,
      I2 => RECEIVED_IDLE,
      O => I_REG_reg_0
    );
RECEIVE_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DC"
    )
        port map (
      I0 => EOP,
      I1 => SOP_REG2,
      I2 => \^receive\,
      O => RECEIVE_i_1_n_0
    );
RECEIVE_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => RECEIVE_i_1_n_0,
      Q => \^receive\,
      R => SYNC_STATUS_REG0
    );
RUDI_C0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => \RX_CONFIG_VALID_REG_reg_n_0_[3]\,
      I2 => p_1_in,
      I3 => \RX_CONFIG_VALID_REG_reg_n_0_[0]\,
      O => \RUDI_C0__0\
    );
RUDI_C_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \RUDI_C0__0\,
      Q => status_vector(0),
      R => SR(0)
    );
RUDI_I_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \IDLE_REG_reg_n_0_[2]\,
      I1 => p_0_in1_in,
      O => RUDI_I0
    );
RUDI_I_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => RUDI_I0,
      Q => status_vector(1),
      R => SR(0)
    );
RXCHARISK_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => RXCHARISK_REG1_reg_0,
      Q => RXCHARISK_REG1,
      R => '0'
    );
\RXDATA_REG5_reg[0]_srl5\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '0',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => userclk2,
      D => Q(0),
      Q => RXDATA_REG5(0)
    );
\RXDATA_REG5_reg[1]_srl5\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '0',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => userclk2,
      D => Q(1),
      Q => RXDATA_REG5(1)
    );
\RXDATA_REG5_reg[2]_srl5\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '0',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => userclk2,
      D => Q(2),
      Q => RXDATA_REG5(2)
    );
\RXDATA_REG5_reg[3]_srl5\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '0',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => userclk2,
      D => Q(3),
      Q => RXDATA_REG5(3)
    );
\RXDATA_REG5_reg[4]_srl5\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '0',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => userclk2,
      D => Q(4),
      Q => RXDATA_REG5(4)
    );
\RXDATA_REG5_reg[5]_srl5\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '0',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => userclk2,
      D => Q(5),
      Q => RXDATA_REG5(5)
    );
\RXDATA_REG5_reg[6]_srl5\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '0',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => userclk2,
      D => Q(6),
      Q => RXDATA_REG5(6)
    );
\RXDATA_REG5_reg[7]_srl5\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '0',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => userclk2,
      D => Q(7),
      Q => RXDATA_REG5(7)
    );
\RXD[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBBA"
    )
        port map (
      I0 => \^sop_reg3\,
      I1 => FALSE_CARRIER_REG3,
      I2 => EXTEND_REG1,
      I3 => RXDATA_REG5(0),
      O => \RXD[0]_i_1_n_0\
    );
\RXD[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5554"
    )
        port map (
      I0 => \^sop_reg3\,
      I1 => RXDATA_REG5(1),
      I2 => FALSE_CARRIER_REG3,
      I3 => EXTEND_REG1,
      O => \RXD[1]_i_1_n_0\
    );
\RXD[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => RXDATA_REG5(2),
      I1 => FALSE_CARRIER_REG3,
      I2 => EXTEND_REG1,
      I3 => \^sop_reg3\,
      O => \RXD[2]_i_1_n_0\
    );
\RXD[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5554"
    )
        port map (
      I0 => \^sop_reg3\,
      I1 => RXDATA_REG5(3),
      I2 => FALSE_CARRIER_REG3,
      I3 => EXTEND_REG1,
      O => \RXD[3]_i_1_n_0\
    );
\RXD[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABBBAAA"
    )
        port map (
      I0 => \^sop_reg3\,
      I1 => FALSE_CARRIER_REG3,
      I2 => EXTEND_ERR,
      I3 => EXTEND_REG1,
      I4 => RXDATA_REG5(4),
      O => \RXD[4]_i_1_n_0\
    );
\RXD[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => RXDATA_REG5(5),
      I1 => FALSE_CARRIER_REG3,
      I2 => EXTEND_REG1,
      I3 => \^sop_reg3\,
      O => \RXD[5]_i_1_n_0\
    );
\RXD[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABAA"
    )
        port map (
      I0 => \^sop_reg3\,
      I1 => FALSE_CARRIER_REG3,
      I2 => EXTEND_REG1,
      I3 => RXDATA_REG5(6),
      O => \RXD[6]_i_1_n_0\
    );
\RXD[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => RXDATA_REG5(7),
      I1 => FALSE_CARRIER_REG3,
      I2 => EXTEND_REG1,
      I3 => \^sop_reg3\,
      O => \RXD[7]_i_1_n_0\
    );
\RXD_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \RXD[0]_i_1_n_0\,
      Q => gmii_rxd(0),
      R => RX_RUDI_INVALID_REG_reg(2)
    );
\RXD_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \RXD[1]_i_1_n_0\,
      Q => gmii_rxd(1),
      R => RX_RUDI_INVALID_REG_reg(2)
    );
\RXD_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \RXD[2]_i_1_n_0\,
      Q => gmii_rxd(2),
      R => RX_RUDI_INVALID_REG_reg(2)
    );
\RXD_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \RXD[3]_i_1_n_0\,
      Q => gmii_rxd(3),
      R => RX_RUDI_INVALID_REG_reg(2)
    );
\RXD_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \RXD[4]_i_1_n_0\,
      Q => gmii_rxd(4),
      R => RX_RUDI_INVALID_REG_reg(2)
    );
\RXD_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \RXD[5]_i_1_n_0\,
      Q => gmii_rxd(5),
      R => RX_RUDI_INVALID_REG_reg(2)
    );
\RXD_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \RXD[6]_i_1_n_0\,
      Q => gmii_rxd(6),
      R => RX_RUDI_INVALID_REG_reg(2)
    );
\RXD_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \RXD[7]_i_1_n_0\,
      Q => gmii_rxd(7),
      R => RX_RUDI_INVALID_REG_reg(2)
    );
\RX_CONFIG_REG[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"000E"
    )
        port map (
      I0 => C_REG1,
      I1 => C_HDR_REMOVED_REG,
      I2 => RXCHARISK_REG1_reg_0,
      I3 => RXCHARISK_REG1,
      O => \RX_CONFIG_REG[15]_i_1_n_0\
    );
\RX_CONFIG_REG[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55550040"
    )
        port map (
      I0 => RXCHARISK_REG1_reg_0,
      I1 => C_REG2,
      I2 => \RX_CONFIG_REG_reg[7]_0\(0),
      I3 => \RX_CONFIG_REG_reg[7]_0\(1),
      I4 => C,
      O => \RX_CONFIG_REG[7]_i_1_n_0\
    );
RX_CONFIG_REG_NULL_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004FFFF00040000"
    )
        port map (
      I0 => RX_CONFIG_REG_NULL_i_2_n_0,
      I1 => RX_CONFIG_REG_NULL_i_3_n_0,
      I2 => RX_CONFIG_REG_NULL_i_4_n_0,
      I3 => RX_CONFIG_REG_NULL_i_5_n_0,
      I4 => \^rx_config_valid\,
      I5 => RX_CONFIG_REG_NULL_reg,
      O => RX_CONFIG_VALID_INT_reg_0
    );
RX_CONFIG_REG_NULL_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^rx_config_reg_reg[15]_0\(10),
      I1 => \^rx_config_reg_reg[15]_0\(15),
      I2 => \^rx_config_reg_reg[15]_0\(4),
      I3 => \^rx_config_reg_reg[15]_0\(2),
      O => RX_CONFIG_REG_NULL_i_2_n_0
    );
RX_CONFIG_REG_NULL_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^rx_config_reg_reg[15]_0\(13),
      I1 => \^rx_config_reg_reg[15]_0\(6),
      I2 => \^rx_config_reg_reg[15]_0\(7),
      I3 => \^rx_config_reg_reg[15]_0\(5),
      O => RX_CONFIG_REG_NULL_i_3_n_0
    );
RX_CONFIG_REG_NULL_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^rx_config_reg_reg[15]_0\(3),
      I1 => \^rx_config_reg_reg[15]_0\(14),
      I2 => \^rx_config_reg_reg[15]_0\(11),
      I3 => \^rx_config_reg_reg[15]_0\(0),
      O => RX_CONFIG_REG_NULL_i_4_n_0
    );
RX_CONFIG_REG_NULL_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^rx_config_reg_reg[15]_0\(12),
      I1 => \^rx_config_reg_reg[15]_0\(8),
      I2 => \^rx_config_reg_reg[15]_0\(9),
      I3 => \^rx_config_reg_reg[15]_0\(1),
      O => RX_CONFIG_REG_NULL_i_5_n_0
    );
\RX_CONFIG_REG_REG[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \out\,
      I1 => \^rx_idle\,
      O => \MGT_RESET.SRESET_reg\(0)
    );
\RX_CONFIG_REG_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[7]_i_1_n_0\,
      D => Q(0),
      Q => \^rx_config_reg_reg[15]_0\(0),
      R => '0'
    );
\RX_CONFIG_REG_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[15]_i_1_n_0\,
      D => Q(2),
      Q => \^rx_config_reg_reg[15]_0\(10),
      R => '0'
    );
\RX_CONFIG_REG_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[15]_i_1_n_0\,
      D => Q(3),
      Q => \^rx_config_reg_reg[15]_0\(11),
      R => '0'
    );
\RX_CONFIG_REG_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[15]_i_1_n_0\,
      D => Q(4),
      Q => \^rx_config_reg_reg[15]_0\(12),
      R => '0'
    );
\RX_CONFIG_REG_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[15]_i_1_n_0\,
      D => Q(5),
      Q => \^rx_config_reg_reg[15]_0\(13),
      R => '0'
    );
\RX_CONFIG_REG_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[15]_i_1_n_0\,
      D => Q(6),
      Q => \^rx_config_reg_reg[15]_0\(14),
      R => '0'
    );
\RX_CONFIG_REG_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[15]_i_1_n_0\,
      D => Q(7),
      Q => \^rx_config_reg_reg[15]_0\(15),
      R => '0'
    );
\RX_CONFIG_REG_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[7]_i_1_n_0\,
      D => Q(1),
      Q => \^rx_config_reg_reg[15]_0\(1),
      R => '0'
    );
\RX_CONFIG_REG_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[7]_i_1_n_0\,
      D => Q(2),
      Q => \^rx_config_reg_reg[15]_0\(2),
      R => '0'
    );
\RX_CONFIG_REG_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[7]_i_1_n_0\,
      D => Q(3),
      Q => \^rx_config_reg_reg[15]_0\(3),
      R => '0'
    );
\RX_CONFIG_REG_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[7]_i_1_n_0\,
      D => Q(4),
      Q => \^rx_config_reg_reg[15]_0\(4),
      R => '0'
    );
\RX_CONFIG_REG_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[7]_i_1_n_0\,
      D => Q(5),
      Q => \^rx_config_reg_reg[15]_0\(5),
      R => '0'
    );
\RX_CONFIG_REG_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[7]_i_1_n_0\,
      D => Q(6),
      Q => \^rx_config_reg_reg[15]_0\(6),
      R => '0'
    );
\RX_CONFIG_REG_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[7]_i_1_n_0\,
      D => Q(7),
      Q => \^rx_config_reg_reg[15]_0\(7),
      R => '0'
    );
\RX_CONFIG_REG_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[15]_i_1_n_0\,
      D => Q(0),
      Q => \^rx_config_reg_reg[15]_0\(8),
      R => '0'
    );
\RX_CONFIG_REG_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \RX_CONFIG_REG[15]_i_1_n_0\,
      D => Q(1),
      Q => \^rx_config_reg_reg[15]_0\(9),
      R => '0'
    );
RX_CONFIG_VALID_INT_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000E000000"
    )
        port map (
      I0 => C_REG1,
      I1 => C_HDR_REMOVED_REG,
      I2 => RXCHARISK_REG1_reg_0,
      I3 => RXSYNC_STATUS,
      I4 => RX_CONFIG_VALID_INT_i_2_n_0,
      I5 => \^s2\,
      O => RX_CONFIG_VALID_INT0
    );
RX_CONFIG_VALID_INT_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => RXCHARISK_REG1,
      I1 => CGBAD,
      O => RX_CONFIG_VALID_INT_i_2_n_0
    );
RX_CONFIG_VALID_INT_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => RX_CONFIG_VALID_INT0,
      Q => \^rx_config_valid\,
      R => SR(0)
    );
\RX_CONFIG_VALID_REG_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \^rx_config_valid\,
      Q => \RX_CONFIG_VALID_REG_reg_n_0_[0]\,
      R => SR(0)
    );
\RX_CONFIG_VALID_REG_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \RX_CONFIG_VALID_REG_reg_n_0_[0]\,
      Q => p_0_in2_in,
      R => SR(0)
    );
\RX_CONFIG_VALID_REG_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => p_0_in2_in,
      Q => p_1_in,
      R => SR(0)
    );
\RX_CONFIG_VALID_REG_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => p_1_in,
      Q => \RX_CONFIG_VALID_REG_reg_n_0_[3]\,
      R => SR(0)
    );
RX_DATA_ERROR_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888AAAAA88888888"
    )
        port map (
      I0 => \^receive\,
      I1 => RX_DATA_ERROR_i_2_n_0,
      I2 => R,
      I3 => EXTEND_reg_0,
      I4 => R_REG1,
      I5 => T_REG2,
      O => RX_DATA_ERROR0
    );
RX_DATA_ERROR_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4544"
    )
        port map (
      I0 => R_REG1,
      I1 => \^k28p5_reg1\,
      I2 => T_REG1,
      I3 => R,
      I4 => RX_DATA_ERROR_i_4_n_0,
      O => RX_DATA_ERROR_i_2_n_0
    );
RX_DATA_ERROR_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => CGBAD_REG3,
      I1 => \^rx_idle\,
      I2 => ILLEGAL_K_REG2,
      I3 => C_REG1,
      O => RX_DATA_ERROR_i_4_n_0
    );
RX_DATA_ERROR_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => RX_DATA_ERROR0,
      Q => RX_DATA_ERROR,
      R => SYNC_STATUS_REG0
    );
RX_DV_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAEEEAAAAAAAAA"
    )
        port map (
      I0 => RX_DV0,
      I1 => XMIT_DATA,
      I2 => \^receive\,
      I3 => RXSYNC_STATUS,
      I4 => EOP_REG1,
      I5 => \^gmii_rx_dv\,
      O => RX_DV_i_1_n_0
    );
RX_DV_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RX_DV_i_1_n_0,
      Q => \^gmii_rx_dv\,
      R => SR(0)
    );
RX_ER_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000AA2A"
    )
        port map (
      I0 => RX_ER_reg_0,
      I1 => RX_ER_i_3_n_0,
      I2 => RXSYNC_STATUS,
      I3 => RX_DATA_ERROR,
      I4 => RX_RUDI_INVALID_REG_reg(2),
      I5 => RX_RUDI_INVALID_REG_reg(1),
      O => RX_ER0
    );
RX_ER_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => FALSE_CARRIER_REG3,
      I1 => EXTEND_REG1,
      O => RX_ER_i_3_n_0
    );
RX_ER_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RX_ER0,
      Q => gmii_rx_er,
      R => SR(0)
    );
RX_INVALID_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF55FDFFFF00FC"
    )
        port map (
      I0 => \^k28p5_reg1\,
      I1 => FROM_RX_K,
      I2 => FROM_IDLE_D,
      I3 => RX_INVALID_reg_0,
      I4 => FROM_RX_CX,
      I5 => \^rx_invalid\,
      O => RX_INVALID_i_1_n_0
    );
RX_INVALID_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => RX_INVALID_i_1_n_0,
      Q => \^rx_invalid\,
      R => SYNC_STATUS_REG0
    );
RX_RUDI_INVALID_REG_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAABABB"
    )
        port map (
      I0 => \^rx_invalid\,
      I1 => XMIT_DATA_INT,
      I2 => RX_RUDI_INVALID_REG_reg(3),
      I3 => RX_RUDI_INVALID_REG_reg(0),
      I4 => RXSYNC_STATUS,
      O => RX_RUDI_INVALID
    );
R_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => R,
      Q => R_REG1,
      R => '0'
    );
R_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => R_i_2_n_0,
      I1 => RXCHARISK_REG1_reg_0,
      I2 => Q(1),
      I3 => Q(0),
      I4 => Q(2),
      I5 => Q(3),
      O => K23p7
    );
R_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => Q(5),
      I1 => Q(7),
      I2 => Q(6),
      I3 => Q(4),
      O => R_i_2_n_0
    );
R_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => K23p7,
      Q => R,
      R => '0'
    );
SOP_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => SOP,
      Q => SOP_REG1,
      R => '0'
    );
SOP_REG2_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => SOP_REG1,
      Q => SOP_REG2,
      R => '0'
    );
SOP_REG3_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => SOP_REG2,
      Q => \^sop_reg3\,
      R => '0'
    );
SOP_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202000"
    )
        port map (
      I0 => RX_INVALID_reg_0,
      I1 => WAIT_FOR_K,
      I2 => S,
      I3 => \^rx_idle\,
      I4 => EXTEND,
      O => SOP0
    );
SOP_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => SOP0,
      Q => SOP,
      R => SR(0)
    );
SYNC_STATUS_REG_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => '1',
      Q => SYNC_STATUS_REG,
      R => SYNC_STATUS_REG0
    );
S_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => Q(1),
      I1 => RXCHARISK_REG1_reg_0,
      I2 => Q(0),
      I3 => Q(2),
      I4 => \^s2\,
      I5 => S_i_2_n_0,
      O => S0
    );
S_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => Q(4),
      I1 => Q(6),
      I2 => Q(7),
      I3 => Q(5),
      I4 => Q(3),
      O => S_i_2_n_0
    );
S_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => S0,
      Q => S,
      R => '0'
    );
T_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => T,
      Q => T_REG1,
      R => '0'
    );
T_REG2_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => T_REG1,
      Q => T_REG2,
      R => '0'
    );
\T_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => Q(1),
      I1 => RXCHARISK_REG1_reg_0,
      I2 => Q(0),
      I3 => Q(2),
      I4 => S_i_2_n_0,
      O => K29p7
    );
T_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => K29p7,
      Q => T,
      R => '0'
    );
WAIT_FOR_K_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F0F"
    )
        port map (
      I0 => \^k28p5_reg1\,
      I1 => RXEVEN0_out,
      I2 => SYNC_STATUS_REG,
      I3 => WAIT_FOR_K,
      O => WAIT_FOR_K_i_1_n_0
    );
WAIT_FOR_K_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => WAIT_FOR_K_i_1_n_0,
      Q => WAIT_FOR_K,
      R => SYNC_STATUS_REG0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_SYNCHRONISE is
  port (
    RXEVEN0_out : out STD_LOGIC;
    RXSYNC_STATUS : out STD_LOGIC;
    SYNC_STATUS_REG0 : out STD_LOGIC;
    EVEN_reg_0 : out STD_LOGIC;
    \MGT_RESET.SRESET_reg\ : out STD_LOGIC;
    SIGNAL_DETECT_MOD : in STD_LOGIC;
    userclk2 : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    EVEN_reg_1 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    K28p5_REG1 : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    \FSM_onehot_STATE_reg[2]_0\ : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    D : in STD_LOGIC;
    RXNOTINTABLE_INT : in STD_LOGIC;
    S2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_SYNCHRONISE : entity is "SYNCHRONISE";
end gig_ethernet_pcs_pma_0_SYNCHRONISE;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_SYNCHRONISE is
  signal EVEN_i_1_n_0 : STD_LOGIC;
  signal \FSM_onehot_STATE[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[10]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[11]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[12]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[12]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[12]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[12]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[6]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[7]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[8]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE[9]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_STATE_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_STATE_reg_n_0_[10]\ : STD_LOGIC;
  signal \FSM_onehot_STATE_reg_n_0_[11]\ : STD_LOGIC;
  signal \FSM_onehot_STATE_reg_n_0_[12]\ : STD_LOGIC;
  signal \FSM_onehot_STATE_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_STATE_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_STATE_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_STATE_reg_n_0_[5]\ : STD_LOGIC;
  signal \FSM_onehot_STATE_reg_n_0_[6]\ : STD_LOGIC;
  signal \FSM_onehot_STATE_reg_n_0_[8]\ : STD_LOGIC;
  signal \FSM_onehot_STATE_reg_n_0_[9]\ : STD_LOGIC;
  signal GOOD_CGS : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \GOOD_CGS[0]_i_1_n_0\ : STD_LOGIC;
  signal \GOOD_CGS[1]_i_1_n_0\ : STD_LOGIC;
  signal \GOOD_CGS[1]_i_2_n_0\ : STD_LOGIC;
  signal \GOOD_CGS[1]_i_3_n_0\ : STD_LOGIC;
  signal \^rxeven0_out\ : STD_LOGIC;
  signal \^rxsync_status\ : STD_LOGIC;
  signal SIGNAL_DETECT_REG : STD_LOGIC;
  signal SYNC_STATUS_i_1_n_0 : STD_LOGIC;
  signal SYNC_STATUS_i_2_n_0 : STD_LOGIC;
  signal p_0_in_0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of EVEN_i_1 : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \FSM_onehot_STATE[12]_i_4\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \FSM_onehot_STATE[5]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \FSM_onehot_STATE[7]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \FSM_onehot_STATE[8]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \FSM_onehot_STATE[9]_i_1\ : label is "soft_lutpair73";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[0]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[10]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[11]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[12]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[1]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[2]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[3]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[4]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[5]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[6]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[7]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[8]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_STATE_reg[9]\ : label is "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000";
  attribute SOFT_HLUTNM of \GOOD_CGS[0]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \GOOD_CGS[1]_i_3\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of SYNC_STATUS_REG_i_1 : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of SYNC_STATUS_i_2 : label is "soft_lutpair74";
begin
  RXEVEN0_out <= \^rxeven0_out\;
  RXSYNC_STATUS <= \^rxsync_status\;
EVEN_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => \^rxsync_status\,
      I1 => EVEN_reg_1,
      I2 => \^rxeven0_out\,
      O => EVEN_i_1_n_0
    );
EVEN_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => EVEN_i_1_n_0,
      Q => \^rxeven0_out\,
      R => SR(0)
    );
\FSM_onehot_STATE[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \FSM_onehot_STATE_reg_n_0_[4]\,
      I1 => \^rxeven0_out\,
      I2 => p_0_in,
      I3 => D,
      I4 => RXNOTINTABLE_INT,
      I5 => EVEN_reg_1,
      O => \FSM_onehot_STATE[0]_i_1_n_0\
    );
\FSM_onehot_STATE[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => EVEN_reg_1,
      I1 => \FSM_onehot_STATE_reg_n_0_[2]\,
      O => \FSM_onehot_STATE[10]_i_1_n_0\
    );
\FSM_onehot_STATE[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54554444"
    )
        port map (
      I0 => \FSM_onehot_STATE[12]_i_3_n_0\,
      I1 => \FSM_onehot_STATE_reg_n_0_[9]\,
      I2 => GOOD_CGS(0),
      I3 => GOOD_CGS(1),
      I4 => \FSM_onehot_STATE_reg_n_0_[11]\,
      O => \FSM_onehot_STATE[11]_i_1_n_0\
    );
\FSM_onehot_STATE[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => SR(0),
      I1 => SIGNAL_DETECT_REG,
      I2 => Q(0),
      O => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0F0F040F040F04"
    )
        port map (
      I0 => \FSM_onehot_STATE_reg[2]_0\,
      I1 => p_0_in_0,
      I2 => \FSM_onehot_STATE[12]_i_3_n_0\,
      I3 => \FSM_onehot_STATE_reg_n_0_[12]\,
      I4 => \FSM_onehot_STATE[12]_i_4_n_0\,
      I5 => \FSM_onehot_STATE_reg_n_0_[11]\,
      O => \FSM_onehot_STATE[12]_i_2_n_0\
    );
\FSM_onehot_STATE[12]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFC"
    )
        port map (
      I0 => EVEN_reg_1,
      I1 => RXNOTINTABLE_INT,
      I2 => D,
      I3 => p_0_in,
      I4 => \^rxeven0_out\,
      O => \FSM_onehot_STATE[12]_i_3_n_0\
    );
\FSM_onehot_STATE[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => GOOD_CGS(1),
      I1 => GOOD_CGS(0),
      O => \FSM_onehot_STATE[12]_i_4_n_0\
    );
\FSM_onehot_STATE[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000300BB000000AA"
    )
        port map (
      I0 => \FSM_onehot_STATE_reg_n_0_[1]\,
      I1 => \FSM_onehot_STATE_reg[2]_0\,
      I2 => \^rxeven0_out\,
      I3 => S2,
      I4 => EVEN_reg_1,
      I5 => \FSM_onehot_STATE_reg_n_0_[0]\,
      O => \FSM_onehot_STATE[1]_i_1_n_0\
    );
\FSM_onehot_STATE[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFEFE00"
    )
        port map (
      I0 => \FSM_onehot_STATE_reg_n_0_[10]\,
      I1 => \FSM_onehot_STATE_reg_n_0_[0]\,
      I2 => p_0_in_0,
      I3 => \FSM_onehot_STATE_reg[2]_0\,
      I4 => \FSM_onehot_STATE[12]_i_3_n_0\,
      I5 => \FSM_onehot_STATE[2]_i_2_n_0\,
      O => \FSM_onehot_STATE[2]_i_1_n_0\
    );
\FSM_onehot_STATE[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF4F44444444"
    )
        port map (
      I0 => EVEN_reg_1,
      I1 => \FSM_onehot_STATE_reg_n_0_[2]\,
      I2 => SYNC_STATUS_i_2_n_0,
      I3 => \FSM_onehot_STATE_reg_n_0_[1]\,
      I4 => \FSM_onehot_STATE_reg_n_0_[4]\,
      I5 => \FSM_onehot_STATE[12]_i_3_n_0\,
      O => \FSM_onehot_STATE[2]_i_2_n_0\
    );
\FSM_onehot_STATE[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \FSM_onehot_STATE_reg_n_0_[1]\,
      I1 => \^rxeven0_out\,
      I2 => p_0_in,
      I3 => D,
      I4 => RXNOTINTABLE_INT,
      I5 => EVEN_reg_1,
      O => \FSM_onehot_STATE[3]_i_1_n_0\
    );
\FSM_onehot_STATE[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000010FF00001050"
    )
        port map (
      I0 => \FSM_onehot_STATE_reg[2]_0\,
      I1 => \^rxeven0_out\,
      I2 => \FSM_onehot_STATE_reg_n_0_[10]\,
      I3 => EVEN_reg_1,
      I4 => S2,
      I5 => \FSM_onehot_STATE_reg_n_0_[4]\,
      O => \FSM_onehot_STATE[4]_i_1_n_0\
    );
\FSM_onehot_STATE[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54554444"
    )
        port map (
      I0 => \FSM_onehot_STATE[12]_i_3_n_0\,
      I1 => p_1_in,
      I2 => GOOD_CGS(0),
      I3 => GOOD_CGS(1),
      I4 => \FSM_onehot_STATE_reg_n_0_[5]\,
      O => \FSM_onehot_STATE[5]_i_1_n_0\
    );
\FSM_onehot_STATE[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF0040404040"
    )
        port map (
      I0 => GOOD_CGS(0),
      I1 => GOOD_CGS(1),
      I2 => \FSM_onehot_STATE_reg_n_0_[5]\,
      I3 => \FSM_onehot_STATE_reg_n_0_[9]\,
      I4 => \FSM_onehot_STATE_reg_n_0_[11]\,
      I5 => \FSM_onehot_STATE[12]_i_3_n_0\,
      O => \FSM_onehot_STATE[6]_i_1_n_0\
    );
\FSM_onehot_STATE[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \FSM_onehot_STATE[12]_i_3_n_0\,
      I1 => \FSM_onehot_STATE_reg_n_0_[8]\,
      I2 => \FSM_onehot_STATE_reg_n_0_[6]\,
      O => \FSM_onehot_STATE[7]_i_1_n_0\
    );
\FSM_onehot_STATE[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54554444"
    )
        port map (
      I0 => \FSM_onehot_STATE[12]_i_3_n_0\,
      I1 => \FSM_onehot_STATE_reg_n_0_[6]\,
      I2 => GOOD_CGS(0),
      I3 => GOOD_CGS(1),
      I4 => \FSM_onehot_STATE_reg_n_0_[8]\,
      O => \FSM_onehot_STATE[8]_i_1_n_0\
    );
\FSM_onehot_STATE[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8B888888"
    )
        port map (
      I0 => \FSM_onehot_STATE_reg_n_0_[12]\,
      I1 => \FSM_onehot_STATE[12]_i_3_n_0\,
      I2 => GOOD_CGS(0),
      I3 => GOOD_CGS(1),
      I4 => \FSM_onehot_STATE_reg_n_0_[8]\,
      O => \FSM_onehot_STATE[9]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[0]_i_1_n_0\,
      Q => \FSM_onehot_STATE_reg_n_0_[0]\,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[10]_i_1_n_0\,
      Q => \FSM_onehot_STATE_reg_n_0_[10]\,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[11]_i_1_n_0\,
      Q => \FSM_onehot_STATE_reg_n_0_[11]\,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[12]_i_2_n_0\,
      Q => \FSM_onehot_STATE_reg_n_0_[12]\,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[1]_i_1_n_0\,
      Q => \FSM_onehot_STATE_reg_n_0_[1]\,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[2]_i_1_n_0\,
      Q => \FSM_onehot_STATE_reg_n_0_[2]\,
      S => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[3]_i_1_n_0\,
      Q => p_0_in_0,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[4]_i_1_n_0\,
      Q => \FSM_onehot_STATE_reg_n_0_[4]\,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[5]_i_1_n_0\,
      Q => \FSM_onehot_STATE_reg_n_0_[5]\,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[6]_i_1_n_0\,
      Q => \FSM_onehot_STATE_reg_n_0_[6]\,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[7]_i_1_n_0\,
      Q => p_1_in,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[8]_i_1_n_0\,
      Q => \FSM_onehot_STATE_reg_n_0_[8]\,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\FSM_onehot_STATE_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_STATE[9]_i_1_n_0\,
      Q => \FSM_onehot_STATE_reg_n_0_[9]\,
      R => \FSM_onehot_STATE[12]_i_1_n_0\
    );
\GOOD_CGS[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => GOOD_CGS(0),
      O => \GOOD_CGS[0]_i_1_n_0\
    );
\GOOD_CGS[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_onehot_STATE_reg_n_0_[6]\,
      I1 => SR(0),
      I2 => \FSM_onehot_STATE_reg_n_0_[9]\,
      I3 => p_1_in,
      O => \GOOD_CGS[1]_i_1_n_0\
    );
\GOOD_CGS[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010003"
    )
        port map (
      I0 => \^rxeven0_out\,
      I1 => p_0_in,
      I2 => D,
      I3 => RXNOTINTABLE_INT,
      I4 => EVEN_reg_1,
      O => \GOOD_CGS[1]_i_2_n_0\
    );
\GOOD_CGS[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => GOOD_CGS(1),
      I1 => GOOD_CGS(0),
      O => \GOOD_CGS[1]_i_3_n_0\
    );
\GOOD_CGS_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \GOOD_CGS[1]_i_2_n_0\,
      D => \GOOD_CGS[0]_i_1_n_0\,
      Q => GOOD_CGS(0),
      R => \GOOD_CGS[1]_i_1_n_0\
    );
\GOOD_CGS_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => \GOOD_CGS[1]_i_2_n_0\,
      D => \GOOD_CGS[1]_i_3_n_0\,
      Q => GOOD_CGS(1),
      R => \GOOD_CGS[1]_i_1_n_0\
    );
RX_DATA_ERROR_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^rxeven0_out\,
      I1 => K28p5_REG1,
      O => EVEN_reg_0
    );
RX_RUDI_INVALID_REG_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \out\,
      I1 => \^rxsync_status\,
      O => \MGT_RESET.SRESET_reg\
    );
SIGNAL_DETECT_REG_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => SIGNAL_DETECT_MOD,
      Q => SIGNAL_DETECT_REG,
      R => '0'
    );
SYNC_STATUS_REG_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => SR(0),
      I1 => \^rxsync_status\,
      O => SYNC_STATUS_REG0
    );
SYNC_STATUS_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"404050FF40405050"
    )
        port map (
      I0 => \FSM_onehot_STATE_reg_n_0_[2]\,
      I1 => SYNC_STATUS_i_2_n_0,
      I2 => \^rxsync_status\,
      I3 => \FSM_onehot_STATE_reg[2]_0\,
      I4 => \FSM_onehot_STATE[12]_i_3_n_0\,
      I5 => p_0_in_0,
      O => SYNC_STATUS_i_1_n_0
    );
SYNC_STATUS_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_1_in,
      I1 => \FSM_onehot_STATE_reg_n_0_[5]\,
      O => SYNC_STATUS_i_2_n_0
    );
SYNC_STATUS_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => SYNC_STATUS_i_1_n_0,
      Q => \^rxsync_status\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_TX is
  port (
    \USE_ROCKET_IO.MGT_TX_RESET_INT_reg\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \CODE_GRP_CNT_reg[0]_0\ : out STD_LOGIC;
    \CODE_GRP_CNT_reg[0]_1\ : out STD_LOGIC;
    \NO_QSGMII_DATA.TXCHARISK_reg_0\ : out STD_LOGIC;
    \NO_QSGMII_DATA.TXCHARISK_reg_1\ : out STD_LOGIC;
    \NO_QSGMII_DATA.TXDATA_reg[2]_0\ : out STD_LOGIC;
    \NO_QSGMII_DATA.TXDATA_reg[3]_0\ : out STD_LOGIC;
    \NO_QSGMII_DATA.TXDATA_reg[5]_0\ : out STD_LOGIC;
    \NO_QSGMII_DATA.TXDATA_reg[7]_0\ : out STD_LOGIC;
    \NO_QSGMII_CHAR.TXCHARDISPVAL_reg_0\ : out STD_LOGIC;
    \NO_QSGMII_DATA.TXDATA_reg[7]_1\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    XMIT_CONFIG : in STD_LOGIC;
    userclk2 : in STD_LOGIC;
    gmii_tx_en : in STD_LOGIC;
    gmii_tx_er : in STD_LOGIC;
    XMIT_DATA : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gmii_txd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rxcharisk : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchariscomma : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \TX_CONFIG_reg[14]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_TX : entity is "TX";
end gig_ethernet_pcs_pma_0_TX;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_TX is
  signal C1_OR_C2_i_1_n_0 : STD_LOGIC;
  signal C1_OR_C2_reg_n_0 : STD_LOGIC;
  signal CODE_GRPISK : STD_LOGIC;
  signal CODE_GRPISK_i_1_n_0 : STD_LOGIC;
  signal \CODE_GRP[0]_i_1_n_0\ : STD_LOGIC;
  signal \CODE_GRP[0]_i_2_n_0\ : STD_LOGIC;
  signal \CODE_GRP[1]_i_1_n_0\ : STD_LOGIC;
  signal \CODE_GRP[1]_i_2_n_0\ : STD_LOGIC;
  signal \CODE_GRP[2]_i_1_n_0\ : STD_LOGIC;
  signal \CODE_GRP[3]_i_1_n_0\ : STD_LOGIC;
  signal \CODE_GRP[3]_i_2_n_0\ : STD_LOGIC;
  signal \CODE_GRP[4]_i_1_n_0\ : STD_LOGIC;
  signal \CODE_GRP[5]_i_1_n_0\ : STD_LOGIC;
  signal \CODE_GRP[6]_i_1_n_0\ : STD_LOGIC;
  signal \CODE_GRP[6]_i_2_n_0\ : STD_LOGIC;
  signal \CODE_GRP[7]_i_1_n_0\ : STD_LOGIC;
  signal \CODE_GRP[7]_i_2_n_0\ : STD_LOGIC;
  signal \CODE_GRP[7]_i_3_n_0\ : STD_LOGIC;
  signal \CODE_GRP[7]_i_4_n_0\ : STD_LOGIC;
  signal \CODE_GRP_CNT_reg_n_0_[1]\ : STD_LOGIC;
  signal \CODE_GRP_reg_n_0_[0]\ : STD_LOGIC;
  signal CONFIG_DATA : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \CONFIG_DATA_reg_n_0_[0]\ : STD_LOGIC;
  signal \CONFIG_DATA_reg_n_0_[1]\ : STD_LOGIC;
  signal \CONFIG_DATA_reg_n_0_[2]\ : STD_LOGIC;
  signal \CONFIG_DATA_reg_n_0_[3]\ : STD_LOGIC;
  signal \CONFIG_DATA_reg_n_0_[6]\ : STD_LOGIC;
  signal CONFIG_K28p5_reg_n_0 : STD_LOGIC;
  signal DISPARITY : STD_LOGIC;
  signal INSERT_IDLE : STD_LOGIC;
  signal INSERT_IDLE_i_1_n_0 : STD_LOGIC;
  signal INSERT_IDLE_reg_n_0 : STD_LOGIC;
  signal K28p5 : STD_LOGIC;
  signal K28p5_i_1_n_0 : STD_LOGIC;
  signal \NO_QSGMII_CHAR.TXCHARDISPVAL_i_1_n_0\ : STD_LOGIC;
  signal \NO_QSGMII_DATA.TXDATA[0]_i_1_n_0\ : STD_LOGIC;
  signal \NO_QSGMII_DATA.TXDATA[2]_i_1_n_0\ : STD_LOGIC;
  signal \NO_QSGMII_DATA.TXDATA[4]_i_1_n_0\ : STD_LOGIC;
  signal \NO_QSGMII_DATA.TXDATA[5]_i_1_n_0\ : STD_LOGIC;
  signal \NO_QSGMII_DATA.TXDATA[6]_i_1_n_0\ : STD_LOGIC;
  signal \NO_QSGMII_DATA.TXDATA[7]_i_1_n_0\ : STD_LOGIC;
  signal \NO_QSGMII_DISP.DISPARITY_i_1_n_0\ : STD_LOGIC;
  signal \NO_QSGMII_DISP.DISPARITY_i_2_n_0\ : STD_LOGIC;
  signal \NO_QSGMII_DISP.DISPARITY_i_3_n_0\ : STD_LOGIC;
  signal R : STD_LOGIC;
  signal \R_i_1__0_n_0\ : STD_LOGIC;
  signal S : STD_LOGIC;
  signal S0 : STD_LOGIC;
  signal SYNC_DISPARITY_i_1_n_0 : STD_LOGIC;
  signal SYNC_DISPARITY_reg_n_0 : STD_LOGIC;
  signal T : STD_LOGIC;
  signal T0 : STD_LOGIC;
  signal TRIGGER_S : STD_LOGIC;
  signal TRIGGER_S0 : STD_LOGIC;
  signal TRIGGER_T : STD_LOGIC;
  signal TXCHARDISPMODE_INT : STD_LOGIC;
  signal TXCHARDISPVAL : STD_LOGIC;
  signal TXCHARISK_INT : STD_LOGIC;
  signal TXDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal TXD_REG1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal TX_CONFIG : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal TX_EN_REG1 : STD_LOGIC;
  signal TX_ER_REG1 : STD_LOGIC;
  signal TX_EVEN : STD_LOGIC;
  signal TX_PACKET : STD_LOGIC;
  signal TX_PACKET_REG1 : STD_LOGIC;
  signal TX_PACKET_i_1_n_0 : STD_LOGIC;
  signal V : STD_LOGIC;
  signal V_i_1_n_0 : STD_LOGIC;
  signal V_i_2_n_0 : STD_LOGIC;
  signal V_i_3_n_0 : STD_LOGIC;
  signal V_i_4_n_0 : STD_LOGIC;
  signal V_i_5_n_0 : STD_LOGIC;
  signal V_i_6_n_0 : STD_LOGIC;
  signal XMIT_CONFIG_INT : STD_LOGIC;
  signal XMIT_DATA_INT : STD_LOGIC;
  signal XMIT_DATA_INT_reg_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in16_in : STD_LOGIC;
  signal p_0_in35_in : STD_LOGIC;
  signal p_10_out : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_1_in1_in : STD_LOGIC;
  signal p_1_in34_in : STD_LOGIC;
  signal p_33_in : STD_LOGIC;
  signal p_45_in : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of C1_OR_C2_i_1 : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of CODE_GRPISK_i_1 : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \CODE_GRP[1]_i_2\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \CODE_GRP[7]_i_3\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \CODE_GRP[7]_i_4\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \CODE_GRP_CNT[1]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \CONFIG_DATA[0]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \CONFIG_DATA[1]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \CONFIG_DATA[2]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \CONFIG_DATA[3]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \CONFIG_DATA[6]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \NO_QSGMII_CHAR.TXCHARDISPMODE_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \NO_QSGMII_CHAR.TXCHARDISPVAL_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \NO_QSGMII_DATA.TXDATA[4]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of SYNC_DISPARITY_i_1 : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of TRIGGER_S_i_1 : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of TRIGGER_T_i_1 : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of TX_PACKET_i_1 : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[0]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[1]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[2]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[3]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[4]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[5]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[6]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[7]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXCHARDISPMODE_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXCHARDISPVAL_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXCHARISK_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXDATA[0]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXDATA[1]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXDATA[2]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXDATA[3]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXDATA[4]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXDATA[5]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXDATA[6]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXDATA[7]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \USE_ROCKET_IO.TXDATA[7]_i_2\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of V_i_5 : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of V_i_6 : label is "soft_lutpair51";
begin
C1_OR_C2_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3F80"
    )
        port map (
      I0 => XMIT_CONFIG_INT,
      I1 => TX_EVEN,
      I2 => \CODE_GRP_CNT_reg_n_0_[1]\,
      I3 => C1_OR_C2_reg_n_0,
      O => C1_OR_C2_i_1_n_0
    );
C1_OR_C2_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => C1_OR_C2_i_1_n_0,
      Q => C1_OR_C2_reg_n_0,
      R => SR(0)
    );
CODE_GRPISK_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => XMIT_CONFIG_INT,
      I1 => TX_EVEN,
      I2 => \CODE_GRP_CNT_reg_n_0_[1]\,
      I3 => \CODE_GRP[7]_i_1_n_0\,
      O => CODE_GRPISK_i_1_n_0
    );
CODE_GRPISK_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => CODE_GRPISK_i_1_n_0,
      Q => CODE_GRPISK,
      R => '0'
    );
\CODE_GRP[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0AFA3"
    )
        port map (
      I0 => \CONFIG_DATA_reg_n_0_[0]\,
      I1 => \CODE_GRP[0]_i_2_n_0\,
      I2 => XMIT_CONFIG_INT,
      I3 => S,
      I4 => V,
      O => \CODE_GRP[0]_i_1_n_0\
    );
\CODE_GRP[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0007"
    )
        port map (
      I0 => TXD_REG1(0),
      I1 => TX_PACKET,
      I2 => R,
      I3 => T,
      O => \CODE_GRP[0]_i_2_n_0\
    );
\CODE_GRP[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFAFAFAC"
    )
        port map (
      I0 => \CONFIG_DATA_reg_n_0_[1]\,
      I1 => \CODE_GRP[1]_i_2_n_0\,
      I2 => XMIT_CONFIG_INT,
      I3 => S,
      I4 => V,
      O => \CODE_GRP[1]_i_1_n_0\
    );
\CODE_GRP[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11101010"
    )
        port map (
      I0 => S,
      I1 => T,
      I2 => R,
      I3 => TX_PACKET,
      I4 => TXD_REG1(1),
      O => \CODE_GRP[1]_i_2_n_0\
    );
\CODE_GRP[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA0000FFCF"
    )
        port map (
      I0 => \CONFIG_DATA_reg_n_0_[2]\,
      I1 => \CODE_GRP[7]_i_3_n_0\,
      I2 => TX_PACKET,
      I3 => TXD_REG1(2),
      I4 => S,
      I5 => XMIT_CONFIG_INT,
      O => \CODE_GRP[2]_i_1_n_0\
    );
\CODE_GRP[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFD0"
    )
        port map (
      I0 => TX_PACKET,
      I1 => TXD_REG1(3),
      I2 => \CODE_GRP[7]_i_4_n_0\,
      I3 => \CODE_GRP[3]_i_2_n_0\,
      O => \CODE_GRP[3]_i_1_n_0\
    );
\CODE_GRP[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBBBBBBBBB8"
    )
        port map (
      I0 => \CONFIG_DATA_reg_n_0_[3]\,
      I1 => XMIT_CONFIG_INT,
      I2 => V,
      I3 => Q(1),
      I4 => T,
      I5 => S,
      O => \CODE_GRP[3]_i_2_n_0\
    );
\CODE_GRP[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8888888"
    )
        port map (
      I0 => \CONFIG_DATA_reg_n_0_[2]\,
      I1 => XMIT_CONFIG_INT,
      I2 => TX_PACKET,
      I3 => TXD_REG1(4),
      I4 => \CODE_GRP[7]_i_4_n_0\,
      O => \CODE_GRP[4]_i_1_n_0\
    );
\CODE_GRP[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8888888"
    )
        port map (
      I0 => \CONFIG_DATA_reg_n_0_[2]\,
      I1 => XMIT_CONFIG_INT,
      I2 => TX_PACKET,
      I3 => TXD_REG1(5),
      I4 => \CODE_GRP[7]_i_4_n_0\,
      O => \CODE_GRP[5]_i_1_n_0\
    );
\CODE_GRP[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Q(1),
      I1 => XMIT_CONFIG_INT,
      O => \CODE_GRP[6]_i_1_n_0\
    );
\CODE_GRP[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D000DDDD"
    )
        port map (
      I0 => XMIT_CONFIG_INT,
      I1 => \CONFIG_DATA_reg_n_0_[6]\,
      I2 => TX_PACKET,
      I3 => TXD_REG1(6),
      I4 => \CODE_GRP[7]_i_4_n_0\,
      O => \CODE_GRP[6]_i_2_n_0\
    );
\CODE_GRP[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55555545"
    )
        port map (
      I0 => XMIT_CONFIG_INT,
      I1 => Q(1),
      I2 => TX_PACKET,
      I3 => S,
      I4 => \CODE_GRP[7]_i_3_n_0\,
      O => \CODE_GRP[7]_i_1_n_0\
    );
\CODE_GRP[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8888888"
    )
        port map (
      I0 => \CONFIG_DATA_reg_n_0_[2]\,
      I1 => XMIT_CONFIG_INT,
      I2 => TX_PACKET,
      I3 => TXD_REG1(7),
      I4 => \CODE_GRP[7]_i_4_n_0\,
      O => \CODE_GRP[7]_i_2_n_0\
    );
\CODE_GRP[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => V,
      I1 => R,
      I2 => T,
      O => \CODE_GRP[7]_i_3_n_0\
    );
\CODE_GRP[7]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => XMIT_CONFIG_INT,
      I1 => S,
      I2 => T,
      I3 => R,
      I4 => V,
      O => \CODE_GRP[7]_i_4_n_0\
    );
\CODE_GRP_CNT[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => TX_EVEN,
      O => plusOp(0)
    );
\CODE_GRP_CNT[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => TX_EVEN,
      I1 => \CODE_GRP_CNT_reg_n_0_[1]\,
      O => plusOp(1)
    );
\CODE_GRP_CNT_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => plusOp(0),
      Q => TX_EVEN,
      S => SR(0)
    );
\CODE_GRP_CNT_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => plusOp(1),
      Q => \CODE_GRP_CNT_reg_n_0_[1]\,
      S => SR(0)
    );
\CODE_GRP_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \CODE_GRP[0]_i_1_n_0\,
      Q => \CODE_GRP_reg_n_0_[0]\,
      R => \CODE_GRP[6]_i_1_n_0\
    );
\CODE_GRP_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \CODE_GRP[1]_i_1_n_0\,
      Q => p_1_in,
      R => \CODE_GRP[6]_i_1_n_0\
    );
\CODE_GRP_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => \CODE_GRP[2]_i_1_n_0\,
      Q => p_0_in16_in,
      S => \CODE_GRP[6]_i_1_n_0\
    );
\CODE_GRP_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \CODE_GRP[3]_i_1_n_0\,
      Q => p_0_in,
      R => '0'
    );
\CODE_GRP_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => \CODE_GRP[4]_i_1_n_0\,
      Q => p_1_in1_in,
      S => \CODE_GRP[7]_i_1_n_0\
    );
\CODE_GRP_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => \CODE_GRP[5]_i_1_n_0\,
      Q => p_1_in34_in,
      S => \CODE_GRP[7]_i_1_n_0\
    );
\CODE_GRP_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \CODE_GRP[6]_i_2_n_0\,
      Q => p_33_in,
      R => \CODE_GRP[6]_i_1_n_0\
    );
\CODE_GRP_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => \CODE_GRP[7]_i_2_n_0\,
      Q => p_0_in35_in,
      S => \CODE_GRP[7]_i_1_n_0\
    );
\CONFIG_DATA[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3404"
    )
        port map (
      I0 => C1_OR_C2_reg_n_0,
      I1 => TX_EVEN,
      I2 => \CODE_GRP_CNT_reg_n_0_[1]\,
      I3 => TX_CONFIG(0),
      O => CONFIG_DATA(0)
    );
\CONFIG_DATA[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => C1_OR_C2_reg_n_0,
      I1 => \CODE_GRP_CNT_reg_n_0_[1]\,
      I2 => TX_EVEN,
      O => CONFIG_DATA(1)
    );
\CONFIG_DATA[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => C1_OR_C2_reg_n_0,
      I1 => TX_EVEN,
      I2 => \CODE_GRP_CNT_reg_n_0_[1]\,
      O => CONFIG_DATA(2)
    );
\CONFIG_DATA[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"83"
    )
        port map (
      I0 => TX_CONFIG(11),
      I1 => \CODE_GRP_CNT_reg_n_0_[1]\,
      I2 => TX_EVEN,
      O => CONFIG_DATA(3)
    );
\CONFIG_DATA[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C808"
    )
        port map (
      I0 => C1_OR_C2_reg_n_0,
      I1 => TX_EVEN,
      I2 => \CODE_GRP_CNT_reg_n_0_[1]\,
      I3 => TX_CONFIG(14),
      O => CONFIG_DATA(6)
    );
\CONFIG_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => CONFIG_DATA(0),
      Q => \CONFIG_DATA_reg_n_0_[0]\,
      R => SR(0)
    );
\CONFIG_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => CONFIG_DATA(1),
      Q => \CONFIG_DATA_reg_n_0_[1]\,
      R => SR(0)
    );
\CONFIG_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => CONFIG_DATA(2),
      Q => \CONFIG_DATA_reg_n_0_[2]\,
      R => SR(0)
    );
\CONFIG_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => CONFIG_DATA(3),
      Q => \CONFIG_DATA_reg_n_0_[3]\,
      R => SR(0)
    );
\CONFIG_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => CONFIG_DATA(6),
      Q => \CONFIG_DATA_reg_n_0_[6]\,
      R => SR(0)
    );
CONFIG_K28p5_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => XMIT_DATA_INT,
      Q => CONFIG_K28p5_reg_n_0,
      R => SR(0)
    );
INSERT_IDLE_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF01"
    )
        port map (
      I0 => TX_PACKET,
      I1 => \CODE_GRP[7]_i_3_n_0\,
      I2 => S,
      I3 => Q(1),
      I4 => XMIT_CONFIG_INT,
      O => INSERT_IDLE_i_1_n_0
    );
INSERT_IDLE_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => INSERT_IDLE_i_1_n_0,
      Q => INSERT_IDLE_reg_n_0,
      R => '0'
    );
K28p5_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => XMIT_CONFIG_INT,
      I1 => CONFIG_K28p5_reg_n_0,
      O => K28p5_i_1_n_0
    );
K28p5_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => K28p5_i_1_n_0,
      Q => K28p5,
      R => '0'
    );
\NO_QSGMII_CHAR.TXCHARDISPMODE_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => SYNC_DISPARITY_reg_n_0,
      I1 => TX_EVEN,
      O => p_10_out
    );
\NO_QSGMII_CHAR.TXCHARDISPMODE_reg\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => p_10_out,
      Q => TXCHARDISPMODE_INT,
      S => SR(0)
    );
\NO_QSGMII_CHAR.TXCHARDISPVAL_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => TX_EVEN,
      I1 => SYNC_DISPARITY_reg_n_0,
      I2 => DISPARITY,
      O => \NO_QSGMII_CHAR.TXCHARDISPVAL_i_1_n_0\
    );
\NO_QSGMII_CHAR.TXCHARDISPVAL_reg\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \NO_QSGMII_CHAR.TXCHARDISPVAL_i_1_n_0\,
      Q => TXCHARDISPVAL,
      R => SR(0)
    );
\NO_QSGMII_DATA.TXCHARISK_reg\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => CODE_GRPISK,
      Q => TXCHARISK_INT,
      R => \NO_QSGMII_DATA.TXDATA[5]_i_1_n_0\
    );
\NO_QSGMII_DATA.TXDATA[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23332000"
    )
        port map (
      I0 => DISPARITY,
      I1 => SR(0),
      I2 => TX_EVEN,
      I3 => INSERT_IDLE_reg_n_0,
      I4 => \CODE_GRP_reg_n_0_[0]\,
      O => \NO_QSGMII_DATA.TXDATA[0]_i_1_n_0\
    );
\NO_QSGMII_DATA.TXDATA[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23332000"
    )
        port map (
      I0 => DISPARITY,
      I1 => SR(0),
      I2 => TX_EVEN,
      I3 => INSERT_IDLE_reg_n_0,
      I4 => p_0_in16_in,
      O => \NO_QSGMII_DATA.TXDATA[2]_i_1_n_0\
    );
\NO_QSGMII_DATA.TXDATA[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F40"
    )
        port map (
      I0 => DISPARITY,
      I1 => INSERT_IDLE_reg_n_0,
      I2 => TX_EVEN,
      I3 => p_1_in1_in,
      O => \NO_QSGMII_DATA.TXDATA[4]_i_1_n_0\
    );
\NO_QSGMII_DATA.TXDATA[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => SR(0),
      I1 => TX_EVEN,
      I2 => INSERT_IDLE_reg_n_0,
      O => \NO_QSGMII_DATA.TXDATA[5]_i_1_n_0\
    );
\NO_QSGMII_DATA.TXDATA[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5540"
    )
        port map (
      I0 => SR(0),
      I1 => INSERT_IDLE_reg_n_0,
      I2 => TX_EVEN,
      I3 => p_33_in,
      O => \NO_QSGMII_DATA.TXDATA[6]_i_1_n_0\
    );
\NO_QSGMII_DATA.TXDATA[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23332000"
    )
        port map (
      I0 => DISPARITY,
      I1 => SR(0),
      I2 => TX_EVEN,
      I3 => INSERT_IDLE_reg_n_0,
      I4 => p_0_in35_in,
      O => \NO_QSGMII_DATA.TXDATA[7]_i_1_n_0\
    );
\NO_QSGMII_DATA.TXDATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \NO_QSGMII_DATA.TXDATA[0]_i_1_n_0\,
      Q => TXDATA(0),
      R => '0'
    );
\NO_QSGMII_DATA.TXDATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => p_1_in,
      Q => TXDATA(1),
      R => \NO_QSGMII_DATA.TXDATA[5]_i_1_n_0\
    );
\NO_QSGMII_DATA.TXDATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \NO_QSGMII_DATA.TXDATA[2]_i_1_n_0\,
      Q => TXDATA(2),
      R => '0'
    );
\NO_QSGMII_DATA.TXDATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => p_0_in,
      Q => TXDATA(3),
      R => \NO_QSGMII_DATA.TXDATA[5]_i_1_n_0\
    );
\NO_QSGMII_DATA.TXDATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \NO_QSGMII_DATA.TXDATA[4]_i_1_n_0\,
      Q => TXDATA(4),
      R => SR(0)
    );
\NO_QSGMII_DATA.TXDATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => p_1_in34_in,
      Q => TXDATA(5),
      R => \NO_QSGMII_DATA.TXDATA[5]_i_1_n_0\
    );
\NO_QSGMII_DATA.TXDATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \NO_QSGMII_DATA.TXDATA[6]_i_1_n_0\,
      Q => TXDATA(6),
      R => '0'
    );
\NO_QSGMII_DATA.TXDATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \NO_QSGMII_DATA.TXDATA[7]_i_1_n_0\,
      Q => TXDATA(7),
      R => '0'
    );
\NO_QSGMII_DISP.DISPARITY_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0009090900F6F6F6"
    )
        port map (
      I0 => \NO_QSGMII_DISP.DISPARITY_i_2_n_0\,
      I1 => \NO_QSGMII_DISP.DISPARITY_i_3_n_0\,
      I2 => K28p5,
      I3 => TX_EVEN,
      I4 => INSERT_IDLE_reg_n_0,
      I5 => DISPARITY,
      O => \NO_QSGMII_DISP.DISPARITY_i_1_n_0\
    );
\NO_QSGMII_DISP.DISPARITY_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"167E7EE8"
    )
        port map (
      I0 => p_1_in,
      I1 => \CODE_GRP_reg_n_0_[0]\,
      I2 => p_0_in16_in,
      I3 => p_0_in,
      I4 => p_1_in1_in,
      O => \NO_QSGMII_DISP.DISPARITY_i_2_n_0\
    );
\NO_QSGMII_DISP.DISPARITY_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7C"
    )
        port map (
      I0 => p_0_in35_in,
      I1 => p_33_in,
      I2 => p_1_in34_in,
      O => \NO_QSGMII_DISP.DISPARITY_i_3_n_0\
    );
\NO_QSGMII_DISP.DISPARITY_reg\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => \NO_QSGMII_DISP.DISPARITY_i_1_n_0\,
      Q => DISPARITY,
      S => SR(0)
    );
\R_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDDCCCCC"
    )
        port map (
      I0 => S,
      I1 => T,
      I2 => TX_ER_REG1,
      I3 => TX_EVEN,
      I4 => R,
      O => \R_i_1__0_n_0\
    );
R_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \R_i_1__0_n_0\,
      Q => R,
      R => SR(0)
    );
SYNC_DISPARITY_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => TX_EVEN,
      I1 => \CODE_GRP_CNT_reg_n_0_[1]\,
      I2 => XMIT_CONFIG_INT,
      I3 => INSERT_IDLE,
      O => SYNC_DISPARITY_i_1_n_0
    );
SYNC_DISPARITY_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAAB"
    )
        port map (
      I0 => Q(1),
      I1 => S,
      I2 => T,
      I3 => R,
      I4 => V,
      I5 => TX_PACKET,
      O => INSERT_IDLE
    );
SYNC_DISPARITY_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => SYNC_DISPARITY_i_1_n_0,
      Q => SYNC_DISPARITY_reg_n_0,
      R => '0'
    );
\S_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888A8AA88888888"
    )
        port map (
      I0 => XMIT_DATA_INT_reg_n_0,
      I1 => TRIGGER_S,
      I2 => TX_ER_REG1,
      I3 => TX_EVEN,
      I4 => TX_EN_REG1,
      I5 => gmii_tx_en,
      O => S0
    );
S_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => S0,
      Q => S,
      R => SR(0)
    );
TRIGGER_S_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => TX_EN_REG1,
      I1 => gmii_tx_en,
      I2 => TX_ER_REG1,
      I3 => TX_EVEN,
      O => TRIGGER_S0
    );
TRIGGER_S_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => TRIGGER_S0,
      Q => TRIGGER_S,
      R => SR(0)
    );
TRIGGER_T_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => TX_EN_REG1,
      I1 => gmii_tx_en,
      O => p_45_in
    );
TRIGGER_T_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => p_45_in,
      Q => TRIGGER_T,
      R => SR(0)
    );
\TXD_REG1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => gmii_txd(0),
      Q => TXD_REG1(0),
      R => '0'
    );
\TXD_REG1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => gmii_txd(1),
      Q => TXD_REG1(1),
      R => '0'
    );
\TXD_REG1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => gmii_txd(2),
      Q => TXD_REG1(2),
      R => '0'
    );
\TXD_REG1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => gmii_txd(3),
      Q => TXD_REG1(3),
      R => '0'
    );
\TXD_REG1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => gmii_txd(4),
      Q => TXD_REG1(4),
      R => '0'
    );
\TXD_REG1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => gmii_txd(5),
      Q => TXD_REG1(5),
      R => '0'
    );
\TXD_REG1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => gmii_txd(6),
      Q => TXD_REG1(6),
      R => '0'
    );
\TXD_REG1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => gmii_txd(7),
      Q => TXD_REG1(7),
      R => '0'
    );
\TX_CONFIG_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => XMIT_DATA_INT,
      D => \TX_CONFIG_reg[14]_0\(0),
      Q => TX_CONFIG(0),
      R => SR(0)
    );
\TX_CONFIG_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => XMIT_DATA_INT,
      D => \TX_CONFIG_reg[14]_0\(1),
      Q => TX_CONFIG(11),
      R => SR(0)
    );
\TX_CONFIG_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => XMIT_DATA_INT,
      D => \TX_CONFIG_reg[14]_0\(2),
      Q => TX_CONFIG(14),
      R => SR(0)
    );
TX_EN_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => gmii_tx_en,
      Q => TX_EN_REG1,
      R => '0'
    );
TX_ER_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => gmii_tx_er,
      Q => TX_ER_REG1,
      R => '0'
    );
TX_PACKET_REG1_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => TX_PACKET,
      Q => TX_PACKET_REG1,
      R => SR(0)
    );
TX_PACKET_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F2"
    )
        port map (
      I0 => TX_PACKET,
      I1 => T,
      I2 => S,
      O => TX_PACKET_i_1_n_0
    );
TX_PACKET_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => TX_PACKET_i_1_n_0,
      Q => TX_PACKET,
      R => SR(0)
    );
T_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888FFF88888"
    )
        port map (
      I0 => TRIGGER_T,
      I1 => V,
      I2 => S,
      I3 => TX_PACKET,
      I4 => TX_EN_REG1,
      I5 => gmii_tx_en,
      O => T0
    );
T_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => T0,
      Q => T,
      R => SR(0)
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TXCHARISK_INT,
      I1 => Q(0),
      I2 => rxchariscomma(0),
      O => \NO_QSGMII_DATA.TXCHARISK_reg_1\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TXCHARISK_INT,
      I1 => Q(0),
      I2 => rxcharisk(0),
      O => \NO_QSGMII_DATA.TXCHARISK_reg_0\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TXDATA(0),
      I1 => Q(0),
      I2 => rxdata(0),
      O => \NO_QSGMII_DATA.TXDATA_reg[7]_1\(0)
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TXDATA(1),
      I1 => Q(0),
      I2 => rxdata(1),
      O => \NO_QSGMII_DATA.TXDATA_reg[7]_1\(1)
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TXDATA(2),
      I1 => Q(0),
      I2 => rxdata(2),
      O => \NO_QSGMII_DATA.TXDATA_reg[7]_1\(2)
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TXDATA(3),
      I1 => Q(0),
      I2 => rxdata(3),
      O => \NO_QSGMII_DATA.TXDATA_reg[7]_1\(3)
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TXDATA(4),
      I1 => Q(0),
      I2 => rxdata(4),
      O => \NO_QSGMII_DATA.TXDATA_reg[7]_1\(4)
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TXDATA(5),
      I1 => Q(0),
      I2 => rxdata(5),
      O => \NO_QSGMII_DATA.TXDATA_reg[7]_1\(5)
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TXDATA(6),
      I1 => Q(0),
      I2 => rxdata(6),
      O => \NO_QSGMII_DATA.TXDATA_reg[7]_1\(6)
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TXDATA(7),
      I1 => Q(0),
      I2 => rxdata(7),
      O => \NO_QSGMII_DATA.TXDATA_reg[7]_1\(7)
    );
\USE_ROCKET_IO.TXCHARDISPMODE_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TX_EVEN,
      I1 => Q(0),
      I2 => TXCHARDISPMODE_INT,
      O => \CODE_GRP_CNT_reg[0]_0\
    );
\USE_ROCKET_IO.TXCHARDISPVAL_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => TXCHARDISPVAL,
      I1 => Q(0),
      I2 => SR(0),
      O => \NO_QSGMII_CHAR.TXCHARDISPVAL_reg_0\
    );
\USE_ROCKET_IO.TXCHARISK_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => TX_EVEN,
      I1 => Q(0),
      I2 => TXCHARISK_INT,
      O => \CODE_GRP_CNT_reg[0]_1\
    );
\USE_ROCKET_IO.TXDATA[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => TXDATA(0),
      I1 => Q(0),
      I2 => SR(0),
      O => D(0)
    );
\USE_ROCKET_IO.TXDATA[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => TXDATA(1),
      I1 => Q(0),
      I2 => SR(0),
      O => D(1)
    );
\USE_ROCKET_IO.TXDATA[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => TXDATA(2),
      I1 => Q(0),
      I2 => SR(0),
      O => \NO_QSGMII_DATA.TXDATA_reg[2]_0\
    );
\USE_ROCKET_IO.TXDATA[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => TXDATA(3),
      I1 => Q(0),
      I2 => SR(0),
      O => \NO_QSGMII_DATA.TXDATA_reg[3]_0\
    );
\USE_ROCKET_IO.TXDATA[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => SR(0),
      I1 => TXDATA(4),
      I2 => Q(0),
      O => D(2)
    );
\USE_ROCKET_IO.TXDATA[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => TXDATA(5),
      I1 => Q(0),
      I2 => SR(0),
      O => \NO_QSGMII_DATA.TXDATA_reg[5]_0\
    );
\USE_ROCKET_IO.TXDATA[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0074"
    )
        port map (
      I0 => TX_EVEN,
      I1 => Q(0),
      I2 => TXDATA(6),
      I3 => SR(0),
      O => D(3)
    );
\USE_ROCKET_IO.TXDATA[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => SR(0),
      I1 => Q(0),
      I2 => TX_EVEN,
      O => \USE_ROCKET_IO.MGT_TX_RESET_INT_reg\
    );
\USE_ROCKET_IO.TXDATA[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => TXDATA(7),
      I1 => Q(0),
      I2 => SR(0),
      O => \NO_QSGMII_DATA.TXDATA_reg[7]_0\
    );
V_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => V_i_2_n_0,
      I1 => S,
      I2 => V,
      O => V_i_1_n_0
    );
V_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8888A8AA"
    )
        port map (
      I0 => XMIT_DATA_INT_reg_n_0,
      I1 => V_i_3_n_0,
      I2 => V_i_4_n_0,
      I3 => V_i_5_n_0,
      I4 => V_i_6_n_0,
      O => V_i_2_n_0
    );
V_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => TX_EN_REG1,
      I1 => TX_ER_REG1,
      I2 => TX_PACKET_REG1,
      O => V_i_3_n_0
    );
V_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFFFFFFFFFF"
    )
        port map (
      I0 => gmii_txd(2),
      I1 => gmii_txd(4),
      I2 => gmii_txd(6),
      I3 => gmii_txd(1),
      I4 => gmii_txd(3),
      I5 => gmii_txd(0),
      O => V_i_4_n_0
    );
V_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => gmii_txd(5),
      I1 => gmii_tx_en,
      I2 => gmii_txd(7),
      O => V_i_5_n_0
    );
V_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5D"
    )
        port map (
      I0 => gmii_tx_er,
      I1 => gmii_tx_en,
      I2 => TX_PACKET,
      O => V_i_6_n_0
    );
V_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => V_i_1_n_0,
      Q => V,
      R => SR(0)
    );
\XMIT_CONFIG_INT_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => TX_EVEN,
      I1 => \CODE_GRP_CNT_reg_n_0_[1]\,
      O => XMIT_DATA_INT
    );
XMIT_CONFIG_INT_reg: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => XMIT_DATA_INT,
      D => XMIT_CONFIG,
      Q => XMIT_CONFIG_INT,
      S => SR(0)
    );
XMIT_DATA_INT_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => XMIT_DATA_INT,
      D => XMIT_DATA,
      Q => XMIT_DATA_INT_reg_n_0,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_reset_sync_block is
  port (
    reset_out : out STD_LOGIC;
    userclk2 : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_reset_sync_block : entity is "reset_sync_block";
end gig_ethernet_pcs_pma_0_reset_sync_block;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_reset_sync_block is
  signal reset_sync_reg1 : STD_LOGIC;
  signal reset_sync_reg2 : STD_LOGIC;
  signal reset_sync_reg3 : STD_LOGIC;
  signal reset_sync_reg4 : STD_LOGIC;
  signal reset_sync_reg5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => '0',
      PRE => reset,
      Q => reset_sync_reg1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => reset_sync_reg1,
      PRE => reset,
      Q => reset_sync_reg2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => reset_sync_reg2,
      PRE => reset,
      Q => reset_sync_reg3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => reset_sync_reg3,
      PRE => reset,
      Q => reset_sync_reg4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => reset_sync_reg4,
      PRE => reset,
      Q => reset_sync_reg5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => reset_sync_reg5,
      PRE => '0',
      Q => reset_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_reset_sync_block_22 is
  port (
    p_6_out : out STD_LOGIC;
    reset_out : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_reset_sync_block_22 : entity is "reset_sync_block";
end gig_ethernet_pcs_pma_0_reset_sync_block_22;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_reset_sync_block_22 is
  signal p_5_in : STD_LOGIC;
  signal reset_sync_reg1 : STD_LOGIC;
  signal reset_sync_reg2 : STD_LOGIC;
  signal reset_sync_reg3 : STD_LOGIC;
  signal reset_sync_reg4 : STD_LOGIC;
  signal reset_sync_reg5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
\MGT_RESET.RESET_INT_PIPE_RXRECCLK_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_5_in,
      I1 => reset_out,
      O => p_6_out
    );
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => '0',
      PRE => reset,
      Q => reset_sync_reg1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => reset_sync_reg1,
      PRE => reset,
      Q => reset_sync_reg2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => reset_sync_reg2,
      PRE => reset,
      Q => reset_sync_reg3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => reset_sync_reg3,
      PRE => reset,
      Q => reset_sync_reg4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => reset_sync_reg4,
      PRE => reset,
      Q => reset_sync_reg5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => reset_sync_reg5,
      PRE => '0',
      Q => p_5_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_reset_sync_block_23 is
  port (
    reset_out : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_reset_sync_block_23 : entity is "reset_sync_block";
end gig_ethernet_pcs_pma_0_reset_sync_block_23;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_reset_sync_block_23 is
  signal reset_sync_reg1 : STD_LOGIC;
  signal reset_sync_reg2 : STD_LOGIC;
  signal reset_sync_reg3 : STD_LOGIC;
  signal reset_sync_reg4 : STD_LOGIC;
  signal reset_sync_reg5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => '0',
      PRE => '0',
      Q => reset_sync_reg1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => reset_sync_reg1,
      PRE => '0',
      Q => reset_sync_reg2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => reset_sync_reg2,
      PRE => '0',
      Q => reset_sync_reg3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => reset_sync_reg3,
      PRE => '0',
      Q => reset_sync_reg4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => reset_sync_reg4,
      PRE => '0',
      Q => reset_sync_reg5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => '0',
      CE => '1',
      D => reset_sync_reg5,
      PRE => '0',
      Q => reset_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block is
  port (
    data_sync_reg6_0 : out STD_LOGIC;
    data_out : out STD_LOGIC;
    SIGNAL_DETECT_MOD : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_0_in : in STD_LOGIC;
    \MASK_RUDI_BUFERR_TIMER_reg[12]\ : in STD_LOGIC;
    signal_detect : in STD_LOGIC;
    userclk2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block : entity is "sync_block";
end gig_ethernet_pcs_pma_0_sync_block;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \MASK_RUDI_BUFERR_TIMER[12]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of SIGNAL_DETECT_REG_i_1 : label is "soft_lutpair78";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
\MASK_RUDI_BUFERR_TIMER[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"20FF"
    )
        port map (
      I0 => \^data_out\,
      I1 => Q(0),
      I2 => p_0_in,
      I3 => \MASK_RUDI_BUFERR_TIMER_reg[12]\,
      O => data_sync_reg6_0
    );
SIGNAL_DETECT_REG_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^data_out\,
      I1 => Q(0),
      O => SIGNAL_DETECT_MOD
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => signal_detect,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte is
  port (
    BaseX_Tx_Bsc_Rst : in STD_LOGIC;
    BaseX_Rx_Bsc_Rst : in STD_LOGIC;
    BaseX_Tx_Bs_Rst : in STD_LOGIC;
    BaseX_Rx_Bs_Rst : in STD_LOGIC;
    BaseX_Tx_Rst_Dly : in STD_LOGIC;
    BaseX_Rx_Rst_Dly : in STD_LOGIC;
    BaseX_Tx_Bsc_En_Vtc : in STD_LOGIC;
    BaseX_Rx_Bsc_En_Vtc : in STD_LOGIC;
    BaseX_Tx_Bs_En_Vtc : in STD_LOGIC;
    BaseX_Rx_Bs_En_Vtc : in STD_LOGIC;
    BaseX_Riu_Clk : in STD_LOGIC;
    BaseX_Riu_Addr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    BaseX_Riu_Wr_Data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    BaseX_Riu_Rd_Data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    BaseX_Riu_Valid : out STD_LOGIC;
    BaseX_Riu_Prsnt : out STD_LOGIC;
    BaseX_Riu_Wr_En : in STD_LOGIC;
    BaseX_Riu_Nibble_Sel : in STD_LOGIC_VECTOR ( 1 downto 0 );
    BaseX_Tx_Pll_Clk : in STD_LOGIC;
    BaseX_Rx_Pll_Clk : in STD_LOGIC;
    BaseX_Tx_Dly_Rdy : out STD_LOGIC;
    BaseX_Rx_Dly_Rdy : out STD_LOGIC;
    BaseX_Tx_Vtc_Rdy : out STD_LOGIC;
    BaseX_Rx_Vtc_Rdy : out STD_LOGIC;
    BaseX_Tx_Phy_Rden : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BaseX_Rx_Phy_Rden : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BaseX_Rx_Fifo_Rd_Clk : in STD_LOGIC;
    BaseX_Rx_Fifo_Rd_En : in STD_LOGIC_VECTOR ( 5 downto 0 );
    BaseX_Rx_Fifo_Empty : out STD_LOGIC_VECTOR ( 5 downto 0 );
    BaseX_Dly_Clk : in STD_LOGIC;
    BaseX_Idly_Ce : in STD_LOGIC_VECTOR ( 5 downto 0 );
    BaseX_Idly_Inc : in STD_LOGIC_VECTOR ( 5 downto 0 );
    BaseX_Idly_Load : in STD_LOGIC_VECTOR ( 5 downto 0 );
    BaseX_Idly_CntValueIn : in STD_LOGIC_VECTOR ( 53 downto 0 );
    BaseX_Idly_CntValueOut : out STD_LOGIC_VECTOR ( 53 downto 0 );
    BaseX_Odly_Ce : in STD_LOGIC_VECTOR ( 6 downto 0 );
    BaseX_Odly_Inc : in STD_LOGIC_VECTOR ( 6 downto 0 );
    BaseX_Odly_Load : in STD_LOGIC_VECTOR ( 6 downto 0 );
    BaseX_Odly_CntValueIn : in STD_LOGIC_VECTOR ( 62 downto 0 );
    BaseX_Odly_CntValueOut : out STD_LOGIC_VECTOR ( 62 downto 0 );
    BaseX_TriOdly_Ce : in STD_LOGIC;
    BaseX_TriOdly_Inc : in STD_LOGIC;
    BaseX_TriOdly_Load : in STD_LOGIC;
    BaseX_TriOdly_CntValueIn : in STD_LOGIC_VECTOR ( 8 downto 0 );
    BaseX_TriOdly_CntValueOut : out STD_LOGIC_VECTOR ( 8 downto 0 );
    BaseX_Tx_TbyteIn : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BaseX_Tx_T_In : in STD_LOGIC_VECTOR ( 6 downto 0 );
    BaseX_Tx_D_In : in STD_LOGIC_VECTOR ( 55 downto 0 );
    BaseX_Rx_Q_Out : out STD_LOGIC_VECTOR ( 23 downto 0 );
    BaseX_Rx_Q_CombOut : out STD_LOGIC_VECTOR ( 5 downto 0 );
    BaseX_Tx_Tri_Out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    BaseX_Tx_Data_Out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    BaseX_Rx_Data_In : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Tx_RdClk : in STD_LOGIC
  );
  attribute C_BytePosition : integer;
  attribute C_BytePosition of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is 0;
  attribute C_IoBank : integer;
  attribute C_IoBank of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is 44;
  attribute C_Part : string;
  attribute C_Part of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "XCKU060";
  attribute C_Rx_BtslcNulType : string;
  attribute C_Rx_BtslcNulType of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "SERIAL";
  attribute C_Rx_Data_Width : integer;
  attribute C_Rx_Data_Width of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is 4;
  attribute C_Rx_Delay_Format : string;
  attribute C_Rx_Delay_Format of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "COUNT";
  attribute C_Rx_Delay_Type : string;
  attribute C_Rx_Delay_Type of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "VAR_LOAD";
  attribute C_Rx_Delay_Value : integer;
  attribute C_Rx_Delay_Value of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is 0;
  attribute C_Rx_RefClk_Frequency : string;
  attribute C_Rx_RefClk_Frequency of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "312.500000";
  attribute C_Rx_Self_Calibrate : string;
  attribute C_Rx_Self_Calibrate of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "ENABLE";
  attribute C_Rx_Serial_Mode : string;
  attribute C_Rx_Serial_Mode of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "TRUE";
  attribute C_Rx_UsedBitslices : string;
  attribute C_Rx_UsedBitslices of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "7'b0110001";
  attribute C_TxInUpperNibble : integer;
  attribute C_TxInUpperNibble of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is 1;
  attribute C_Tx_BtslceTr : string;
  attribute C_Tx_BtslceTr of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "T";
  attribute C_Tx_BtslceUsedAsT : string;
  attribute C_Tx_BtslceUsedAsT of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "7'b0000000";
  attribute C_Tx_Data_Width : integer;
  attribute C_Tx_Data_Width of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is 8;
  attribute C_Tx_Delay_Format : string;
  attribute C_Tx_Delay_Format of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "TIME";
  attribute C_Tx_Delay_Type : string;
  attribute C_Tx_Delay_Type of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "FIXED";
  attribute C_Tx_Delay_Value : integer;
  attribute C_Tx_Delay_Value of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is 0;
  attribute C_Tx_RefClk_Frequency : string;
  attribute C_Tx_RefClk_Frequency of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "1250.000000";
  attribute C_Tx_Self_Calibrate : string;
  attribute C_Tx_Self_Calibrate of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "ENABLE";
  attribute C_Tx_Serial_Mode : string;
  attribute C_Tx_Serial_Mode of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "FALSE";
  attribute C_Tx_UsedBitslices : string;
  attribute C_Tx_UsedBitslices of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "7'b0000100";
  attribute C_UseRxRiu : integer;
  attribute C_UseRxRiu of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is 1;
  attribute C_UseTxRiu : integer;
  attribute C_UseTxRiu of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "gig_ethernet_pcs_pma_0_BaseX_Byte";
  attribute dont_touch : string;
  attribute dont_touch of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte : entity is "true";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte is
  signal \^basex_tx_vtc_rdy\ : STD_LOGIC;
  signal IntActTx_TByteinPip : STD_LOGIC_VECTOR ( 1 to 1 );
  signal IntRx_Riu_Rd_Data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal IntRx_Riu_Valid : STD_LOGIC;
  signal IntTx_Riu_Rd_Data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal IntTx_Riu_Valid : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_BaseX_Byte_I_Rx_Nibble_Fifo_Wrclk_Out_UNCONNECTED : STD_LOGIC;
  signal NLW_BaseX_Byte_I_Rx_Nibble_Rx_Clk_To_Ext_North_UNCONNECTED : STD_LOGIC;
  signal NLW_BaseX_Byte_I_Rx_Nibble_Rx_Clk_To_Ext_South_UNCONNECTED : STD_LOGIC;
  signal NLW_BaseX_Byte_I_Rx_Nibble_Rx_Nclk_Nibble_Out_UNCONNECTED : STD_LOGIC;
  signal NLW_BaseX_Byte_I_Rx_Nibble_Rx_Pclk_Nibble_Out_UNCONNECTED : STD_LOGIC;
  signal NLW_BaseX_Byte_I_Rx_Nibble_Rx_CntValueOut_Ext_UNCONNECTED : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal NLW_BaseX_Byte_I_Rx_Nibble_Rx_Dyn_Dci_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_BaseX_Byte_I_Tx_Nibble_Tx_Clk_To_Ext_North_UNCONNECTED : STD_LOGIC;
  signal NLW_BaseX_Byte_I_Tx_Nibble_Tx_Clk_To_Ext_South_UNCONNECTED : STD_LOGIC;
  signal NLW_BaseX_Byte_I_Tx_Nibble_Tx_Nclk_Nibble_Out_UNCONNECTED : STD_LOGIC;
  signal NLW_BaseX_Byte_I_Tx_Nibble_Tx_Pclk_Nibble_Out_UNCONNECTED : STD_LOGIC;
  signal NLW_BaseX_Byte_I_Tx_Nibble_Tx_Dyn_Dci_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute C_BtslcNulType : string;
  attribute C_BtslcNulType of BaseX_Byte_I_Rx_Nibble : label is "SERIAL";
  attribute C_BusRxBitCtrlIn : integer;
  attribute C_BusRxBitCtrlIn of BaseX_Byte_I_Rx_Nibble : label is 40;
  attribute C_BusRxBitCtrlOut : integer;
  attribute C_BusRxBitCtrlOut of BaseX_Byte_I_Rx_Nibble : label is 40;
  attribute C_BusTxBitCtrlIn : integer;
  attribute C_BusTxBitCtrlIn of BaseX_Byte_I_Rx_Nibble : label is 40;
  attribute C_BusTxBitCtrlInTri : integer;
  attribute C_BusTxBitCtrlInTri of BaseX_Byte_I_Rx_Nibble : label is 40;
  attribute C_BusTxBitCtrlOut : integer;
  attribute C_BusTxBitCtrlOut of BaseX_Byte_I_Rx_Nibble : label is 40;
  attribute C_BusTxBitCtrlOutTri : integer;
  attribute C_BusTxBitCtrlOutTri of BaseX_Byte_I_Rx_Nibble : label is 40;
  attribute C_BytePosition of BaseX_Byte_I_Rx_Nibble : label is 0;
  attribute C_Cascade : string;
  attribute C_Cascade of BaseX_Byte_I_Rx_Nibble : label is "FALSE";
  attribute C_CntValue : integer;
  attribute C_CntValue of BaseX_Byte_I_Rx_Nibble : label is 9;
  attribute C_Ctrl_Clk : string;
  attribute C_Ctrl_Clk of BaseX_Byte_I_Rx_Nibble : label is "EXTERNAL";
  attribute C_Delay_Format : string;
  attribute C_Delay_Format of BaseX_Byte_I_Rx_Nibble : label is "COUNT";
  attribute C_Delay_Type : string;
  attribute C_Delay_Type of BaseX_Byte_I_Rx_Nibble : label is "VAR_LOAD";
  attribute C_Delay_Value : integer;
  attribute C_Delay_Value of BaseX_Byte_I_Rx_Nibble : label is 0;
  attribute C_Delay_Value_Ext : integer;
  attribute C_Delay_Value_Ext of BaseX_Byte_I_Rx_Nibble : label is 0;
  attribute C_Div_Mode : string;
  attribute C_Div_Mode of BaseX_Byte_I_Rx_Nibble : label is "DIV2";
  attribute C_En_Clk_To_Ext_North : string;
  attribute C_En_Clk_To_Ext_North of BaseX_Byte_I_Rx_Nibble : label is "DISABLE";
  attribute C_En_Clk_To_Ext_South : string;
  attribute C_En_Clk_To_Ext_South of BaseX_Byte_I_Rx_Nibble : label is "DISABLE";
  attribute C_En_Dyn_Odly_Mode : string;
  attribute C_En_Dyn_Odly_Mode of BaseX_Byte_I_Rx_Nibble : label is "FALSE";
  attribute C_En_Other_Nclk : string;
  attribute C_En_Other_Nclk of BaseX_Byte_I_Rx_Nibble : label is "FALSE";
  attribute C_En_Other_Pclk : string;
  attribute C_En_Other_Pclk of BaseX_Byte_I_Rx_Nibble : label is "FALSE";
  attribute C_Fifo_Sync_Mode : string;
  attribute C_Fifo_Sync_Mode of BaseX_Byte_I_Rx_Nibble : label is "FALSE";
  attribute C_Idly_Vt_Track : string;
  attribute C_Idly_Vt_Track of BaseX_Byte_I_Rx_Nibble : label is "TRUE";
  attribute C_Inv_Rxclk : string;
  attribute C_Inv_Rxclk of BaseX_Byte_I_Rx_Nibble : label is "FALSE";
  attribute C_IoBank of BaseX_Byte_I_Rx_Nibble : label is 44;
  attribute C_Is_Clk_Ext_Inverted : string;
  attribute C_Is_Clk_Ext_Inverted of BaseX_Byte_I_Rx_Nibble : label is "1'b0";
  attribute C_Is_Clk_Inverted : string;
  attribute C_Is_Clk_Inverted of BaseX_Byte_I_Rx_Nibble : label is "1'b0";
  attribute C_Is_Rst_Dly_Ext_Inverted : string;
  attribute C_Is_Rst_Dly_Ext_Inverted of BaseX_Byte_I_Rx_Nibble : label is "1'b0";
  attribute C_Is_Rst_Dly_Inverted : string;
  attribute C_Is_Rst_Dly_Inverted of BaseX_Byte_I_Rx_Nibble : label is "1'b0";
  attribute C_Is_Rst_Inverted : string;
  attribute C_Is_Rst_Inverted of BaseX_Byte_I_Rx_Nibble : label is "1'b0";
  attribute C_NibbleType : integer;
  attribute C_NibbleType of BaseX_Byte_I_Rx_Nibble : label is 6;
  attribute C_Odly_Vt_Track : string;
  attribute C_Odly_Vt_Track of BaseX_Byte_I_Rx_Nibble : label is "TRUE";
  attribute C_Part of BaseX_Byte_I_Rx_Nibble : label is "XCKU060";
  attribute C_Qdly_Vt_Track : string;
  attribute C_Qdly_Vt_Track of BaseX_Byte_I_Rx_Nibble : label is "TRUE";
  attribute C_Read_Idle_Count : string;
  attribute C_Read_Idle_Count of BaseX_Byte_I_Rx_Nibble : label is "6'b000000";
  attribute C_RefClk_Frequency : string;
  attribute C_RefClk_Frequency of BaseX_Byte_I_Rx_Nibble : label is "312.500000";
  attribute C_RefClk_Src : string;
  attribute C_RefClk_Src of BaseX_Byte_I_Rx_Nibble : label is "PLLCLK";
  attribute C_Rounding_Factor : integer;
  attribute C_Rounding_Factor of BaseX_Byte_I_Rx_Nibble : label is 16;
  attribute C_RxGate_Extend : string;
  attribute C_RxGate_Extend of BaseX_Byte_I_Rx_Nibble : label is "FALSE";
  attribute C_Rx_Clk_Phase_n : string;
  attribute C_Rx_Clk_Phase_n of BaseX_Byte_I_Rx_Nibble : label is "SHIFT_90";
  attribute C_Rx_Clk_Phase_p : string;
  attribute C_Rx_Clk_Phase_p of BaseX_Byte_I_Rx_Nibble : label is "SHIFT_90";
  attribute C_Rx_Data_Width of BaseX_Byte_I_Rx_Nibble : label is 4;
  attribute C_Rx_Gating : string;
  attribute C_Rx_Gating of BaseX_Byte_I_Rx_Nibble : label is "DISABLE";
  attribute C_Self_Calibrate : string;
  attribute C_Self_Calibrate of BaseX_Byte_I_Rx_Nibble : label is "ENABLE";
  attribute C_Serial_Mode : string;
  attribute C_Serial_Mode of BaseX_Byte_I_Rx_Nibble : label is "TRUE";
  attribute C_Tx_Gating : string;
  attribute C_Tx_Gating of BaseX_Byte_I_Rx_Nibble : label is "DISABLE";
  attribute C_Update_Mode : string;
  attribute C_Update_Mode of BaseX_Byte_I_Rx_Nibble : label is "ASYNC";
  attribute C_Update_Mode_Ext : string;
  attribute C_Update_Mode_Ext of BaseX_Byte_I_Rx_Nibble : label is "ASYNC";
  attribute C_UsedBitslices : string;
  attribute C_UsedBitslices of BaseX_Byte_I_Rx_Nibble : label is "7'b0110001";
  attribute C_BtslceUsedAsT : string;
  attribute C_BtslceUsedAsT of BaseX_Byte_I_Tx_Nibble : label is "7'b0000000";
  attribute C_BusRxBitCtrlIn of BaseX_Byte_I_Tx_Nibble : label is 40;
  attribute C_BusRxBitCtrlOut of BaseX_Byte_I_Tx_Nibble : label is 40;
  attribute C_BusTxBitCtrlIn of BaseX_Byte_I_Tx_Nibble : label is 40;
  attribute C_BusTxBitCtrlInTri of BaseX_Byte_I_Tx_Nibble : label is 40;
  attribute C_BusTxBitCtrlOut of BaseX_Byte_I_Tx_Nibble : label is 40;
  attribute C_BusTxBitCtrlOutTri of BaseX_Byte_I_Tx_Nibble : label is 40;
  attribute C_BytePosition of BaseX_Byte_I_Tx_Nibble : label is 0;
  attribute C_CntValue of BaseX_Byte_I_Tx_Nibble : label is 9;
  attribute C_Ctrl_Clk of BaseX_Byte_I_Tx_Nibble : label is "EXTERNAL";
  attribute C_Data_Type : string;
  attribute C_Data_Type of BaseX_Byte_I_Tx_Nibble : label is "DATA";
  attribute C_Delay_Format of BaseX_Byte_I_Tx_Nibble : label is "TIME";
  attribute C_Delay_Type of BaseX_Byte_I_Tx_Nibble : label is "FIXED";
  attribute C_Delay_Value of BaseX_Byte_I_Tx_Nibble : label is 0;
  attribute C_Div_Mode of BaseX_Byte_I_Tx_Nibble : label is "DIV4";
  attribute C_En_Clk_To_Ext_North of BaseX_Byte_I_Tx_Nibble : label is "DISABLE";
  attribute C_En_Clk_To_Ext_South of BaseX_Byte_I_Tx_Nibble : label is "DISABLE";
  attribute C_En_Dyn_Odly_Mode of BaseX_Byte_I_Tx_Nibble : label is "FALSE";
  attribute C_En_Other_Nclk of BaseX_Byte_I_Tx_Nibble : label is "FALSE";
  attribute C_En_Other_Pclk of BaseX_Byte_I_Tx_Nibble : label is "FALSE";
  attribute C_Enable_Pre_Emphasis : string;
  attribute C_Enable_Pre_Emphasis of BaseX_Byte_I_Tx_Nibble : label is "FALSE";
  attribute C_Idly_Vt_Track of BaseX_Byte_I_Tx_Nibble : label is "FALSE";
  attribute C_Init : string;
  attribute C_Init of BaseX_Byte_I_Tx_Nibble : label is "1'b0";
  attribute C_Inv_Rxclk of BaseX_Byte_I_Tx_Nibble : label is "FALSE";
  attribute C_IoBank of BaseX_Byte_I_Tx_Nibble : label is 44;
  attribute C_Is_Clk_Inverted of BaseX_Byte_I_Tx_Nibble : label is "1'b0";
  attribute C_Is_Rst_Dly_Inverted of BaseX_Byte_I_Tx_Nibble : label is "1'b0";
  attribute C_Is_Rst_Inverted of BaseX_Byte_I_Tx_Nibble : label is "1'b0";
  attribute C_Native_Odelay_Bypass : string;
  attribute C_Native_Odelay_Bypass of BaseX_Byte_I_Tx_Nibble : label is "FALSE";
  attribute C_NibbleType of BaseX_Byte_I_Tx_Nibble : label is 7;
  attribute C_Odly_Vt_Track of BaseX_Byte_I_Tx_Nibble : label is "FALSE";
  attribute C_Output_Phase_90 : string;
  attribute C_Output_Phase_90 of BaseX_Byte_I_Tx_Nibble : label is "TRUE";
  attribute C_Part of BaseX_Byte_I_Tx_Nibble : label is "XCKU060";
  attribute C_Qdly_Vt_Track of BaseX_Byte_I_Tx_Nibble : label is "FALSE";
  attribute C_Read_Idle_Count of BaseX_Byte_I_Tx_Nibble : label is "6'b000000";
  attribute C_RefClk_Frequency of BaseX_Byte_I_Tx_Nibble : label is "1250.000000";
  attribute C_RefClk_Src of BaseX_Byte_I_Tx_Nibble : label is "PLLCLK";
  attribute C_Rounding_Factor of BaseX_Byte_I_Tx_Nibble : label is 16;
  attribute C_RxGate_Extend of BaseX_Byte_I_Tx_Nibble : label is "FALSE";
  attribute C_Rx_Clk_Phase_n of BaseX_Byte_I_Tx_Nibble : label is "SHIFT_0";
  attribute C_Rx_Clk_Phase_p of BaseX_Byte_I_Tx_Nibble : label is "SHIFT_0";
  attribute C_Rx_Gating of BaseX_Byte_I_Tx_Nibble : label is "DISABLE";
  attribute C_Self_Calibrate of BaseX_Byte_I_Tx_Nibble : label is "ENABLE";
  attribute C_Serial_Mode of BaseX_Byte_I_Tx_Nibble : label is "FALSE";
  attribute C_Tx_BtslceTr of BaseX_Byte_I_Tx_Nibble : label is "T";
  attribute C_Tx_Data_Width of BaseX_Byte_I_Tx_Nibble : label is 8;
  attribute C_Tx_Gating of BaseX_Byte_I_Tx_Nibble : label is "ENABLE";
  attribute C_Update_Mode of BaseX_Byte_I_Tx_Nibble : label is "ASYNC";
  attribute C_UsedBitslices of BaseX_Byte_I_Tx_Nibble : label is "7'b0000100";
  attribute box_type : string;
  attribute box_type of \Gen_1.BaseX_Byte_I_Riu_Or_TxHig\ : label is "PRIMITIVE";
begin
  BaseX_Tx_Vtc_Rdy <= \^basex_tx_vtc_rdy\;
BaseX_Byte_I_Rx_Nibble: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Rx_Nibble
     port map (
      Fifo_Empty(5 downto 0) => BaseX_Rx_Fifo_Empty(5 downto 0),
      Fifo_Rd_Clk(5) => BaseX_Rx_Fifo_Rd_Clk,
      Fifo_Rd_Clk(4) => BaseX_Rx_Fifo_Rd_Clk,
      Fifo_Rd_Clk(3) => BaseX_Rx_Fifo_Rd_Clk,
      Fifo_Rd_Clk(2) => BaseX_Rx_Fifo_Rd_Clk,
      Fifo_Rd_Clk(1) => BaseX_Rx_Fifo_Rd_Clk,
      Fifo_Rd_Clk(0) => BaseX_Rx_Fifo_Rd_Clk,
      Fifo_Rd_En(5 downto 0) => BaseX_Rx_Fifo_Rd_En(5 downto 0),
      Fifo_Wrclk_Out => NLW_BaseX_Byte_I_Rx_Nibble_Fifo_Wrclk_Out_UNCONNECTED,
      Rx_Bs_En_Vtc => BaseX_Rx_Bs_En_Vtc,
      Rx_Bs_Rst => BaseX_Rx_Bs_Rst,
      Rx_Bsc_En_Vtc => BaseX_Rx_Bsc_En_Vtc,
      Rx_Bsc_Rst => BaseX_Rx_Bsc_Rst,
      Rx_Ce(5 downto 0) => BaseX_Idly_Ce(5 downto 0),
      Rx_Ce_Ext(5 downto 0) => B"000000",
      Rx_Clk => BaseX_Dly_Clk,
      Rx_Clk_From_Ext => '1',
      Rx_Clk_To_Ext_North => NLW_BaseX_Byte_I_Rx_Nibble_Rx_Clk_To_Ext_North_UNCONNECTED,
      Rx_Clk_To_Ext_South => NLW_BaseX_Byte_I_Rx_Nibble_Rx_Clk_To_Ext_South_UNCONNECTED,
      Rx_CntValueIn(53 downto 0) => BaseX_Idly_CntValueIn(53 downto 0),
      Rx_CntValueIn_Ext(53 downto 0) => B"000000000000000000000000000000000000000000000000000000",
      Rx_CntValueOut(53 downto 0) => BaseX_Idly_CntValueOut(53 downto 0),
      Rx_CntValueOut_Ext(53 downto 0) => NLW_BaseX_Byte_I_Rx_Nibble_Rx_CntValueOut_Ext_UNCONNECTED(53 downto 0),
      Rx_Data_In(5 downto 0) => BaseX_Rx_Data_In(5 downto 0),
      Rx_Dly_Rdy => BaseX_Rx_Dly_Rdy,
      Rx_Dyn_Dci(6 downto 0) => NLW_BaseX_Byte_I_Rx_Nibble_Rx_Dyn_Dci_UNCONNECTED(6 downto 0),
      Rx_Inc(5 downto 0) => BaseX_Idly_Inc(5 downto 0),
      Rx_Inc_Ext(5 downto 0) => B"000000",
      Rx_Load(5 downto 0) => BaseX_Idly_Load(5 downto 0),
      Rx_Load_Ext(5 downto 0) => B"000000",
      Rx_Nclk_Nibble_In => '1',
      Rx_Nclk_Nibble_Out => NLW_BaseX_Byte_I_Rx_Nibble_Rx_Nclk_Nibble_Out_UNCONNECTED,
      Rx_Pclk_Nibble_In => '1',
      Rx_Pclk_Nibble_Out => NLW_BaseX_Byte_I_Rx_Nibble_Rx_Pclk_Nibble_Out_UNCONNECTED,
      Rx_Phy_Rden(3 downto 0) => BaseX_Rx_Phy_Rden(3 downto 0),
      Rx_Pll_Clk => BaseX_Rx_Pll_Clk,
      Rx_Q_CombOut(5 downto 0) => BaseX_Rx_Q_CombOut(5 downto 0),
      Rx_Q_Out(23 downto 0) => BaseX_Rx_Q_Out(23 downto 0),
      Rx_RefClk => '0',
      Rx_Riu_Addr(5 downto 0) => BaseX_Riu_Addr(5 downto 0),
      Rx_Riu_Clk => BaseX_Riu_Clk,
      Rx_Riu_Nibble_Sel => BaseX_Riu_Nibble_Sel(0),
      Rx_Riu_Prsnt => BaseX_Riu_Prsnt,
      Rx_Riu_Rd_Data(15 downto 0) => IntRx_Riu_Rd_Data(15 downto 0),
      Rx_Riu_Valid => IntRx_Riu_Valid,
      Rx_Riu_Wr_Data(15 downto 0) => BaseX_Riu_Wr_Data(15 downto 0),
      Rx_Riu_Wr_En => BaseX_Riu_Wr_En,
      Rx_Rst_Dly => BaseX_Rx_Rst_Dly,
      Rx_Tbyte_In(3 downto 0) => B"0000",
      Rx_Vtc_Rdy => BaseX_Rx_Vtc_Rdy
    );
BaseX_Byte_I_Tx_Nibble: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Tx_Nibble
     port map (
      TxTri_Ce => BaseX_TriOdly_Ce,
      TxTri_Clk => BaseX_Dly_Clk,
      TxTri_CntValueIn(8 downto 0) => BaseX_TriOdly_CntValueIn(8 downto 0),
      TxTri_CntValueOut(8 downto 0) => BaseX_TriOdly_CntValueOut(8 downto 0),
      TxTri_Inc => BaseX_TriOdly_Inc,
      TxTri_Load => BaseX_TriOdly_Load,
      Tx_Bs_En_Vtc => BaseX_Tx_Bs_En_Vtc,
      Tx_Bs_Rst => BaseX_Tx_Bs_Rst,
      Tx_Bsc_En_Vtc => BaseX_Tx_Bsc_En_Vtc,
      Tx_Bsc_Rst => BaseX_Tx_Bsc_Rst,
      Tx_Ce(6 downto 0) => BaseX_Odly_Ce(6 downto 0),
      Tx_Clk => BaseX_Dly_Clk,
      Tx_Clk_From_Ext => '1',
      Tx_Clk_To_Ext_North => NLW_BaseX_Byte_I_Tx_Nibble_Tx_Clk_To_Ext_North_UNCONNECTED,
      Tx_Clk_To_Ext_South => NLW_BaseX_Byte_I_Tx_Nibble_Tx_Clk_To_Ext_South_UNCONNECTED,
      Tx_CntValueIn(62 downto 0) => BaseX_Odly_CntValueIn(62 downto 0),
      Tx_CntValueOut(62 downto 0) => BaseX_Odly_CntValueOut(62 downto 0),
      Tx_D_In(55 downto 0) => BaseX_Tx_D_In(55 downto 0),
      Tx_Data_Out(6 downto 0) => BaseX_Tx_Data_Out(6 downto 0),
      Tx_Dly_Rdy => BaseX_Tx_Dly_Rdy,
      Tx_Dyn_Dci(6 downto 0) => NLW_BaseX_Byte_I_Tx_Nibble_Tx_Dyn_Dci_UNCONNECTED(6 downto 0),
      Tx_Inc(6 downto 0) => BaseX_Odly_Inc(6 downto 0),
      Tx_Load(6 downto 0) => BaseX_Odly_Load(6 downto 0),
      Tx_Nclk_Nibble_In => '1',
      Tx_Nclk_Nibble_Out => NLW_BaseX_Byte_I_Tx_Nibble_Tx_Nclk_Nibble_Out_UNCONNECTED,
      Tx_Pclk_Nibble_In => '1',
      Tx_Pclk_Nibble_Out => NLW_BaseX_Byte_I_Tx_Nibble_Tx_Pclk_Nibble_Out_UNCONNECTED,
      Tx_Phy_Rden(3 downto 0) => BaseX_Tx_Phy_Rden(3 downto 0),
      Tx_Pll_Clk => BaseX_Tx_Pll_Clk,
      Tx_RefClk => '0',
      Tx_Riu_Addr(5 downto 0) => BaseX_Riu_Addr(5 downto 0),
      Tx_Riu_Clk => BaseX_Riu_Clk,
      Tx_Riu_Nibble_Sel => BaseX_Riu_Nibble_Sel(1),
      Tx_Riu_Rd_Data(15 downto 0) => IntTx_Riu_Rd_Data(15 downto 0),
      Tx_Riu_Valid => IntTx_Riu_Valid,
      Tx_Riu_Wr_Data(15 downto 0) => BaseX_Riu_Wr_Data(15 downto 0),
      Tx_Riu_Wr_En => BaseX_Riu_Wr_En,
      Tx_Rst_Dly => BaseX_Tx_Rst_Dly,
      Tx_T_In(6 downto 0) => BaseX_Tx_T_In(6 downto 0),
      Tx_Tbyte_In(3) => IntActTx_TByteinPip(1),
      Tx_Tbyte_In(2) => IntActTx_TByteinPip(1),
      Tx_Tbyte_In(1) => IntActTx_TByteinPip(1),
      Tx_Tbyte_In(0) => IntActTx_TByteinPip(1),
      Tx_Tri_Out(6 downto 0) => BaseX_Tx_Tri_Out(6 downto 0),
      Tx_Vtc_Rdy => \^basex_tx_vtc_rdy\
    );
\Gen_1.BaseX_Byte_I_Riu_Or_TxHig\: unisim.vcomponents.RIU_OR
    generic map(
      SIM_DEVICE => "ULTRASCALE_PLUS_ES1",
      SIM_VERSION => 2.000000
    )
        port map (
      RIU_RD_DATA(15 downto 0) => BaseX_Riu_Rd_Data(15 downto 0),
      RIU_RD_DATA_LOW(15 downto 0) => IntRx_Riu_Rd_Data(15 downto 0),
      RIU_RD_DATA_UPP(15 downto 0) => IntTx_Riu_Rd_Data(15 downto 0),
      RIU_RD_VALID => BaseX_Riu_Valid,
      RIU_RD_VALID_LOW => IntRx_Riu_Valid,
      RIU_RD_VALID_UPP => IntTx_Riu_Valid
    );
\IntActTx_TByteinPip_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => Tx_RdClk,
      CE => '1',
      CLR => BaseX_Tx_Bsc_Rst,
      D => \^basex_tx_vtc_rdy\,
      Q => p_0_in(1)
    );
\IntActTx_TByteinPip_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => Tx_RdClk,
      CE => '1',
      CLR => BaseX_Tx_Bsc_Rst,
      D => p_0_in(1),
      Q => IntActTx_TByteinPip(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Clock_Reset is
  port (
    ClockIn_p : in STD_LOGIC;
    ClockIn_n : in STD_LOGIC;
    ClockIn_se_out : out STD_LOGIC;
    ResetIn : in STD_LOGIC;
    Tx_Dly_Rdy : in STD_LOGIC;
    Tx_Vtc_Rdy : in STD_LOGIC;
    Tx_Bsc_EnVtc : out STD_LOGIC;
    Tx_Bs_EnVtc : out STD_LOGIC;
    Rx_Dly_Rdy : in STD_LOGIC;
    Rx_Vtc_Rdy : in STD_LOGIC;
    Rx_Bsc_EnVtc : out STD_LOGIC;
    Rx_Bs_EnVtc : out STD_LOGIC;
    Tx_SysClk : out STD_LOGIC;
    Tx_WrClk : out STD_LOGIC;
    Tx_ClkOutPhy : out STD_LOGIC;
    Rx_SysClk : out STD_LOGIC;
    Rx_RiuClk : out STD_LOGIC;
    Rx_ClkOutPhy : out STD_LOGIC;
    Tx_Locked : out STD_LOGIC;
    Tx_Bs_RstDly : out STD_LOGIC;
    Tx_Bs_Rst : out STD_LOGIC;
    Tx_Bsc_Rst : out STD_LOGIC;
    Tx_LogicRst : out STD_LOGIC;
    Rx_Locked : out STD_LOGIC;
    Rx_Bs_RstDly : out STD_LOGIC;
    Rx_Bs_Rst : out STD_LOGIC;
    Rx_Bsc_Rst : out STD_LOGIC;
    Rx_LogicRst : out STD_LOGIC;
    Riu_Addr : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Riu_WrData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Riu_Wr_En : out STD_LOGIC;
    Riu_Nibble_Sel : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Riu_RdData_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Riu_Valid_3 : in STD_LOGIC;
    Riu_Prsnt_3 : in STD_LOGIC;
    Riu_RdData_2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Riu_Valid_2 : in STD_LOGIC;
    Riu_Prsnt_2 : in STD_LOGIC;
    Riu_RdData_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Riu_Valid_1 : in STD_LOGIC;
    Riu_Prsnt_1 : in STD_LOGIC;
    Riu_RdData_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Riu_Valid_0 : in STD_LOGIC;
    Riu_Prsnt_0 : in STD_LOGIC;
    Rx_BtVal_3 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    Rx_BtVal_2 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    Rx_BtVal_1 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    Rx_BtVal_0 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    Debug_Out : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute C_IoBank : integer;
  attribute C_IoBank of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Clock_Reset : entity is 44;
  attribute C_Part : string;
  attribute C_Part of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Clock_Reset : entity is "XCKU060";
  attribute EXAMPLE_SIMULATION : integer;
  attribute EXAMPLE_SIMULATION of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Clock_Reset : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Clock_Reset : entity is "gig_ethernet_pcs_pma_0_Clock_Reset";
  attribute dont_touch : string;
  attribute dont_touch of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Clock_Reset : entity is "yes";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Clock_Reset;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Clock_Reset is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal CLKOUTPHYEN : STD_LOGIC;
  signal \^clockin_se_out\ : STD_LOGIC;
  signal \^debug_out\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal IntCtrl_Reset : STD_LOGIC;
  signal IntCtrl_RxDlyRdy : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of IntCtrl_RxDlyRdy : signal is "true";
  signal IntCtrl_RxLocked : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of IntCtrl_RxLocked : signal is "true";
  signal IntCtrl_RxLogicRst : STD_LOGIC;
  signal IntCtrl_RxLogicRst_i_1_n_0 : STD_LOGIC;
  signal IntCtrl_RxLogicRst_reg_n_0 : STD_LOGIC;
  signal IntCtrl_RxPllClkOutPhyEn_i_1_n_0 : STD_LOGIC;
  signal IntCtrl_RxPllClkOutPhyEn_i_2_n_0 : STD_LOGIC;
  signal IntCtrl_RxPllClkOutPhyEn_i_3_n_0 : STD_LOGIC;
  signal IntCtrl_RxPllClkOutPhyEn_reg_n_0 : STD_LOGIC;
  signal IntCtrl_RxVtcRdy : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of IntCtrl_RxVtcRdy : signal is "true";
  signal IntCtrl_State : STD_LOGIC;
  signal IntCtrl_State06_out : STD_LOGIC;
  signal \IntCtrl_State[0]_i_1_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[1]_i_1_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[2]_i_1_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[3]_i_1_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[4]_i_1_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[5]_i_1_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[5]_i_2_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[6]_i_1_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[7]_i_10_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[7]_i_2_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[7]_i_3_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[7]_i_4_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[7]_i_5_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[7]_i_6_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[7]_i_7_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[7]_i_8_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[7]_i_9_n_0\ : STD_LOGIC;
  signal \IntCtrl_State[8]_i_1_n_0\ : STD_LOGIC;
  signal \IntCtrl_State_reg_n_0_[8]\ : STD_LOGIC;
  signal IntCtrl_TxDlyRdy : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of IntCtrl_TxDlyRdy : signal is "true";
  signal IntCtrl_TxLocked : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of IntCtrl_TxLocked : signal is "true";
  signal IntCtrl_TxLogicRst_i_1_n_0 : STD_LOGIC;
  signal IntCtrl_TxLogicRst_reg_n_0 : STD_LOGIC;
  signal IntCtrl_TxPllClkOutPhyEn_i_1_n_0 : STD_LOGIC;
  signal IntCtrl_TxPllClkOutPhyEn_i_2_n_0 : STD_LOGIC;
  signal IntCtrl_TxPllClkOutPhyEn_i_3_n_0 : STD_LOGIC;
  signal IntCtrl_TxPllRst : STD_LOGIC;
  signal IntCtrl_TxPllRst_i_1_n_0 : STD_LOGIC;
  signal IntCtrl_TxVtcRdy : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of IntCtrl_TxVtcRdy : signal is "true";
  signal IntRx_ClkOut0 : STD_LOGIC;
  signal IntTx_ClkOut0 : STD_LOGIC;
  signal IntTx_ClkOut1 : STD_LOGIC;
  signal RST : STD_LOGIC;
  signal \^riu_addr\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal Riu_Addr0_in : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \Riu_Addr[0]_i_2_n_0\ : STD_LOGIC;
  signal \Riu_Addr[0]_i_3_n_0\ : STD_LOGIC;
  signal \Riu_Addr[1]_i_2_n_0\ : STD_LOGIC;
  signal \Riu_Addr[5]_i_10_n_0\ : STD_LOGIC;
  signal \Riu_Addr[5]_i_11_n_0\ : STD_LOGIC;
  signal \Riu_Addr[5]_i_12_n_0\ : STD_LOGIC;
  signal \Riu_Addr[5]_i_1_n_0\ : STD_LOGIC;
  signal \Riu_Addr[5]_i_3_n_0\ : STD_LOGIC;
  signal \Riu_Addr[5]_i_4_n_0\ : STD_LOGIC;
  signal \Riu_Addr[5]_i_5_n_0\ : STD_LOGIC;
  signal \Riu_Addr[5]_i_6_n_0\ : STD_LOGIC;
  signal \Riu_Addr[5]_i_7_n_0\ : STD_LOGIC;
  signal \Riu_Addr[5]_i_8_n_0\ : STD_LOGIC;
  signal \Riu_Addr[5]_i_9_n_0\ : STD_LOGIC;
  signal \^riu_nibble_sel\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \Riu_Nibble_Sel[0]_i_1_n_0\ : STD_LOGIC;
  signal \Riu_WrData[3]_i_1_n_0\ : STD_LOGIC;
  signal \^riu_wr_en\ : STD_LOGIC;
  signal \^rx_bs_envtc\ : STD_LOGIC;
  signal Rx_Bs_EnVtc_i_1_n_0 : STD_LOGIC;
  signal Rx_Bs_EnVtc_i_2_n_0 : STD_LOGIC;
  signal Rx_Bs_EnVtc_i_3_n_0 : STD_LOGIC;
  signal Rx_Bs_EnVtc_i_4_n_0 : STD_LOGIC;
  signal Rx_Bs_EnVtc_i_5_n_0 : STD_LOGIC;
  signal \^rx_bs_rst\ : STD_LOGIC;
  signal \^rx_bs_rstdly\ : STD_LOGIC;
  signal Rx_Bs_Rst_i_1_n_0 : STD_LOGIC;
  signal Rx_Bs_Rst_i_2_n_0 : STD_LOGIC;
  signal Rx_Bs_Rst_i_3_n_0 : STD_LOGIC;
  signal Rx_Bs_Rst_i_4_n_0 : STD_LOGIC;
  signal \^rx_bsc_rst\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_10_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_11_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_12_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_13_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_14_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_15_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_16_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_17_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_18_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_19_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_1_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_20_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_2_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_3_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_4_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_5_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_6_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_7_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_8_n_0\ : STD_LOGIC;
  signal \Rx_BtVal_3[8]_i_9_n_0\ : STD_LOGIC;
  signal \^rx_locked\ : STD_LOGIC;
  signal \^rx_riuclk\ : STD_LOGIC;
  signal \^rx_sysclk\ : STD_LOGIC;
  signal \^tx_bs_rst\ : STD_LOGIC;
  signal Tx_Bs_RstDly_i_1_n_0 : STD_LOGIC;
  signal Tx_Bs_RstDly_i_2_n_0 : STD_LOGIC;
  signal Tx_Bs_Rst_i_1_n_0 : STD_LOGIC;
  signal \^tx_bsc_envtc\ : STD_LOGIC;
  signal Tx_Bsc_EnVtc_i_1_n_0 : STD_LOGIC;
  signal Tx_Bsc_EnVtc_i_3_n_0 : STD_LOGIC;
  signal Tx_Bsc_EnVtc_i_4_n_0 : STD_LOGIC;
  signal Tx_Bsc_EnVtc_i_5_n_0 : STD_LOGIC;
  signal \Tx_Bsc_Rst__0\ : STD_LOGIC;
  signal Tx_Bsc_Rst_i_1_n_0 : STD_LOGIC;
  signal Tx_Bsc_Rst_i_3_n_0 : STD_LOGIC;
  signal \^tx_locked\ : STD_LOGIC;
  signal \^tx_wrclk\ : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Rx_CLKFBIN_UNCONNECTED : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Rx_CLKFBOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Rx_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Rx_CLKOUT1_UNCONNECTED : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Rx_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Rx_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Rx_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_Clk_Rst_I_Plle3_Tx_CLKFBIN_UNCONNECTED : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Tx_CLKFBOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Tx_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Tx_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Tx_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_Clk_Rst_I_Plle3_Tx_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute box_type : string;
  attribute box_type of Bufg_CtrlClk : label is "PRIMITIVE";
  attribute box_type of Clk_Rst_I_Bufg_RxSysClk : label is "PRIMITIVE";
  attribute box_type of Clk_Rst_I_Bufg_TxSysClk : label is "PRIMITIVE";
  attribute box_type of Clk_Rst_I_Bufg_TxWrClk : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of Clk_Rst_I_Plle3_Rx : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of Clk_Rst_I_Plle3_Rx : label is "PLLE3_ADV";
  attribute box_type of Clk_Rst_I_Plle3_Rx : label is "PRIMITIVE";
  attribute OPT_MODIFIED of Clk_Rst_I_Plle3_Tx : label is "MLO";
  attribute XILINX_LEGACY_PRIM of Clk_Rst_I_Plle3_Tx : label is "PLLE3_ADV";
  attribute box_type of Clk_Rst_I_Plle3_Tx : label is "PRIMITIVE";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \IntCtrl_RxDlyRdy_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \IntCtrl_RxDlyRdy_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \IntCtrl_RxDlyRdy_reg[1]\ : label is std.standard.true;
  attribute KEEP of \IntCtrl_RxDlyRdy_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \IntCtrl_RxLocked_reg[0]\ : label is std.standard.true;
  attribute KEEP of \IntCtrl_RxLocked_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \IntCtrl_RxLocked_reg[1]\ : label is std.standard.true;
  attribute KEEP of \IntCtrl_RxLocked_reg[1]\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of IntCtrl_RxPllClkOutPhyEn_i_2 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of IntCtrl_RxPllClkOutPhyEn_i_3 : label is "soft_lutpair2";
  attribute ASYNC_REG_boolean of \IntCtrl_RxVtcRdy_reg[0]\ : label is std.standard.true;
  attribute KEEP of \IntCtrl_RxVtcRdy_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \IntCtrl_RxVtcRdy_reg[1]\ : label is std.standard.true;
  attribute KEEP of \IntCtrl_RxVtcRdy_reg[1]\ : label is "yes";
  attribute SOFT_HLUTNM of \IntCtrl_State[1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \IntCtrl_State[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \IntCtrl_State[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \IntCtrl_State[5]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \IntCtrl_State[7]_i_4\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \IntCtrl_State[7]_i_5\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \IntCtrl_State[7]_i_7\ : label is "soft_lutpair3";
  attribute ASYNC_REG_boolean of \IntCtrl_TxDlyRdy_reg[0]\ : label is std.standard.true;
  attribute KEEP of \IntCtrl_TxDlyRdy_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \IntCtrl_TxDlyRdy_reg[1]\ : label is std.standard.true;
  attribute KEEP of \IntCtrl_TxDlyRdy_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \IntCtrl_TxLocked_reg[0]\ : label is std.standard.true;
  attribute KEEP of \IntCtrl_TxLocked_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \IntCtrl_TxLocked_reg[1]\ : label is std.standard.true;
  attribute KEEP of \IntCtrl_TxLocked_reg[1]\ : label is "yes";
  attribute SOFT_HLUTNM of IntCtrl_TxLogicRst_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of IntCtrl_TxPllClkOutPhyEn_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of IntCtrl_TxPllClkOutPhyEn_i_3 : label is "soft_lutpair9";
  attribute ASYNC_REG_boolean of \IntCtrl_TxVtcRdy_reg[0]\ : label is std.standard.true;
  attribute KEEP of \IntCtrl_TxVtcRdy_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \IntCtrl_TxVtcRdy_reg[1]\ : label is std.standard.true;
  attribute KEEP of \IntCtrl_TxVtcRdy_reg[1]\ : label is "yes";
  attribute SOFT_HLUTNM of \Riu_Addr[0]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \Riu_Addr[0]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \Riu_Addr[1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \Riu_Addr[5]_i_11\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \Riu_Addr[5]_i_12\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \Riu_Addr[5]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \Riu_Addr[5]_i_4\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \Riu_Addr[5]_i_5\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Riu_Addr[5]_i_7\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \Riu_Nibble_Sel[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \Riu_WrData[3]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of Rx_Bs_EnVtc_i_1 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of Rx_Bs_Rst_i_2 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of Rx_Bs_Rst_i_4 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of Tx_Bs_RstDly_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of Tx_Bs_Rst_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of Tx_Bsc_EnVtc_i_3 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of Tx_Bsc_EnVtc_i_4 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of Tx_Bsc_EnVtc_i_5 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of Tx_Bsc_Rst_i_3 : label is "soft_lutpair5";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of iclkbuf : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of iclkbuf : label is "0";
  attribute XILINX_LEGACY_PRIM of iclkbuf : label is "IBUFGDS";
  attribute box_type of iclkbuf : label is "PRIMITIVE";
begin
  ClockIn_se_out <= \^clockin_se_out\;
  Debug_Out(7 downto 0) <= \^debug_out\(7 downto 0);
  Riu_Addr(5) <= \^riu_addr\(4);
  Riu_Addr(4) <= \^riu_addr\(4);
  Riu_Addr(3) <= \^riu_addr\(4);
  Riu_Addr(2) <= \<const0>\;
  Riu_Addr(1 downto 0) <= \^riu_addr\(1 downto 0);
  Riu_Nibble_Sel(1) <= \<const0>\;
  Riu_Nibble_Sel(0) <= \^riu_nibble_sel\(0);
  Riu_WrData(15) <= \<const0>\;
  Riu_WrData(14) <= \<const0>\;
  Riu_WrData(13) <= \<const0>\;
  Riu_WrData(12) <= \<const0>\;
  Riu_WrData(11) <= \<const0>\;
  Riu_WrData(10) <= \<const0>\;
  Riu_WrData(9) <= \<const0>\;
  Riu_WrData(8) <= \<const0>\;
  Riu_WrData(7) <= \<const0>\;
  Riu_WrData(6) <= \<const0>\;
  Riu_WrData(5) <= \<const0>\;
  Riu_WrData(4) <= \<const0>\;
  Riu_WrData(3) <= \^riu_wr_en\;
  Riu_WrData(2) <= \^riu_wr_en\;
  Riu_WrData(1) <= \<const0>\;
  Riu_WrData(0) <= \<const0>\;
  Riu_Wr_En <= \^riu_wr_en\;
  Rx_Bs_EnVtc <= \^rx_bs_envtc\;
  Rx_Bs_Rst <= \^rx_bs_rst\;
  Rx_Bs_RstDly <= \^rx_bs_rstdly\;
  Rx_Bsc_EnVtc <= \<const0>\;
  Rx_Bsc_Rst <= \^rx_bsc_rst\;
  Rx_Locked <= \^rx_locked\;
  Rx_RiuClk <= \^rx_riuclk\;
  Rx_SysClk <= \^rx_sysclk\;
  Tx_Bs_EnVtc <= \<const1>\;
  Tx_Bs_Rst <= \^tx_bs_rst\;
  Tx_Bs_RstDly <= \^rx_bs_rstdly\;
  Tx_Bsc_EnVtc <= \^tx_bsc_envtc\;
  Tx_Bsc_Rst <= \^rx_bsc_rst\;
  Tx_Locked <= \^tx_locked\;
  Tx_WrClk <= \^tx_wrclk\;
Bufg_CtrlClk: unisim.vcomponents.BUFGCE_DIV
    generic map(
      BUFGCE_DIVIDE => 4,
      CE_TYPE => "SYNC",
      HARDSYNC_CLR => "FALSE",
      IS_CE_INVERTED => '0',
      IS_CLR_INVERTED => '0',
      IS_I_INVERTED => '0',
      SIM_DEVICE => "ULTRASCALE",
      STARTUP_SYNC => "FALSE"
    )
        port map (
      CE => '1',
      CLR => '0',
      I => \^clockin_se_out\,
      O => \^rx_riuclk\
    );
Clk_Rst_I_Bufg_RxSysClk: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "SYNC",
      IS_CE_INVERTED => '0',
      IS_I_INVERTED => '0',
      SIM_DEVICE => "ULTRASCALE",
      STARTUP_SYNC => "FALSE"
    )
        port map (
      CE => \^rx_locked\,
      I => IntRx_ClkOut0,
      O => \^rx_sysclk\
    );
Clk_Rst_I_Bufg_TxSysClk: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "SYNC",
      IS_CE_INVERTED => '0',
      IS_I_INVERTED => '0',
      SIM_DEVICE => "ULTRASCALE",
      STARTUP_SYNC => "FALSE"
    )
        port map (
      CE => \^tx_locked\,
      I => IntTx_ClkOut0,
      O => Tx_SysClk
    );
Clk_Rst_I_Bufg_TxWrClk: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "SYNC",
      IS_CE_INVERTED => '0',
      IS_I_INVERTED => '0',
      SIM_DEVICE => "ULTRASCALE",
      STARTUP_SYNC => "FALSE"
    )
        port map (
      CE => \^tx_locked\,
      I => IntTx_ClkOut1,
      O => \^tx_wrclk\
    );
Clk_Rst_I_Plle3_Rx: unisim.vcomponents.PLLE4_ADV
    generic map(
      CLKFBOUT_MULT => 2,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN_PERIOD => 1.600000,
      CLKOUT0_DIVIDE => 4,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 8,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUTPHY_MODE => "VCO_HALF",
      COMPENSATION => "INTERNAL",
      DIVCLK_DIVIDE => 1,
      IS_CLKFBIN_INVERTED => '0',
      IS_CLKIN_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER => 0.010000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CLKFBIN => NLW_Clk_Rst_I_Plle3_Rx_CLKFBIN_UNCONNECTED,
      CLKFBOUT => NLW_Clk_Rst_I_Plle3_Rx_CLKFBOUT_UNCONNECTED,
      CLKIN => \^clockin_se_out\,
      CLKOUT0 => IntRx_ClkOut0,
      CLKOUT0B => NLW_Clk_Rst_I_Plle3_Rx_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => NLW_Clk_Rst_I_Plle3_Rx_CLKOUT1_UNCONNECTED,
      CLKOUT1B => NLW_Clk_Rst_I_Plle3_Rx_CLKOUT1B_UNCONNECTED,
      CLKOUTPHY => Rx_ClkOutPhy,
      CLKOUTPHYEN => IntCtrl_RxPllClkOutPhyEn_reg_n_0,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_Clk_Rst_I_Plle3_Rx_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_Clk_Rst_I_Plle3_Rx_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => \^rx_locked\,
      PWRDWN => '0',
      RST => ResetIn
    );
Clk_Rst_I_Plle3_Tx: unisim.vcomponents.PLLE4_ADV
    generic map(
      CLKFBOUT_MULT => 2,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN_PERIOD => 1.600000,
      CLKOUT0_DIVIDE => 8,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 10,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUTPHY_MODE => "VCO",
      COMPENSATION => "INTERNAL",
      DIVCLK_DIVIDE => 1,
      IS_CLKFBIN_INVERTED => '0',
      IS_CLKIN_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER => 0.010000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CLKFBIN => NLW_Clk_Rst_I_Plle3_Tx_CLKFBIN_UNCONNECTED,
      CLKFBOUT => NLW_Clk_Rst_I_Plle3_Tx_CLKFBOUT_UNCONNECTED,
      CLKIN => \^clockin_se_out\,
      CLKOUT0 => IntTx_ClkOut0,
      CLKOUT0B => NLW_Clk_Rst_I_Plle3_Tx_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => IntTx_ClkOut1,
      CLKOUT1B => NLW_Clk_Rst_I_Plle3_Tx_CLKOUT1B_UNCONNECTED,
      CLKOUTPHY => Tx_ClkOutPhy,
      CLKOUTPHYEN => CLKOUTPHYEN,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_Clk_Rst_I_Plle3_Tx_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_Clk_Rst_I_Plle3_Tx_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => \^tx_locked\,
      PWRDWN => '0',
      RST => RST
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\IntCtrl_RxDlyRdy_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => Rx_Dly_Rdy,
      Q => IntCtrl_RxDlyRdy(0),
      R => '0'
    );
\IntCtrl_RxDlyRdy_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => IntCtrl_RxDlyRdy(0),
      Q => IntCtrl_RxDlyRdy(1),
      R => '0'
    );
\IntCtrl_RxLocked_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => \^rx_locked\,
      Q => IntCtrl_RxLocked(0),
      R => '0'
    );
\IntCtrl_RxLocked_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => IntCtrl_RxLocked(0),
      Q => IntCtrl_RxLocked(1),
      R => '0'
    );
IntCtrl_RxLogicRst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IntCtrl_RxLogicRst_reg_n_0,
      I1 => IntCtrl_RxLogicRst,
      O => IntCtrl_RxLogicRst_i_1_n_0
    );
IntCtrl_RxLogicRst_reg: unisim.vcomponents.FDSE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => IntCtrl_RxLogicRst_i_1_n_0,
      Q => IntCtrl_RxLogicRst_reg_n_0,
      S => IntCtrl_Reset
    );
IntCtrl_RxPllClkOutPhyEn_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFFB000"
    )
        port map (
      I0 => \IntCtrl_State_reg_n_0_[8]\,
      I1 => \^debug_out\(4),
      I2 => IntCtrl_RxPllClkOutPhyEn_i_2_n_0,
      I3 => IntCtrl_RxPllClkOutPhyEn_i_3_n_0,
      I4 => IntCtrl_RxPllClkOutPhyEn_reg_n_0,
      O => IntCtrl_RxPllClkOutPhyEn_i_1_n_0
    );
IntCtrl_RxPllClkOutPhyEn_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000018"
    )
        port map (
      I0 => \IntCtrl_State_reg_n_0_[8]\,
      I1 => \^debug_out\(6),
      I2 => \^debug_out\(7),
      I3 => \^debug_out\(0),
      I4 => \^debug_out\(1),
      O => IntCtrl_RxPllClkOutPhyEn_i_2_n_0
    );
IntCtrl_RxPllClkOutPhyEn_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0000001"
    )
        port map (
      I0 => \^debug_out\(6),
      I1 => \^debug_out\(2),
      I2 => \^debug_out\(3),
      I3 => \^debug_out\(5),
      I4 => \^debug_out\(4),
      O => IntCtrl_RxPllClkOutPhyEn_i_3_n_0
    );
IntCtrl_RxPllClkOutPhyEn_reg: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => IntCtrl_RxPllClkOutPhyEn_i_1_n_0,
      Q => IntCtrl_RxPllClkOutPhyEn_reg_n_0,
      R => IntCtrl_Reset
    );
\IntCtrl_RxVtcRdy_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => Rx_Vtc_Rdy,
      Q => IntCtrl_RxVtcRdy(0),
      R => '0'
    );
\IntCtrl_RxVtcRdy_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => IntCtrl_RxVtcRdy(0),
      Q => IntCtrl_RxVtcRdy(1),
      R => '0'
    );
\IntCtrl_State[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => IntCtrl_RxLogicRst,
      I1 => \^debug_out\(0),
      O => \IntCtrl_State[0]_i_1_n_0\
    );
\IntCtrl_State[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F6"
    )
        port map (
      I0 => \^debug_out\(1),
      I1 => \^debug_out\(0),
      I2 => IntCtrl_RxLogicRst,
      O => \IntCtrl_State[1]_i_1_n_0\
    );
\IntCtrl_State[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF6A"
    )
        port map (
      I0 => \^debug_out\(2),
      I1 => \^debug_out\(1),
      I2 => \^debug_out\(0),
      I3 => IntCtrl_RxLogicRst,
      O => \IntCtrl_State[2]_i_1_n_0\
    );
\IntCtrl_State[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7F8FFF0"
    )
        port map (
      I0 => \^debug_out\(0),
      I1 => \^debug_out\(1),
      I2 => IntCtrl_RxLogicRst,
      I3 => \^debug_out\(3),
      I4 => \^debug_out\(2),
      O => \IntCtrl_State[3]_i_1_n_0\
    );
\IntCtrl_State[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF6AAAAAAA"
    )
        port map (
      I0 => \^debug_out\(4),
      I1 => \^debug_out\(2),
      I2 => \^debug_out\(3),
      I3 => \^debug_out\(0),
      I4 => \^debug_out\(1),
      I5 => IntCtrl_RxLogicRst,
      O => \IntCtrl_State[4]_i_1_n_0\
    );
\IntCtrl_State[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFA6AAAAAA"
    )
        port map (
      I0 => \^debug_out\(5),
      I1 => \^debug_out\(4),
      I2 => \IntCtrl_State[5]_i_2_n_0\,
      I3 => \^debug_out\(3),
      I4 => \^debug_out\(2),
      I5 => IntCtrl_RxLogicRst,
      O => \IntCtrl_State[5]_i_1_n_0\
    );
\IntCtrl_State[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^debug_out\(1),
      I1 => \^debug_out\(0),
      O => \IntCtrl_State[5]_i_2_n_0\
    );
\IntCtrl_State[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \^debug_out\(5),
      I1 => \^debug_out\(7),
      I2 => \^debug_out\(6),
      I3 => \^debug_out\(4),
      I4 => \IntCtrl_State_reg_n_0_[8]\,
      I5 => \IntCtrl_State[7]_i_7_n_0\,
      O => IntCtrl_RxLogicRst
    );
\IntCtrl_State[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EF50AF50FF00FF00"
    )
        port map (
      I0 => \IntCtrl_State[7]_i_7_n_0\,
      I1 => \IntCtrl_State_reg_n_0_[8]\,
      I2 => \^debug_out\(4),
      I3 => \^debug_out\(6),
      I4 => \^debug_out\(7),
      I5 => \^debug_out\(5),
      O => \IntCtrl_State[6]_i_1_n_0\
    );
\IntCtrl_State[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEEEEEFEE"
    )
        port map (
      I0 => \IntCtrl_State[7]_i_3_n_0\,
      I1 => \IntCtrl_State[7]_i_4_n_0\,
      I2 => \Rx_BtVal_3[8]_i_4_n_0\,
      I3 => \IntCtrl_State[7]_i_5_n_0\,
      I4 => \Rx_BtVal_3[8]_i_2_n_0\,
      I5 => \IntCtrl_State[7]_i_6_n_0\,
      O => IntCtrl_State
    );
\IntCtrl_State[7]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA2222AFAA2222"
    )
        port map (
      I0 => \^debug_out\(1),
      I1 => \^debug_out\(0),
      I2 => Rx_Bs_EnVtc_i_4_n_0,
      I3 => \^debug_out\(4),
      I4 => \^debug_out\(2),
      I5 => Rx_Bs_EnVtc_i_5_n_0,
      O => \IntCtrl_State[7]_i_10_n_0\
    );
\IntCtrl_State[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFF5000FFFF0000"
    )
        port map (
      I0 => \IntCtrl_State[7]_i_7_n_0\,
      I1 => \IntCtrl_State_reg_n_0_[8]\,
      I2 => \^debug_out\(4),
      I3 => \^debug_out\(6),
      I4 => \^debug_out\(7),
      I5 => \^debug_out\(5),
      O => \IntCtrl_State[7]_i_2_n_0\
    );
\IntCtrl_State[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAABA"
    )
        port map (
      I0 => \IntCtrl_State[7]_i_8_n_0\,
      I1 => \^debug_out\(2),
      I2 => \^debug_out\(0),
      I3 => \^debug_out\(1),
      I4 => \IntCtrl_State[7]_i_9_n_0\,
      I5 => \IntCtrl_State[7]_i_10_n_0\,
      O => \IntCtrl_State[7]_i_3_n_0\
    );
\IntCtrl_State[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"007F"
    )
        port map (
      I0 => \^debug_out\(5),
      I1 => \^debug_out\(3),
      I2 => \^debug_out\(2),
      I3 => \^debug_out\(4),
      O => \IntCtrl_State[7]_i_4_n_0\
    );
\IntCtrl_State[7]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^debug_out\(2),
      I1 => \^debug_out\(3),
      I2 => \^debug_out\(5),
      O => \IntCtrl_State[7]_i_5_n_0\
    );
\IntCtrl_State[7]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8F808080"
    )
        port map (
      I0 => \^debug_out\(3),
      I1 => \^debug_out\(2),
      I2 => \^debug_out\(4),
      I3 => IntCtrl_TxDlyRdy(1),
      I4 => IntCtrl_RxDlyRdy(1),
      O => \IntCtrl_State[7]_i_6_n_0\
    );
\IntCtrl_State[7]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^debug_out\(2),
      I1 => \^debug_out\(3),
      I2 => \^debug_out\(0),
      I3 => \^debug_out\(1),
      O => \IntCtrl_State[7]_i_7_n_0\
    );
\IntCtrl_State[7]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CC3C3CEE"
    )
        port map (
      I0 => IntCtrl_TxVtcRdy(1),
      I1 => \^debug_out\(0),
      I2 => \^debug_out\(5),
      I3 => \^debug_out\(2),
      I4 => \^debug_out\(3),
      O => \IntCtrl_State[7]_i_8_n_0\
    );
\IntCtrl_State[7]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDFFDDEFDDEFDDEF"
    )
        port map (
      I0 => \^debug_out\(5),
      I1 => \Riu_Addr[0]_i_3_n_0\,
      I2 => \^debug_out\(3),
      I3 => \^debug_out\(7),
      I4 => IntCtrl_RxLocked(1),
      I5 => IntCtrl_TxLocked(1),
      O => \IntCtrl_State[7]_i_9_n_0\
    );
\IntCtrl_State[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DCCCCCCCCCCCCCCC"
    )
        port map (
      I0 => \IntCtrl_State[7]_i_7_n_0\,
      I1 => \IntCtrl_State_reg_n_0_[8]\,
      I2 => \^debug_out\(4),
      I3 => \^debug_out\(6),
      I4 => \^debug_out\(7),
      I5 => \^debug_out\(5),
      O => \IntCtrl_State[8]_i_1_n_0\
    );
\IntCtrl_State_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^rx_riuclk\,
      CE => IntCtrl_State,
      D => \IntCtrl_State[0]_i_1_n_0\,
      Q => \^debug_out\(0),
      R => IntCtrl_Reset
    );
\IntCtrl_State_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^rx_riuclk\,
      CE => IntCtrl_State,
      D => \IntCtrl_State[1]_i_1_n_0\,
      Q => \^debug_out\(1),
      R => IntCtrl_Reset
    );
\IntCtrl_State_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^rx_riuclk\,
      CE => IntCtrl_State,
      D => \IntCtrl_State[2]_i_1_n_0\,
      Q => \^debug_out\(2),
      R => IntCtrl_Reset
    );
\IntCtrl_State_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^rx_riuclk\,
      CE => IntCtrl_State,
      D => \IntCtrl_State[3]_i_1_n_0\,
      Q => \^debug_out\(3),
      R => IntCtrl_Reset
    );
\IntCtrl_State_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^rx_riuclk\,
      CE => IntCtrl_State,
      D => \IntCtrl_State[4]_i_1_n_0\,
      Q => \^debug_out\(4),
      R => IntCtrl_Reset
    );
\IntCtrl_State_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^rx_riuclk\,
      CE => IntCtrl_State,
      D => \IntCtrl_State[5]_i_1_n_0\,
      Q => \^debug_out\(5),
      R => IntCtrl_Reset
    );
\IntCtrl_State_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^rx_riuclk\,
      CE => IntCtrl_State,
      D => \IntCtrl_State[6]_i_1_n_0\,
      Q => \^debug_out\(6),
      R => IntCtrl_Reset
    );
\IntCtrl_State_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^rx_riuclk\,
      CE => IntCtrl_State,
      D => \IntCtrl_State[7]_i_2_n_0\,
      Q => \^debug_out\(7),
      R => IntCtrl_Reset
    );
\IntCtrl_State_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^rx_riuclk\,
      CE => IntCtrl_State,
      D => \IntCtrl_State[8]_i_1_n_0\,
      Q => \IntCtrl_State_reg_n_0_[8]\,
      R => IntCtrl_Reset
    );
\IntCtrl_TxDlyRdy_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => Tx_Dly_Rdy,
      Q => IntCtrl_TxDlyRdy(0),
      R => '0'
    );
\IntCtrl_TxDlyRdy_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => IntCtrl_TxDlyRdy(0),
      Q => IntCtrl_TxDlyRdy(1),
      R => '0'
    );
\IntCtrl_TxLocked_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => \^tx_locked\,
      Q => IntCtrl_TxLocked(0),
      R => '0'
    );
\IntCtrl_TxLocked_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => IntCtrl_TxLocked(0),
      Q => IntCtrl_TxLocked(1),
      R => '0'
    );
IntCtrl_TxLogicRst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => IntCtrl_TxLogicRst_reg_n_0,
      I1 => \^debug_out\(1),
      I2 => \^debug_out\(0),
      I3 => \Riu_Addr[1]_i_2_n_0\,
      O => IntCtrl_TxLogicRst_i_1_n_0
    );
IntCtrl_TxLogicRst_reg: unisim.vcomponents.FDSE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => IntCtrl_TxLogicRst_i_1_n_0,
      Q => IntCtrl_TxLogicRst_reg_n_0,
      S => IntCtrl_Reset
    );
IntCtrl_TxPllClkOutPhyEn_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF02000000"
    )
        port map (
      I0 => \^debug_out\(7),
      I1 => \Riu_Addr[0]_i_3_n_0\,
      I2 => IntCtrl_TxPllClkOutPhyEn_i_2_n_0,
      I3 => Tx_Bsc_EnVtc_i_3_n_0,
      I4 => IntCtrl_TxPllClkOutPhyEn_i_3_n_0,
      I5 => CLKOUTPHYEN,
      O => IntCtrl_TxPllClkOutPhyEn_i_1_n_0
    );
IntCtrl_TxPllClkOutPhyEn_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^debug_out\(2),
      I1 => \^debug_out\(4),
      O => IntCtrl_TxPllClkOutPhyEn_i_2_n_0
    );
IntCtrl_TxPllClkOutPhyEn_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^debug_out\(3),
      I1 => \^debug_out\(5),
      O => IntCtrl_TxPllClkOutPhyEn_i_3_n_0
    );
IntCtrl_TxPllClkOutPhyEn_reg: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => IntCtrl_TxPllClkOutPhyEn_i_1_n_0,
      Q => CLKOUTPHYEN,
      R => IntCtrl_Reset
    );
IntCtrl_TxPllRst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => \^debug_out\(4),
      I1 => IntCtrl_TxPllRst,
      I2 => RST,
      O => IntCtrl_TxPllRst_i_1_n_0
    );
IntCtrl_TxPllRst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200200"
    )
        port map (
      I0 => Tx_Bsc_Rst_i_3_n_0,
      I1 => \Riu_Addr[0]_i_3_n_0\,
      I2 => \^debug_out\(4),
      I3 => \^debug_out\(3),
      I4 => \^debug_out\(2),
      I5 => \^debug_out\(5),
      O => IntCtrl_TxPllRst
    );
IntCtrl_TxPllRst_reg: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => IntCtrl_TxPllRst_i_1_n_0,
      Q => RST,
      R => IntCtrl_Reset
    );
\IntCtrl_TxVtcRdy_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => Tx_Vtc_Rdy,
      Q => IntCtrl_TxVtcRdy(0),
      R => '0'
    );
\IntCtrl_TxVtcRdy_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => IntCtrl_TxVtcRdy(0),
      Q => IntCtrl_TxVtcRdy(1),
      R => '0'
    );
\Riu_Addr[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => \Riu_Addr[0]_i_2_n_0\,
      I1 => \Riu_Addr[0]_i_3_n_0\,
      I2 => \^debug_out\(4),
      I3 => \^debug_out\(5),
      I4 => \^debug_out\(7),
      I5 => \^debug_out\(1),
      O => Riu_Addr0_in(0)
    );
\Riu_Addr[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^debug_out\(3),
      I1 => \^debug_out\(2),
      O => \Riu_Addr[0]_i_2_n_0\
    );
\Riu_Addr[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \IntCtrl_State_reg_n_0_[8]\,
      I1 => \^debug_out\(6),
      O => \Riu_Addr[0]_i_3_n_0\
    );
\Riu_Addr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \Riu_Addr[1]_i_2_n_0\,
      I1 => \^debug_out\(1),
      O => Riu_Addr0_in(1)
    );
\Riu_Addr[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => \^debug_out\(7),
      I1 => \^debug_out\(5),
      I2 => \^debug_out\(4),
      I3 => \Riu_Addr[0]_i_3_n_0\,
      I4 => \^debug_out\(3),
      I5 => \^debug_out\(2),
      O => \Riu_Addr[1]_i_2_n_0\
    );
\Riu_Addr[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEEAE"
    )
        port map (
      I0 => \Riu_Addr[5]_i_3_n_0\,
      I1 => \^debug_out\(1),
      I2 => \IntCtrl_State_reg_n_0_[8]\,
      I3 => \Riu_Addr[5]_i_4_n_0\,
      I4 => \Riu_Addr[5]_i_5_n_0\,
      I5 => \Riu_Addr[5]_i_6_n_0\,
      O => \Riu_Addr[5]_i_1_n_0\
    );
\Riu_Addr[5]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"444444440FFF0000"
    )
        port map (
      I0 => \^debug_out\(6),
      I1 => \IntCtrl_State_reg_n_0_[8]\,
      I2 => \^debug_out\(3),
      I3 => \^debug_out\(4),
      I4 => \^debug_out\(5),
      I5 => \^debug_out\(7),
      O => \Riu_Addr[5]_i_10_n_0\
    );
\Riu_Addr[5]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10FFFF10"
    )
        port map (
      I0 => \^debug_out\(2),
      I1 => \^debug_out\(4),
      I2 => \^debug_out\(5),
      I3 => \^debug_out\(1),
      I4 => \^debug_out\(0),
      O => \Riu_Addr[5]_i_11_n_0\
    );
\Riu_Addr[5]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1100F400"
    )
        port map (
      I0 => \IntCtrl_State_reg_n_0_[8]\,
      I1 => \^debug_out\(7),
      I2 => \^debug_out\(4),
      I3 => \^debug_out\(6),
      I4 => \^debug_out\(2),
      O => \Riu_Addr[5]_i_12_n_0\
    );
\Riu_Addr[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0020A000"
    )
        port map (
      I0 => \^debug_out\(1),
      I1 => \^debug_out\(0),
      I2 => \Riu_Addr[5]_i_7_n_0\,
      I3 => \^debug_out\(3),
      I4 => \^debug_out\(2),
      O => Riu_Addr0_in(5)
    );
\Riu_Addr[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF20C0"
    )
        port map (
      I0 => \^debug_out\(7),
      I1 => \^debug_out\(6),
      I2 => \^debug_out\(2),
      I3 => \^debug_out\(4),
      I4 => \Riu_Addr[5]_i_8_n_0\,
      I5 => \Riu_Addr[5]_i_9_n_0\,
      O => \Riu_Addr[5]_i_3_n_0\
    );
\Riu_Addr[5]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^debug_out\(7),
      I1 => \^debug_out\(2),
      O => \Riu_Addr[5]_i_4_n_0\
    );
\Riu_Addr[5]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3200"
    )
        port map (
      I0 => \^debug_out\(2),
      I1 => \^debug_out\(5),
      I2 => \^debug_out\(6),
      I3 => \^debug_out\(3),
      O => \Riu_Addr[5]_i_5_n_0\
    );
\Riu_Addr[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFFAAEAAAEEAAEA"
    )
        port map (
      I0 => \Riu_Addr[5]_i_10_n_0\,
      I1 => \^debug_out\(4),
      I2 => \IntCtrl_State_reg_n_0_[8]\,
      I3 => \^debug_out\(5),
      I4 => \^debug_out\(7),
      I5 => \^debug_out\(2),
      O => \Riu_Addr[5]_i_6_n_0\
    );
\Riu_Addr[5]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => \IntCtrl_State_reg_n_0_[8]\,
      I1 => \^debug_out\(6),
      I2 => \^debug_out\(4),
      I3 => \^debug_out\(5),
      I4 => \^debug_out\(7),
      O => \Riu_Addr[5]_i_7_n_0\
    );
\Riu_Addr[5]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF4F044404"
    )
        port map (
      I0 => \^debug_out\(1),
      I1 => \IntCtrl_State_reg_n_0_[8]\,
      I2 => \^debug_out\(2),
      I3 => \^debug_out\(7),
      I4 => \^debug_out\(3),
      I5 => \Riu_Addr[5]_i_11_n_0\,
      O => \Riu_Addr[5]_i_8_n_0\
    );
\Riu_Addr[5]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF4440CCC8"
    )
        port map (
      I0 => \^debug_out\(5),
      I1 => \^debug_out\(2),
      I2 => \^debug_out\(6),
      I3 => \IntCtrl_State_reg_n_0_[8]\,
      I4 => \^debug_out\(3),
      I5 => \Riu_Addr[5]_i_12_n_0\,
      O => \Riu_Addr[5]_i_9_n_0\
    );
\Riu_Addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Riu_Addr[5]_i_1_n_0\,
      D => Riu_Addr0_in(0),
      Q => \^riu_addr\(0),
      R => IntCtrl_Reset
    );
\Riu_Addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Riu_Addr[5]_i_1_n_0\,
      D => Riu_Addr0_in(1),
      Q => \^riu_addr\(1),
      R => IntCtrl_Reset
    );
\Riu_Addr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Riu_Addr[5]_i_1_n_0\,
      D => Riu_Addr0_in(5),
      Q => \^riu_addr\(4),
      R => IntCtrl_Reset
    );
\Riu_Nibble_Sel[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0070A000"
    )
        port map (
      I0 => \^debug_out\(1),
      I1 => \^debug_out\(0),
      I2 => \Riu_Addr[5]_i_7_n_0\,
      I3 => \^debug_out\(3),
      I4 => \^debug_out\(2),
      O => \Riu_Nibble_Sel[0]_i_1_n_0\
    );
\Riu_Nibble_Sel_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Riu_Addr[5]_i_1_n_0\,
      D => \Riu_Nibble_Sel[0]_i_1_n_0\,
      Q => \^riu_nibble_sel\(0),
      R => IntCtrl_Reset
    );
\Riu_WrData[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \Riu_Addr[1]_i_2_n_0\,
      I1 => \^debug_out\(0),
      I2 => \^debug_out\(1),
      O => \Riu_WrData[3]_i_1_n_0\
    );
\Riu_WrData_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Riu_Addr[5]_i_1_n_0\,
      D => \Riu_WrData[3]_i_1_n_0\,
      Q => \^riu_wr_en\,
      R => IntCtrl_Reset
    );
Rx_Bs_EnVtc_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => \^debug_out\(0),
      I1 => Rx_Bs_EnVtc_i_2_n_0,
      I2 => \^rx_bs_envtc\,
      O => Rx_Bs_EnVtc_i_1_n_0
    );
Rx_Bs_EnVtc_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000002"
    )
        port map (
      I0 => Rx_Bs_EnVtc_i_3_n_0,
      I1 => \^debug_out\(0),
      I2 => \^debug_out\(5),
      I3 => \^debug_out\(7),
      I4 => \^debug_out\(4),
      I5 => \^debug_out\(2),
      O => Rx_Bs_EnVtc_i_2_n_0
    );
Rx_Bs_EnVtc_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000100010101"
    )
        port map (
      I0 => \Riu_Addr[0]_i_3_n_0\,
      I1 => \^debug_out\(1),
      I2 => \^debug_out\(3),
      I3 => \^debug_out\(7),
      I4 => Rx_Bs_EnVtc_i_4_n_0,
      I5 => Rx_Bs_EnVtc_i_5_n_0,
      O => Rx_Bs_EnVtc_i_3_n_0
    );
Rx_Bs_EnVtc_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => Riu_RdData_0(11),
      I1 => Riu_Prsnt_0,
      I2 => Riu_RdData_3(11),
      I3 => Riu_Prsnt_3,
      O => Rx_Bs_EnVtc_i_4_n_0
    );
Rx_Bs_EnVtc_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => Riu_RdData_2(11),
      I1 => Riu_Prsnt_2,
      I2 => Riu_RdData_1(11),
      I3 => Riu_Prsnt_1,
      O => Rx_Bs_EnVtc_i_5_n_0
    );
Rx_Bs_EnVtc_reg: unisim.vcomponents.FDSE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => Rx_Bs_EnVtc_i_1_n_0,
      Q => \^rx_bs_envtc\,
      S => IntCtrl_Reset
    );
Rx_Bs_Rst_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABFFBBFFA8008800"
    )
        port map (
      I0 => Rx_Bs_Rst_i_2_n_0,
      I1 => Tx_Bs_RstDly_i_2_n_0,
      I2 => Rx_Bs_Rst_i_3_n_0,
      I3 => Rx_Bs_Rst_i_4_n_0,
      I4 => \^debug_out\(4),
      I5 => \^rx_bs_rst\,
      O => Rx_Bs_Rst_i_1_n_0
    );
Rx_Bs_Rst_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^debug_out\(7),
      I1 => \^debug_out\(2),
      O => Rx_Bs_Rst_i_2_n_0
    );
Rx_Bs_Rst_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000030000"
    )
        port map (
      I0 => \IntCtrl_State_reg_n_0_[8]\,
      I1 => \^debug_out\(0),
      I2 => \^debug_out\(1),
      I3 => \^debug_out\(7),
      I4 => \^debug_out\(5),
      I5 => \^debug_out\(6),
      O => Rx_Bs_Rst_i_3_n_0
    );
Rx_Bs_Rst_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"81"
    )
        port map (
      I0 => \^debug_out\(5),
      I1 => \^debug_out\(3),
      I2 => \^debug_out\(2),
      O => Rx_Bs_Rst_i_4_n_0
    );
Rx_Bs_Rst_reg: unisim.vcomponents.FDSE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => Rx_Bs_Rst_i_1_n_0,
      Q => \^rx_bs_rst\,
      S => IntCtrl_Reset
    );
\Rx_BtVal_0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_0(1),
      Q => Rx_BtVal_0(0),
      R => IntCtrl_Reset
    );
\Rx_BtVal_0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_0(2),
      Q => Rx_BtVal_0(1),
      R => IntCtrl_Reset
    );
\Rx_BtVal_0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_0(3),
      Q => Rx_BtVal_0(2),
      R => IntCtrl_Reset
    );
\Rx_BtVal_0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_0(4),
      Q => Rx_BtVal_0(3),
      R => IntCtrl_Reset
    );
\Rx_BtVal_0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_0(5),
      Q => Rx_BtVal_0(4),
      R => IntCtrl_Reset
    );
\Rx_BtVal_0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_0(6),
      Q => Rx_BtVal_0(5),
      R => IntCtrl_Reset
    );
\Rx_BtVal_0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_0(7),
      Q => Rx_BtVal_0(6),
      R => IntCtrl_Reset
    );
\Rx_BtVal_0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_0(8),
      Q => Rx_BtVal_0(7),
      R => IntCtrl_Reset
    );
\Rx_BtVal_0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_0(9),
      Q => Rx_BtVal_0(8),
      R => IntCtrl_Reset
    );
\Rx_BtVal_1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_1(1),
      Q => Rx_BtVal_1(0),
      R => IntCtrl_Reset
    );
\Rx_BtVal_1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_1(2),
      Q => Rx_BtVal_1(1),
      R => IntCtrl_Reset
    );
\Rx_BtVal_1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_1(3),
      Q => Rx_BtVal_1(2),
      R => IntCtrl_Reset
    );
\Rx_BtVal_1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_1(4),
      Q => Rx_BtVal_1(3),
      R => IntCtrl_Reset
    );
\Rx_BtVal_1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_1(5),
      Q => Rx_BtVal_1(4),
      R => IntCtrl_Reset
    );
\Rx_BtVal_1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_1(6),
      Q => Rx_BtVal_1(5),
      R => IntCtrl_Reset
    );
\Rx_BtVal_1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_1(7),
      Q => Rx_BtVal_1(6),
      R => IntCtrl_Reset
    );
\Rx_BtVal_1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_1(8),
      Q => Rx_BtVal_1(7),
      R => IntCtrl_Reset
    );
\Rx_BtVal_1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_1(9),
      Q => Rx_BtVal_1(8),
      R => IntCtrl_Reset
    );
\Rx_BtVal_2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_2(1),
      Q => Rx_BtVal_2(0),
      R => IntCtrl_Reset
    );
\Rx_BtVal_2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_2(2),
      Q => Rx_BtVal_2(1),
      R => IntCtrl_Reset
    );
\Rx_BtVal_2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_2(3),
      Q => Rx_BtVal_2(2),
      R => IntCtrl_Reset
    );
\Rx_BtVal_2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_2(4),
      Q => Rx_BtVal_2(3),
      R => IntCtrl_Reset
    );
\Rx_BtVal_2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_2(5),
      Q => Rx_BtVal_2(4),
      R => IntCtrl_Reset
    );
\Rx_BtVal_2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_2(6),
      Q => Rx_BtVal_2(5),
      R => IntCtrl_Reset
    );
\Rx_BtVal_2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_2(7),
      Q => Rx_BtVal_2(6),
      R => IntCtrl_Reset
    );
\Rx_BtVal_2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_2(8),
      Q => Rx_BtVal_2(7),
      R => IntCtrl_Reset
    );
\Rx_BtVal_2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_2(9),
      Q => Rx_BtVal_2(8),
      R => IntCtrl_Reset
    );
\Rx_BtVal_3[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => \Rx_BtVal_3[8]_i_2_n_0\,
      I1 => \Rx_BtVal_3[8]_i_3_n_0\,
      I2 => \^debug_out\(0),
      I3 => \^debug_out\(1),
      I4 => \Rx_BtVal_3[8]_i_4_n_0\,
      O => \Rx_BtVal_3[8]_i_1_n_0\
    );
\Rx_BtVal_3[8]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \Rx_BtVal_3[8]_i_20_n_0\,
      I1 => Riu_RdData_3(5),
      I2 => Riu_RdData_3(4),
      I3 => Riu_RdData_3(3),
      I4 => Riu_RdData_3(2),
      O => \Rx_BtVal_3[8]_i_10_n_0\
    );
\Rx_BtVal_3[8]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => Riu_RdData_2(6),
      I1 => Riu_RdData_2(5),
      I2 => Riu_RdData_2(4),
      I3 => Riu_RdData_2(3),
      O => \Rx_BtVal_3[8]_i_11_n_0\
    );
\Rx_BtVal_3[8]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => Riu_RdData_2(10),
      I1 => Riu_RdData_2(9),
      I2 => Riu_RdData_2(8),
      I3 => Riu_RdData_2(7),
      O => \Rx_BtVal_3[8]_i_12_n_0\
    );
\Rx_BtVal_3[8]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => Riu_RdData_2(11),
      I1 => Riu_RdData_2(12),
      I2 => Riu_RdData_2(13),
      I3 => Riu_RdData_2(14),
      I4 => Riu_RdData_2(15),
      I5 => Riu_Prsnt_2,
      O => \Rx_BtVal_3[8]_i_13_n_0\
    );
\Rx_BtVal_3[8]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => Riu_RdData_1(10),
      I1 => Riu_RdData_1(11),
      I2 => Riu_RdData_1(12),
      I3 => Riu_RdData_1(13),
      O => \Rx_BtVal_3[8]_i_14_n_0\
    );
\Rx_BtVal_3[8]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
        port map (
      I0 => Riu_Prsnt_1,
      I1 => Riu_RdData_1(14),
      I2 => Riu_RdData_1(15),
      I3 => Riu_RdData_1(0),
      I4 => Riu_RdData_1(1),
      O => \Rx_BtVal_3[8]_i_15_n_0\
    );
\Rx_BtVal_3[8]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => Riu_RdData_0(6),
      I1 => Riu_RdData_0(5),
      I2 => Riu_RdData_0(4),
      I3 => Riu_RdData_0(3),
      O => \Rx_BtVal_3[8]_i_16_n_0\
    );
\Rx_BtVal_3[8]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => Riu_RdData_0(10),
      I1 => Riu_RdData_0(9),
      I2 => Riu_RdData_0(8),
      I3 => Riu_RdData_0(7),
      O => \Rx_BtVal_3[8]_i_17_n_0\
    );
\Rx_BtVal_3[8]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => Riu_RdData_0(11),
      I1 => Riu_RdData_0(12),
      I2 => Riu_RdData_0(13),
      I3 => Riu_RdData_0(14),
      I4 => Riu_RdData_0(15),
      I5 => Riu_Prsnt_0,
      O => \Rx_BtVal_3[8]_i_18_n_0\
    );
\Rx_BtVal_3[8]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => Riu_RdData_3(10),
      I1 => Riu_RdData_3(11),
      I2 => Riu_RdData_3(12),
      I3 => Riu_RdData_3(13),
      O => \Rx_BtVal_3[8]_i_19_n_0\
    );
\Rx_BtVal_3[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => \Rx_BtVal_3[8]_i_5_n_0\,
      I1 => \Rx_BtVal_3[8]_i_6_n_0\,
      I2 => \Rx_BtVal_3[8]_i_7_n_0\,
      O => \Rx_BtVal_3[8]_i_2_n_0\
    );
\Rx_BtVal_3[8]_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
        port map (
      I0 => Riu_Prsnt_3,
      I1 => Riu_RdData_3(14),
      I2 => Riu_RdData_3(15),
      I3 => Riu_RdData_3(0),
      I4 => Riu_RdData_3(1),
      O => \Rx_BtVal_3[8]_i_20_n_0\
    );
\Rx_BtVal_3[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => \^debug_out\(7),
      I1 => \^debug_out\(5),
      I2 => \^debug_out\(4),
      I3 => \Riu_Addr[0]_i_3_n_0\,
      I4 => \^debug_out\(2),
      I5 => \^debug_out\(3),
      O => \Rx_BtVal_3[8]_i_3_n_0\
    );
\Rx_BtVal_3[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => \Rx_BtVal_3[8]_i_8_n_0\,
      I1 => \Rx_BtVal_3[8]_i_9_n_0\,
      I2 => \Rx_BtVal_3[8]_i_10_n_0\,
      O => \Rx_BtVal_3[8]_i_4_n_0\
    );
\Rx_BtVal_3[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => Riu_RdData_2(2),
      I1 => Riu_RdData_2(1),
      I2 => Riu_RdData_2(0),
      I3 => \Rx_BtVal_3[8]_i_11_n_0\,
      I4 => \Rx_BtVal_3[8]_i_12_n_0\,
      I5 => \Rx_BtVal_3[8]_i_13_n_0\,
      O => \Rx_BtVal_3[8]_i_5_n_0\
    );
\Rx_BtVal_3[8]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => Riu_RdData_1(9),
      I1 => Riu_RdData_1(8),
      I2 => Riu_RdData_1(7),
      I3 => Riu_RdData_1(6),
      I4 => \Rx_BtVal_3[8]_i_14_n_0\,
      O => \Rx_BtVal_3[8]_i_6_n_0\
    );
\Rx_BtVal_3[8]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \Rx_BtVal_3[8]_i_15_n_0\,
      I1 => Riu_RdData_1(5),
      I2 => Riu_RdData_1(4),
      I3 => Riu_RdData_1(3),
      I4 => Riu_RdData_1(2),
      O => \Rx_BtVal_3[8]_i_7_n_0\
    );
\Rx_BtVal_3[8]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => Riu_RdData_0(2),
      I1 => Riu_RdData_0(1),
      I2 => Riu_RdData_0(0),
      I3 => \Rx_BtVal_3[8]_i_16_n_0\,
      I4 => \Rx_BtVal_3[8]_i_17_n_0\,
      I5 => \Rx_BtVal_3[8]_i_18_n_0\,
      O => \Rx_BtVal_3[8]_i_8_n_0\
    );
\Rx_BtVal_3[8]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => Riu_RdData_3(9),
      I1 => Riu_RdData_3(8),
      I2 => Riu_RdData_3(7),
      I3 => Riu_RdData_3(6),
      I4 => \Rx_BtVal_3[8]_i_19_n_0\,
      O => \Rx_BtVal_3[8]_i_9_n_0\
    );
\Rx_BtVal_3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_3(1),
      Q => Rx_BtVal_3(0),
      R => IntCtrl_Reset
    );
\Rx_BtVal_3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_3(2),
      Q => Rx_BtVal_3(1),
      R => IntCtrl_Reset
    );
\Rx_BtVal_3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_3(3),
      Q => Rx_BtVal_3(2),
      R => IntCtrl_Reset
    );
\Rx_BtVal_3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_3(4),
      Q => Rx_BtVal_3(3),
      R => IntCtrl_Reset
    );
\Rx_BtVal_3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_3(5),
      Q => Rx_BtVal_3(4),
      R => IntCtrl_Reset
    );
\Rx_BtVal_3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_3(6),
      Q => Rx_BtVal_3(5),
      R => IntCtrl_Reset
    );
\Rx_BtVal_3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_3(7),
      Q => Rx_BtVal_3(6),
      R => IntCtrl_Reset
    );
\Rx_BtVal_3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_3(8),
      Q => Rx_BtVal_3(7),
      R => IntCtrl_Reset
    );
\Rx_BtVal_3_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => \Rx_BtVal_3[8]_i_1_n_0\,
      D => Riu_RdData_3(9),
      Q => Rx_BtVal_3(8),
      R => IntCtrl_Reset
    );
Tx_Bs_RstDly_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7F0002"
    )
        port map (
      I0 => Tx_Bs_RstDly_i_2_n_0,
      I1 => \^debug_out\(5),
      I2 => \^debug_out\(3),
      I3 => \^debug_out\(2),
      I4 => \^rx_bs_rstdly\,
      O => Tx_Bs_RstDly_i_1_n_0
    );
Tx_Bs_RstDly_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => \^debug_out\(7),
      I1 => \^debug_out\(1),
      I2 => \^debug_out\(0),
      I3 => \IntCtrl_State_reg_n_0_[8]\,
      I4 => \^debug_out\(6),
      I5 => \^debug_out\(4),
      O => Tx_Bs_RstDly_i_2_n_0
    );
Tx_Bs_RstDly_reg: unisim.vcomponents.FDSE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => Tx_Bs_RstDly_i_1_n_0,
      Q => \^rx_bs_rstdly\,
      S => IntCtrl_Reset
    );
Tx_Bs_Rst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF0002"
    )
        port map (
      I0 => Tx_Bs_RstDly_i_2_n_0,
      I1 => \^debug_out\(2),
      I2 => \^debug_out\(3),
      I3 => \^debug_out\(5),
      I4 => \^tx_bs_rst\,
      O => Tx_Bs_Rst_i_1_n_0
    );
Tx_Bs_Rst_reg: unisim.vcomponents.FDSE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => Tx_Bs_Rst_i_1_n_0,
      Q => \^tx_bs_rst\,
      S => IntCtrl_Reset
    );
Tx_Bsc_EnVtc_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000020"
    )
        port map (
      I0 => IntCtrl_State06_out,
      I1 => \^debug_out\(4),
      I2 => Tx_Bsc_EnVtc_i_3_n_0,
      I3 => Tx_Bsc_EnVtc_i_4_n_0,
      I4 => Tx_Bsc_EnVtc_i_5_n_0,
      I5 => \^tx_bsc_envtc\,
      O => Tx_Bsc_EnVtc_i_1_n_0
    );
Tx_Bsc_EnVtc_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => IntCtrl_TxDlyRdy(1),
      I1 => IntCtrl_RxDlyRdy(1),
      O => IntCtrl_State06_out
    );
Tx_Bsc_EnVtc_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^debug_out\(1),
      I1 => \^debug_out\(0),
      O => Tx_Bsc_EnVtc_i_3_n_0
    );
Tx_Bsc_EnVtc_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^debug_out\(3),
      I1 => \^debug_out\(2),
      O => Tx_Bsc_EnVtc_i_4_n_0
    );
Tx_Bsc_EnVtc_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => \^debug_out\(5),
      I1 => \^debug_out\(7),
      I2 => \^debug_out\(6),
      I3 => \IntCtrl_State_reg_n_0_[8]\,
      O => Tx_Bsc_EnVtc_i_5_n_0
    );
Tx_Bsc_EnVtc_reg: unisim.vcomponents.FDRE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => Tx_Bsc_EnVtc_i_1_n_0,
      Q => \^tx_bsc_envtc\,
      R => IntCtrl_Reset
    );
Tx_Bsc_Rst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => \^debug_out\(6),
      I1 => \Tx_Bsc_Rst__0\,
      I2 => \^rx_bsc_rst\,
      O => Tx_Bsc_Rst_i_1_n_0
    );
Tx_Bsc_Rst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000002200000"
    )
        port map (
      I0 => Tx_Bsc_Rst_i_3_n_0,
      I1 => \IntCtrl_State_reg_n_0_[8]\,
      I2 => \^debug_out\(6),
      I3 => \^debug_out\(4),
      I4 => IntCtrl_TxPllClkOutPhyEn_i_3_n_0,
      I5 => \^debug_out\(2),
      O => \Tx_Bsc_Rst__0\
    );
Tx_Bsc_Rst_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \^debug_out\(0),
      I1 => \^debug_out\(1),
      I2 => \^debug_out\(7),
      O => Tx_Bsc_Rst_i_3_n_0
    );
Tx_Bsc_Rst_reg: unisim.vcomponents.FDSE
     port map (
      C => \^rx_riuclk\,
      CE => '1',
      D => Tx_Bsc_Rst_i_1_n_0,
      Q => \^rx_bsc_rst\,
      S => IntCtrl_Reset
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
iclkbuf: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ClockIn_p,
      IB => ClockIn_n,
      O => \^clockin_se_out\
    );
reset_sync_ctrl_rst: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_24
     port map (
      ResetIn => ResetIn,
      reset_out => IntCtrl_Reset,
      reset_sync1_0 => \^rx_riuclk\
    );
reset_sync_rx_cdc_rst: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_25
     port map (
      Rx_LogicRst => Rx_LogicRst,
      Rx_SysClk => \^rx_sysclk\,
      reset_in => IntCtrl_RxLogicRst_reg_n_0
    );
reset_sync_tx_cdc_rst: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_26
     port map (
      Tx_LogicRst => Tx_LogicRst,
      Tx_WrClk => \^tx_wrclk\,
      reset_in => IntCtrl_TxLogicRst_reg_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_clk_gen is
  port (
    sgmii_clk_r_0 : out STD_LOGIC;
    sgmii_clk_en_reg_0 : out STD_LOGIC;
    sgmii_clk_f_0 : out STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    data_out : in STD_LOGIC;
    speed_is_10_100_fall_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_clk_gen : entity is "gig_ethernet_pcs_pma_0_clk_gen";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_clk_gen;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_clk_gen is
  signal clk12_5 : STD_LOGIC;
  signal clk12_5_reg : STD_LOGIC;
  signal clk1_25 : STD_LOGIC;
  signal clk1_25_reg : STD_LOGIC;
  signal clk_div1_n_3 : STD_LOGIC;
  signal clk_en_12_5_fall : STD_LOGIC;
  signal clk_en_12_5_fall0 : STD_LOGIC;
  signal clk_en_12_5_rise : STD_LOGIC;
  signal clk_en_12_5_rise0 : STD_LOGIC;
  signal clk_en_1_25_fall : STD_LOGIC;
  signal clk_en_1_25_fall0 : STD_LOGIC;
  signal reset_fall : STD_LOGIC;
  signal sgmii_clk_en_i_1_n_0 : STD_LOGIC;
  signal sgmii_clk_r0_out : STD_LOGIC;
  signal speed_is_100_fall : STD_LOGIC;
  signal speed_is_10_100_fall : STD_LOGIC;
begin
clk12_5_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => clk12_5,
      Q => clk12_5_reg,
      R => reset_out
    );
clk1_25_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => clk1_25,
      Q => clk1_25_reg,
      R => reset_out
    );
clk_div1: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_johnson_cntr
     port map (
      Tx_WrClk => Tx_WrClk,
      clk12_5 => clk12_5,
      clk12_5_reg => clk12_5_reg,
      clk1_25 => clk1_25,
      clk_en_12_5_fall0 => clk_en_12_5_fall0,
      clk_en_12_5_rise0 => clk_en_12_5_rise0,
      reset_fall => reset_fall,
      reset_out => reset_out,
      speed_is_100_fall => speed_is_100_fall,
      speed_is_10_100_fall => speed_is_10_100_fall,
      speed_is_10_100_fall_reg => clk_div1_n_3
    );
clk_div2: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_johnson_cntr_2
     port map (
      Tx_WrClk => Tx_WrClk,
      clk12_5 => clk12_5,
      clk1_25 => clk1_25,
      clk1_25_reg => clk1_25_reg,
      clk_en_12_5_rise => clk_en_12_5_rise,
      clk_en_1_25_fall0 => clk_en_1_25_fall0,
      data_out => data_out,
      reset_out => reset_out,
      sgmii_clk_r0_out => sgmii_clk_r0_out,
      sgmii_clk_r_reg => speed_is_10_100_fall_reg_0
    );
clk_en_12_5_fall_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => clk_en_12_5_fall0,
      Q => clk_en_12_5_fall,
      R => reset_out
    );
clk_en_12_5_rise_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => clk_en_12_5_rise0,
      Q => clk_en_12_5_rise,
      R => reset_out
    );
clk_en_1_25_fall_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => clk_en_1_25_fall0,
      Q => clk_en_1_25_fall,
      R => reset_out
    );
reset_fall_reg: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_out,
      Q => reset_fall,
      R => '0'
    );
sgmii_clk_en_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E2FF"
    )
        port map (
      I0 => clk_en_1_25_fall,
      I1 => data_out,
      I2 => clk_en_12_5_fall,
      I3 => speed_is_10_100_fall_reg_0,
      O => sgmii_clk_en_i_1_n_0
    );
sgmii_clk_en_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => sgmii_clk_en_i_1_n_0,
      Q => sgmii_clk_en_reg_0,
      R => reset_out
    );
sgmii_clk_f_reg: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => clk_div1_n_3,
      Q => sgmii_clk_f_0,
      R => '0'
    );
sgmii_clk_r_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => sgmii_clk_r0_out,
      Q => sgmii_clk_r_0,
      R => reset_out
    );
speed_is_100_fall_reg: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => data_out,
      Q => speed_is_100_fall,
      R => '0'
    );
speed_is_10_100_fall_reg: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => speed_is_10_100_fall_reg_0,
      Q => speed_is_10_100_fall,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_rx_elastic_buffer is
  port (
    \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0\ : out STD_LOGIC;
    \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0\ : out STD_LOGIC;
    initialize_ram_complete_sync_reg1 : out STD_LOGIC;
    data_out : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    remove_idle_reg_reg_0 : out STD_LOGIC;
    \insert_idle_reg__0\ : out STD_LOGIC;
    rxdisperr : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxnotintable : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxrundisp : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxclkcorcnt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_in : out STD_LOGIC;
    initialize_ram_complete_pulse_reg_0 : out STD_LOGIC;
    rxbufstatus : out STD_LOGIC_VECTOR ( 0 to 0 );
    \initialize_counter_reg[5]_0\ : out STD_LOGIC;
    \rd_data_reg_reg[13]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \rd_occupancy_reg[3]_0\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \rd_occupancy_reg[0]_0\ : out STD_LOGIC;
    rxchariscomma_usr_reg_0 : out STD_LOGIC;
    rxcharisk_usr_reg_0 : out STD_LOGIC;
    \rxdata_usr_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    Rx_SysClk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \d2p2_wr_pipe_reg[3]_0\ : in STD_LOGIC;
    \d21p5_wr_pipe_reg[3]_0\ : in STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    initialize_ram_complete_sync_ris_edg0 : in STD_LOGIC;
    \rxclkcorcnt_reg[0]_0\ : in STD_LOGIC;
    initialize_ram_complete_reg_0 : in STD_LOGIC;
    rxbuferr_reg_0 : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    \initialize_counter_reg[5]_1\ : in STD_LOGIC;
    reset_modified_reg_0 : in STD_LOGIC;
    mgt_rx_reset : in STD_LOGIC;
    elastic_buffer_rst_125 : in STD_LOGIC;
    \wr_addr_plus2_reg[6]_0\ : in STD_LOGIC;
    \wr_data_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \wr_data_reg[12]_0\ : in STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_rx_elastic_buffer : entity is "gig_ethernet_pcs_pma_0_rx_elastic_buffer";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_rx_elastic_buffer;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_rx_elastic_buffer is
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \__1/ram_reg_64_127_0_6_i_1_n_0\ : STD_LOGIC;
  signal d16p2_wr : STD_LOGIC;
  signal \d16p2_wr_pipe[0]_i_2_n_0\ : STD_LOGIC;
  signal \d16p2_wr_pipe_reg_n_0_[0]\ : STD_LOGIC;
  signal d21p5_wr : STD_LOGIC;
  signal d21p5_wr_pipe : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0\ : STD_LOGIC;
  signal d2p2_wr : STD_LOGIC;
  signal d2p2_wr_pipe : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0\ : STD_LOGIC;
  signal \^data_in\ : STD_LOGIC;
  signal \^data_out\ : STD_LOGIC;
  signal dpo : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal even : STD_LOGIC;
  signal even0 : STD_LOGIC;
  signal even_i_1_n_0 : STD_LOGIC;
  signal even_i_2_n_0 : STD_LOGIC;
  signal even_i_3_n_0 : STD_LOGIC;
  signal initialize_counter0 : STD_LOGIC;
  signal initialize_counter_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^initialize_counter_reg[5]_0\ : STD_LOGIC;
  signal initialize_ram : STD_LOGIC;
  signal initialize_ram0 : STD_LOGIC;
  signal initialize_ram_complete_pulse0 : STD_LOGIC;
  signal \^initialize_ram_complete_pulse_reg_0\ : STD_LOGIC;
  signal \initialize_ram_complete_reg__0\ : STD_LOGIC;
  signal initialize_ram_complete_sync_ris_edg : STD_LOGIC;
  signal initialize_ram_i_1_n_0 : STD_LOGIC;
  signal insert_idle : STD_LOGIC;
  signal insert_idle_i_10_n_0 : STD_LOGIC;
  signal insert_idle_i_11_n_0 : STD_LOGIC;
  signal insert_idle_i_12_n_0 : STD_LOGIC;
  signal insert_idle_i_2_n_0 : STD_LOGIC;
  signal insert_idle_i_3_n_0 : STD_LOGIC;
  signal insert_idle_i_4_n_0 : STD_LOGIC;
  signal insert_idle_i_5_n_0 : STD_LOGIC;
  signal insert_idle_i_6_n_0 : STD_LOGIC;
  signal insert_idle_i_7_n_0 : STD_LOGIC;
  signal insert_idle_i_8_n_0 : STD_LOGIC;
  signal insert_idle_i_9_n_0 : STD_LOGIC;
  signal \^insert_idle_reg__0\ : STD_LOGIC;
  signal \k28p5_wr_pipe[0]_i_2_n_0\ : STD_LOGIC;
  signal \k28p5_wr_pipe_reg_n_0_[0]\ : STD_LOGIC;
  signal \k28p5_wr_pipe_reg_n_0_[1]\ : STD_LOGIC;
  signal \k28p5_wr_pipe_reg_n_0_[2]\ : STD_LOGIC;
  signal \k28p5_wr_pipe_reg_n_0_[3]\ : STD_LOGIC;
  signal \k28p5_wr_pipe_reg_n_0_[4]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_1_in : STD_LOGIC;
  signal p_1_in28_in : STD_LOGIC;
  signal p_1_in3_in : STD_LOGIC;
  signal p_1_out : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_2_in20_in : STD_LOGIC;
  signal p_2_in29_in : STD_LOGIC;
  signal p_2_out : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal p_3_in31_in : STD_LOGIC;
  signal p_3_out : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_4_in23_in : STD_LOGIC;
  signal p_4_in33_in : STD_LOGIC;
  signal p_4_in9_in : STD_LOGIC;
  signal p_4_out : STD_LOGIC;
  signal p_5_in : STD_LOGIC;
  signal p_5_in35_in : STD_LOGIC;
  signal p_5_out : STD_LOGIC;
  signal p_6_out : STD_LOGIC_VECTOR ( 5 downto 1 );
  signal ram_reg_0_63_0_6_i_1_n_0 : STD_LOGIC;
  signal ram_reg_0_63_0_6_n_0 : STD_LOGIC;
  signal ram_reg_0_63_0_6_n_1 : STD_LOGIC;
  signal ram_reg_0_63_0_6_n_2 : STD_LOGIC;
  signal ram_reg_0_63_0_6_n_3 : STD_LOGIC;
  signal ram_reg_0_63_0_6_n_4 : STD_LOGIC;
  signal ram_reg_0_63_0_6_n_5 : STD_LOGIC;
  signal ram_reg_0_63_0_6_n_6 : STD_LOGIC;
  signal ram_reg_0_63_7_13_n_0 : STD_LOGIC;
  signal ram_reg_0_63_7_13_n_1 : STD_LOGIC;
  signal ram_reg_0_63_7_13_n_2 : STD_LOGIC;
  signal ram_reg_0_63_7_13_n_3 : STD_LOGIC;
  signal ram_reg_0_63_7_13_n_4 : STD_LOGIC;
  signal ram_reg_0_63_7_13_n_5 : STD_LOGIC;
  signal ram_reg_0_63_7_13_n_6 : STD_LOGIC;
  signal ram_reg_64_127_0_6_n_0 : STD_LOGIC;
  signal ram_reg_64_127_0_6_n_1 : STD_LOGIC;
  signal ram_reg_64_127_0_6_n_2 : STD_LOGIC;
  signal ram_reg_64_127_0_6_n_3 : STD_LOGIC;
  signal ram_reg_64_127_0_6_n_4 : STD_LOGIC;
  signal ram_reg_64_127_0_6_n_5 : STD_LOGIC;
  signal ram_reg_64_127_0_6_n_6 : STD_LOGIC;
  signal ram_reg_64_127_7_13_n_0 : STD_LOGIC;
  signal ram_reg_64_127_7_13_n_1 : STD_LOGIC;
  signal ram_reg_64_127_7_13_n_2 : STD_LOGIC;
  signal ram_reg_64_127_7_13_n_3 : STD_LOGIC;
  signal ram_reg_64_127_7_13_n_4 : STD_LOGIC;
  signal ram_reg_64_127_7_13_n_5 : STD_LOGIC;
  signal ram_reg_64_127_7_13_n_6 : STD_LOGIC;
  signal rd_addr : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal rd_addr_gray : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \rd_addr_gray[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_gray[1]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_gray[2]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_gray[3]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_gray[4]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_gray[5]_i_1_n_0\ : STD_LOGIC;
  signal rd_addr_plus1 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \rd_addr_plus2[6]_i_2_n_0\ : STD_LOGIC;
  signal \rd_addr_plus2_reg_n_0_[0]\ : STD_LOGIC;
  signal \rd_addr_plus2_reg_n_0_[6]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[0]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[10]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[11]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[12]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[13]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[1]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[2]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[3]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[4]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[5]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[6]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[7]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[9]\ : STD_LOGIC;
  signal \^rd_data_reg_reg[13]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \rd_data_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \rd_data_reg_reg_n_0_[10]\ : STD_LOGIC;
  signal \rd_data_reg_reg_n_0_[12]\ : STD_LOGIC;
  signal \rd_data_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \rd_data_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \rd_data_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \rd_data_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \rd_data_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \rd_data_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \rd_data_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal \rd_data_reg_reg_n_0_[8]\ : STD_LOGIC;
  signal \rd_data_reg_reg_n_0_[9]\ : STD_LOGIC;
  signal rd_enable : STD_LOGIC;
  signal rd_enable_reg : STD_LOGIC;
  signal rd_occupancy : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rd_occupancy01_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal rd_occupancy0_carry_n_2 : STD_LOGIC;
  signal rd_occupancy0_carry_n_3 : STD_LOGIC;
  signal rd_occupancy0_carry_n_4 : STD_LOGIC;
  signal rd_occupancy0_carry_n_5 : STD_LOGIC;
  signal rd_occupancy0_carry_n_6 : STD_LOGIC;
  signal rd_occupancy0_carry_n_7 : STD_LOGIC;
  signal rd_wr_addr : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal rd_wr_addr_gray_0 : STD_LOGIC;
  signal rd_wr_addr_gray_3 : STD_LOGIC;
  signal rd_wr_addr_gray_6 : STD_LOGIC;
  signal \reclock_rd_addrgray[1].sync_rd_addrgray_n_0\ : STD_LOGIC;
  signal \reclock_rd_addrgray[1].sync_rd_addrgray_n_1\ : STD_LOGIC;
  signal \reclock_rd_addrgray[3].sync_rd_addrgray_n_0\ : STD_LOGIC;
  signal \reclock_rd_addrgray[4].sync_rd_addrgray_n_0\ : STD_LOGIC;
  signal \reclock_rd_addrgray[5].sync_rd_addrgray_n_0\ : STD_LOGIC;
  signal \reclock_rd_addrgray[6].sync_rd_addrgray_n_0\ : STD_LOGIC;
  signal \reclock_rd_addrgray[6].sync_rd_addrgray_n_1\ : STD_LOGIC;
  signal \reclock_wr_addrgray[1].sync_wr_addrgray_n_0\ : STD_LOGIC;
  signal \reclock_wr_addrgray[1].sync_wr_addrgray_n_1\ : STD_LOGIC;
  signal \reclock_wr_addrgray[3].sync_wr_addrgray_n_0\ : STD_LOGIC;
  signal \reclock_wr_addrgray[4].sync_wr_addrgray_n_0\ : STD_LOGIC;
  signal \reclock_wr_addrgray[5].sync_wr_addrgray_n_0\ : STD_LOGIC;
  signal \reclock_wr_addrgray[6].sync_wr_addrgray_n_0\ : STD_LOGIC;
  signal \reclock_wr_addrgray[6].sync_wr_addrgray_n_1\ : STD_LOGIC;
  signal remove_idle0 : STD_LOGIC;
  signal remove_idle_i_2_n_0 : STD_LOGIC;
  signal remove_idle_i_3_n_0 : STD_LOGIC;
  signal remove_idle_i_4_n_0 : STD_LOGIC;
  signal remove_idle_i_5_n_0 : STD_LOGIC;
  signal remove_idle_i_6_n_0 : STD_LOGIC;
  signal remove_idle_reg2 : STD_LOGIC;
  signal remove_idle_reg3 : STD_LOGIC;
  signal remove_idle_reg4 : STD_LOGIC;
  signal \^remove_idle_reg_reg_0\ : STD_LOGIC;
  signal reset_modified : STD_LOGIC;
  signal reset_modified_i_1_n_0 : STD_LOGIC;
  signal rxchariscomma_usr_i_1_n_0 : STD_LOGIC;
  signal rxchariscomma_usr_i_2_n_0 : STD_LOGIC;
  signal rxcharisk_usr_i_1_n_0 : STD_LOGIC;
  signal \^rxclkcorcnt\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \rxclkcorcnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata_usr[0]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata_usr[1]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata_usr[2]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata_usr[3]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata_usr[4]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata_usr[5]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata_usr[6]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata_usr[7]_i_1_n_0\ : STD_LOGIC;
  signal rxdisperr_usr_i_1_n_0 : STD_LOGIC;
  signal rxrundisp_usr_i_1_n_0 : STD_LOGIC;
  signal start : STD_LOGIC;
  signal wr_addr : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \wr_addr[5]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr[5]_i_2_n_0\ : STD_LOGIC;
  signal \wr_addr[6]_i_3_n_0\ : STD_LOGIC;
  signal wr_addr_gray : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal wr_addr_plus1 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \wr_addr_plus1[6]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_plus2[0]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_plus2[1]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_plus2[2]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_plus2[3]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_plus2[4]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_plus2[5]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_plus2[6]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_plus2[6]_i_2_n_0\ : STD_LOGIC;
  signal \wr_addr_plus2_reg_n_0_[0]\ : STD_LOGIC;
  signal \wr_addr_plus2_reg_n_0_[6]\ : STD_LOGIC;
  signal wr_data : STD_LOGIC_VECTOR ( 12 downto 8 );
  signal wr_data_reg : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \wr_data_reg_n_0_[0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7]\ : STD_LOGIC;
  signal wr_data_reg_reg : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal wr_occupancy : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal wr_occupancy00_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal wr_occupancy0_carry_n_2 : STD_LOGIC;
  signal wr_occupancy0_carry_n_3 : STD_LOGIC;
  signal wr_occupancy0_carry_n_4 : STD_LOGIC;
  signal wr_occupancy0_carry_n_5 : STD_LOGIC;
  signal wr_occupancy0_carry_n_6 : STD_LOGIC;
  signal wr_occupancy0_carry_n_7 : STD_LOGIC;
  signal wr_rd_addr_gray_0 : STD_LOGIC;
  signal wr_rd_addr_gray_2 : STD_LOGIC;
  signal wr_rd_addr_gray_3 : STD_LOGIC;
  signal wr_rd_addr_gray_4 : STD_LOGIC;
  signal wr_rd_addr_gray_5 : STD_LOGIC;
  signal wr_rd_addr_gray_6 : STD_LOGIC;
  signal NLW_ram_reg_0_63_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_7_13_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_64_127_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_64_127_7_13_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_rd_occupancy0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal NLW_rd_occupancy0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_wr_occupancy0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal NLW_wr_occupancy0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \__1/rd_data[0]_i_1\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \__1/rd_data[10]_i_1\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \__1/rd_data[11]_i_1\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \__1/rd_data[12]_i_1\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \__1/rd_data[13]_i_1\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \__1/rd_data[1]_i_1\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \__1/rd_data[2]_i_1\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \__1/rd_data[3]_i_1\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \__1/rd_data[4]_i_1\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \__1/rd_data[5]_i_1\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \__1/rd_data[6]_i_1\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \__1/rd_data[7]_i_1\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \__1/rd_data[8]_i_1\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \__1/rd_data[9]_i_1\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \d16p2_wr_pipe[0]_i_1\ : label is "soft_lutpair88";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/d21p5_wr_pipe_reg ";
  attribute srl_name : string;
  attribute srl_name of \d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0 ";
  attribute SOFT_HLUTNM of \d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_i_1\ : label is "soft_lutpair89";
  attribute srl_bus_name of \d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/d2p2_wr_pipe_reg ";
  attribute srl_name of \d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0 ";
  attribute SOFT_HLUTNM of \d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \initialize_counter[1]_i_1\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \initialize_counter[2]_i_1\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \initialize_counter[3]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \initialize_counter[4]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of insert_idle_i_10 : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of insert_idle_i_11 : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of insert_idle_i_4 : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of insert_idle_i_6 : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of insert_idle_i_7 : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \k28p5_wr_pipe[0]_i_1\ : label is "soft_lutpair89";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_63_0_6 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of ram_reg_0_63_0_6 : label is 1792;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of ram_reg_0_63_0_6 : label is "pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/ram";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of ram_reg_0_63_0_6 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of ram_reg_0_63_0_6 : label is 63;
  attribute ram_offset : integer;
  attribute ram_offset of ram_reg_0_63_0_6 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of ram_reg_0_63_0_6 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of ram_reg_0_63_0_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_63_7_13 : label is "";
  attribute RTL_RAM_BITS of ram_reg_0_63_7_13 : label is 1792;
  attribute RTL_RAM_NAME of ram_reg_0_63_7_13 : label is "pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/ram";
  attribute ram_addr_begin of ram_reg_0_63_7_13 : label is 0;
  attribute ram_addr_end of ram_reg_0_63_7_13 : label is 63;
  attribute ram_offset of ram_reg_0_63_7_13 : label is 0;
  attribute ram_slice_begin of ram_reg_0_63_7_13 : label is 7;
  attribute ram_slice_end of ram_reg_0_63_7_13 : label is 13;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_64_127_0_6 : label is "";
  attribute RTL_RAM_BITS of ram_reg_64_127_0_6 : label is 1792;
  attribute RTL_RAM_NAME of ram_reg_64_127_0_6 : label is "pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/ram";
  attribute ram_addr_begin of ram_reg_64_127_0_6 : label is 64;
  attribute ram_addr_end of ram_reg_64_127_0_6 : label is 127;
  attribute ram_offset of ram_reg_64_127_0_6 : label is 0;
  attribute ram_slice_begin of ram_reg_64_127_0_6 : label is 0;
  attribute ram_slice_end of ram_reg_64_127_0_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_64_127_7_13 : label is "";
  attribute RTL_RAM_BITS of ram_reg_64_127_7_13 : label is 1792;
  attribute RTL_RAM_NAME of ram_reg_64_127_7_13 : label is "pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/ram";
  attribute ram_addr_begin of ram_reg_64_127_7_13 : label is 64;
  attribute ram_addr_end of ram_reg_64_127_7_13 : label is 127;
  attribute ram_offset of ram_reg_64_127_7_13 : label is 0;
  attribute ram_slice_begin of ram_reg_64_127_7_13 : label is 7;
  attribute ram_slice_end of ram_reg_64_127_7_13 : label is 13;
  attribute SOFT_HLUTNM of \rd_addr_gray[0]_i_1\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of \rd_addr_gray[1]_i_1\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \rd_addr_gray[2]_i_1\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \rd_addr_gray[3]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \rd_addr_gray[4]_i_1\ : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of \rd_addr_gray[5]_i_1\ : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of \rd_addr_plus2[0]_i_1\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of \rd_addr_plus2[2]_i_1\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \rd_addr_plus2[3]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \rd_addr_plus2[4]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \rd_addr_plus2[6]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \rd_addr_plus2[6]_i_2\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of rxbuferr_i_3 : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of rxchariscomma_usr_i_2 : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of rxcharisk_usr_i_1 : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \rxdata_usr[0]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \rxdata_usr[2]_i_1\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \rxdata_usr[3]_i_1\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \rxdata_usr[4]_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \rxdata_usr[5]_i_1\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \rxdata_usr[6]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \rxdata_usr[7]_i_1\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of rxrundisp_usr_i_1 : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \wr_addr_gray[1]_i_1\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \wr_addr_gray[2]_i_1\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \wr_addr_gray[3]_i_1\ : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \wr_addr_gray[4]_i_1\ : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \wr_addr_plus1[6]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \wr_addr_plus2[0]_i_1\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \wr_addr_plus2[1]_i_1\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \wr_addr_plus2[2]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \wr_addr_plus2[3]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \wr_addr_plus2[4]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \wr_addr_plus2[6]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \wr_addr_plus2[6]_i_2\ : label is "soft_lutpair90";
begin
  D(0) <= \^d\(0);
  Q(2 downto 0) <= \^q\(2 downto 0);
  data_in <= \^data_in\;
  data_out <= \^data_out\;
  \initialize_counter_reg[5]_0\ <= \^initialize_counter_reg[5]_0\;
  initialize_ram_complete_pulse_reg_0 <= \^initialize_ram_complete_pulse_reg_0\;
  \insert_idle_reg__0\ <= \^insert_idle_reg__0\;
  \rd_data_reg_reg[13]_0\(0) <= \^rd_data_reg_reg[13]_0\(0);
  remove_idle_reg_reg_0 <= \^remove_idle_reg_reg_0\;
  rxclkcorcnt(1 downto 0) <= \^rxclkcorcnt\(1 downto 0);
\__1/ram_reg_64_127_0_6_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55750000"
    )
        port map (
      I0 => \^data_in\,
      I1 => \^d\(0),
      I2 => E(0),
      I3 => \^remove_idle_reg_reg_0\,
      I4 => wr_addr(6),
      O => \__1/ram_reg_64_127_0_6_i_1_n_0\
    );
\__1/rd_data[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_0_6_n_0,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_0_6_n_0,
      O => dpo(0)
    );
\__1/rd_data[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_7_13_n_3,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_7_13_n_3,
      O => dpo(10)
    );
\__1/rd_data[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_7_13_n_4,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_7_13_n_4,
      O => dpo(11)
    );
\__1/rd_data[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_7_13_n_5,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_7_13_n_5,
      O => dpo(12)
    );
\__1/rd_data[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_7_13_n_6,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_7_13_n_6,
      O => dpo(13)
    );
\__1/rd_data[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_0_6_n_1,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_0_6_n_1,
      O => dpo(1)
    );
\__1/rd_data[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_0_6_n_2,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_0_6_n_2,
      O => dpo(2)
    );
\__1/rd_data[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_0_6_n_3,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_0_6_n_3,
      O => dpo(3)
    );
\__1/rd_data[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_0_6_n_4,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_0_6_n_4,
      O => dpo(4)
    );
\__1/rd_data[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_0_6_n_5,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_0_6_n_5,
      O => dpo(5)
    );
\__1/rd_data[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_0_6_n_6,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_0_6_n_6,
      O => dpo(6)
    );
\__1/rd_data[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_7_13_n_0,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_7_13_n_0,
      O => dpo(7)
    );
\__1/rd_data[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_7_13_n_1,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_7_13_n_1,
      O => dpo(8)
    );
\__1/rd_data[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_7_13_n_2,
      I1 => rd_addr(6),
      I2 => ram_reg_0_63_7_13_n_2,
      O => dpo(9)
    );
\d16p2_wr_pipe[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \d16p2_wr_pipe[0]_i_2_n_0\,
      I1 => \wr_data_reg_n_0_[1]\,
      I2 => \wr_data_reg_n_0_[4]\,
      I3 => p_0_in,
      I4 => \wr_data_reg_n_0_[6]\,
      O => d16p2_wr
    );
\d16p2_wr_pipe[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \wr_data_reg_n_0_[3]\,
      I1 => \wr_data_reg_n_0_[2]\,
      I2 => \wr_data_reg_n_0_[7]\,
      I3 => \wr_data_reg_n_0_[0]\,
      I4 => \wr_data_reg_n_0_[5]\,
      O => \d16p2_wr_pipe[0]_i_2_n_0\
    );
\d16p2_wr_pipe_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => d16p2_wr,
      Q => \d16p2_wr_pipe_reg_n_0_[0]\,
      R => SR(0)
    );
\d16p2_wr_pipe_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \d16p2_wr_pipe_reg_n_0_[0]\,
      Q => p_4_in9_in,
      R => SR(0)
    );
\d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => E(0),
      CLK => Rx_SysClk,
      D => d21p5_wr,
      Q => \d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0\
    );
\d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \k28p5_wr_pipe[0]_i_2_n_0\,
      I1 => \wr_data_reg_n_0_[3]\,
      I2 => \wr_data_reg_n_0_[0]\,
      I3 => p_0_in,
      I4 => \wr_data_reg_n_0_[5]\,
      O => d21p5_wr
    );
\d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0\,
      Q => \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0\,
      R => '0'
    );
\d21p5_wr_pipe_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \d21p5_wr_pipe_reg[3]_0\,
      Q => d21p5_wr_pipe(3),
      R => SR(0)
    );
\d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => E(0),
      CLK => Rx_SysClk,
      D => d2p2_wr,
      Q => \d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0\
    );
\d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \d16p2_wr_pipe[0]_i_2_n_0\,
      I1 => \wr_data_reg_n_0_[4]\,
      I2 => \wr_data_reg_n_0_[1]\,
      I3 => p_0_in,
      I4 => \wr_data_reg_n_0_[6]\,
      O => d2p2_wr
    );
\d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0\,
      Q => \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0\,
      R => '0'
    );
\d2p2_wr_pipe_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \d2p2_wr_pipe_reg[3]_0\,
      Q => d2p2_wr_pipe(3),
      R => SR(0)
    );
even_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444454555555"
    )
        port map (
      I0 => even,
      I1 => even_i_2_n_0,
      I2 => insert_idle_i_6_n_0,
      I3 => insert_idle_i_4_n_0,
      I4 => insert_idle_i_3_n_0,
      I5 => insert_idle_i_2_n_0,
      O => even_i_1_n_0
    );
even_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
        port map (
      I0 => even_i_3_n_0,
      I1 => insert_idle_i_11_n_0,
      I2 => insert_idle_i_10_n_0,
      I3 => \rd_data_reg_reg_n_0_[1]\,
      I4 => p_1_in3_in,
      I5 => insert_idle,
      O => even_i_2_n_0
    );
even_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rd_occupancy(1),
      I1 => rd_occupancy(0),
      I2 => rd_occupancy(3),
      I3 => rd_occupancy(2),
      I4 => \^q\(0),
      I5 => \^q\(1),
      O => even_i_3_n_0
    );
even_reg: unisim.vcomponents.FDSE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => even_i_1_n_0,
      Q => even,
      S => reset_modified
    );
\initialize_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => initialize_counter_reg(0),
      O => \p_0_in__0\(0)
    );
\initialize_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => initialize_counter_reg(0),
      I1 => initialize_counter_reg(1),
      O => \p_0_in__0\(1)
    );
\initialize_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => initialize_counter_reg(2),
      I1 => initialize_counter_reg(1),
      I2 => initialize_counter_reg(0),
      O => \p_0_in__0\(2)
    );
\initialize_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => initialize_counter_reg(3),
      I1 => initialize_counter_reg(0),
      I2 => initialize_counter_reg(1),
      I3 => initialize_counter_reg(2),
      O => \p_0_in__0\(3)
    );
\initialize_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => initialize_counter_reg(4),
      I1 => initialize_counter_reg(2),
      I2 => initialize_counter_reg(1),
      I3 => initialize_counter_reg(0),
      I4 => initialize_counter_reg(3),
      O => \p_0_in__0\(4)
    );
\initialize_counter[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialize_ram,
      I1 => \^initialize_counter_reg[5]_0\,
      O => initialize_counter0
    );
\initialize_counter[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => initialize_counter_reg(5),
      I1 => initialize_counter_reg(3),
      I2 => initialize_counter_reg(0),
      I3 => initialize_counter_reg(1),
      I4 => initialize_counter_reg(2),
      I5 => initialize_counter_reg(4),
      O => \p_0_in__0\(5)
    );
\initialize_counter[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => initialize_counter_reg(5),
      I1 => initialize_counter_reg(3),
      I2 => initialize_counter_reg(0),
      I3 => initialize_counter_reg(1),
      I4 => initialize_counter_reg(2),
      I5 => initialize_counter_reg(4),
      O => \^initialize_counter_reg[5]_0\
    );
\initialize_counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => initialize_counter0,
      D => \p_0_in__0\(0),
      Q => initialize_counter_reg(0),
      R => initialize_ram0
    );
\initialize_counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => initialize_counter0,
      D => \p_0_in__0\(1),
      Q => initialize_counter_reg(1),
      R => initialize_ram0
    );
\initialize_counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => initialize_counter0,
      D => \p_0_in__0\(2),
      Q => initialize_counter_reg(2),
      R => initialize_ram0
    );
\initialize_counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => initialize_counter0,
      D => \p_0_in__0\(3),
      Q => initialize_counter_reg(3),
      R => initialize_ram0
    );
\initialize_counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => initialize_counter0,
      D => \p_0_in__0\(4),
      Q => initialize_counter_reg(4),
      R => initialize_ram0
    );
\initialize_counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => initialize_counter0,
      D => \p_0_in__0\(5),
      Q => initialize_counter_reg(5),
      R => initialize_ram0
    );
initialize_ram_complete_pulse_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^data_in\,
      I1 => \initialize_ram_complete_reg__0\,
      O => initialize_ram_complete_pulse0
    );
initialize_ram_complete_pulse_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => initialize_ram_complete_pulse0,
      Q => \^initialize_ram_complete_pulse_reg_0\,
      R => initialize_ram0
    );
initialize_ram_complete_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => initialize_ram_complete_reg_0,
      Q => \^data_in\,
      R => initialize_ram0
    );
initialize_ram_complete_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => start,
      I1 => reset_out,
      I2 => \initialize_counter_reg[5]_1\,
      O => initialize_ram0
    );
initialize_ram_complete_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => \^data_in\,
      Q => \initialize_ram_complete_reg__0\,
      R => initialize_ram0
    );
initialize_ram_complete_sync_reg1_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \^data_out\,
      Q => initialize_ram_complete_sync_reg1,
      R => '0'
    );
initialize_ram_complete_sync_ris_edg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => initialize_ram_complete_sync_ris_edg0,
      Q => initialize_ram_complete_sync_ris_edg,
      R => '0'
    );
initialize_ram_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => initialize_ram,
      I1 => \^data_in\,
      O => initialize_ram_i_1_n_0
    );
initialize_ram_reg: unisim.vcomponents.FDSE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => initialize_ram_i_1_n_0,
      Q => initialize_ram,
      S => initialize_ram0
    );
insert_idle_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00EA000000EA"
    )
        port map (
      I0 => insert_idle_i_2_n_0,
      I1 => insert_idle_i_3_n_0,
      I2 => insert_idle_i_4_n_0,
      I3 => insert_idle_i_5_n_0,
      I4 => insert_idle_i_6_n_0,
      I5 => insert_idle_i_7_n_0,
      O => even0
    );
insert_idle_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \rd_data_reg_reg_n_0_[3]\,
      I1 => \rd_data_reg_reg_n_0_[0]\,
      I2 => \rd_data_reg_reg_n_0_[5]\,
      I3 => \rd_data_reg_n_0_[11]\,
      O => insert_idle_i_10_n_0
    );
insert_idle_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => \rd_data_reg_reg_n_0_[7]\,
      I1 => \rd_data_reg_reg_n_0_[6]\,
      I2 => \rd_data_reg_reg_n_0_[2]\,
      I3 => \rd_data_reg_reg_n_0_[4]\,
      O => insert_idle_i_11_n_0
    );
insert_idle_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \rd_data_reg_n_0_[7]\,
      I1 => \rd_data_reg_n_0_[3]\,
      I2 => \rd_data_reg_n_0_[6]\,
      I3 => \rd_data_reg_n_0_[1]\,
      O => insert_idle_i_12_n_0
    );
insert_idle_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000800"
    )
        port map (
      I0 => insert_idle_i_8_n_0,
      I1 => \rd_data_reg_n_0_[6]\,
      I2 => \rd_data_reg_n_0_[1]\,
      I3 => \rd_data_reg_n_0_[4]\,
      I4 => \^q\(2),
      I5 => \rd_data_reg_n_0_[7]\,
      O => insert_idle_i_2_n_0
    );
insert_idle_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00200000"
    )
        port map (
      I0 => \rd_data_reg_n_0_[1]\,
      I1 => \rd_data_reg_n_0_[7]\,
      I2 => \rd_data_reg_n_0_[6]\,
      I3 => \rd_data_reg_n_0_[4]\,
      I4 => insert_idle_i_8_n_0,
      I5 => insert_idle_i_9_n_0,
      O => insert_idle_i_3_n_0
    );
insert_idle_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => insert_idle_i_4_n_0
    );
insert_idle_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => insert_idle,
      I1 => p_1_in3_in,
      I2 => \rd_data_reg_reg_n_0_[1]\,
      I3 => insert_idle_i_10_n_0,
      I4 => insert_idle_i_11_n_0,
      O => insert_idle_i_5_n_0
    );
insert_idle_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => rd_occupancy(2),
      I1 => rd_occupancy(3),
      I2 => rd_occupancy(0),
      I3 => rd_occupancy(1),
      O => insert_idle_i_6_n_0
    );
insert_idle_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => insert_idle_i_7_n_0
    );
insert_idle_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \rd_data_reg_n_0_[0]\,
      I1 => \rd_data_reg_n_0_[2]\,
      I2 => \rd_data_reg_n_0_[5]\,
      I3 => \rd_data_reg_n_0_[3]\,
      O => insert_idle_i_8_n_0
    );
insert_idle_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \rd_data_reg_n_0_[4]\,
      I1 => \rd_data_reg_n_0_[5]\,
      I2 => \rd_data_reg_n_0_[2]\,
      I3 => \rd_data_reg_n_0_[0]\,
      I4 => insert_idle_i_12_n_0,
      O => insert_idle_i_9_n_0
    );
insert_idle_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => even0,
      Q => insert_idle,
      R => reset_modified
    );
insert_idle_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => insert_idle,
      Q => \^insert_idle_reg__0\,
      R => reset_modified
    );
\k28p5_wr_pipe[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \k28p5_wr_pipe[0]_i_2_n_0\,
      I1 => \wr_data_reg_n_0_[3]\,
      I2 => \wr_data_reg_n_0_[5]\,
      I3 => \wr_data_reg_n_0_[0]\,
      I4 => p_0_in,
      O => p_3_out(0)
    );
\k28p5_wr_pipe[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => \wr_data_reg_n_0_[4]\,
      I1 => \wr_data_reg_n_0_[2]\,
      I2 => \wr_data_reg_n_0_[1]\,
      I3 => \wr_data_reg_n_0_[7]\,
      I4 => \wr_data_reg_n_0_[6]\,
      O => \k28p5_wr_pipe[0]_i_2_n_0\
    );
\k28p5_wr_pipe_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => p_3_out(0),
      Q => \k28p5_wr_pipe_reg_n_0_[0]\,
      R => SR(0)
    );
\k28p5_wr_pipe_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \k28p5_wr_pipe_reg_n_0_[0]\,
      Q => \k28p5_wr_pipe_reg_n_0_[1]\,
      R => SR(0)
    );
\k28p5_wr_pipe_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \k28p5_wr_pipe_reg_n_0_[1]\,
      Q => \k28p5_wr_pipe_reg_n_0_[2]\,
      R => SR(0)
    );
\k28p5_wr_pipe_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \k28p5_wr_pipe_reg_n_0_[2]\,
      Q => \k28p5_wr_pipe_reg_n_0_[3]\,
      R => SR(0)
    );
\k28p5_wr_pipe_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \k28p5_wr_pipe_reg_n_0_[3]\,
      Q => \k28p5_wr_pipe_reg_n_0_[4]\,
      R => SR(0)
    );
ram_reg_0_63_0_6: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5 downto 0) => rd_addr(5 downto 0),
      ADDRB(5 downto 0) => rd_addr(5 downto 0),
      ADDRC(5 downto 0) => rd_addr(5 downto 0),
      ADDRD(5 downto 0) => rd_addr(5 downto 0),
      ADDRE(5 downto 0) => rd_addr(5 downto 0),
      ADDRF(5 downto 0) => rd_addr(5 downto 0),
      ADDRG(5 downto 0) => rd_addr(5 downto 0),
      ADDRH(5 downto 0) => wr_addr(5 downto 0),
      DIA => wr_data_reg_reg(0),
      DIB => wr_data_reg_reg(1),
      DIC => wr_data_reg_reg(2),
      DID => wr_data_reg_reg(3),
      DIE => wr_data_reg_reg(4),
      DIF => wr_data_reg_reg(5),
      DIG => wr_data_reg_reg(6),
      DIH => '0',
      DOA => ram_reg_0_63_0_6_n_0,
      DOB => ram_reg_0_63_0_6_n_1,
      DOC => ram_reg_0_63_0_6_n_2,
      DOD => ram_reg_0_63_0_6_n_3,
      DOE => ram_reg_0_63_0_6_n_4,
      DOF => ram_reg_0_63_0_6_n_5,
      DOG => ram_reg_0_63_0_6_n_6,
      DOH => NLW_ram_reg_0_63_0_6_DOH_UNCONNECTED,
      WCLK => Rx_SysClk,
      WE => ram_reg_0_63_0_6_i_1_n_0
    );
ram_reg_0_63_0_6_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005575"
    )
        port map (
      I0 => \^data_in\,
      I1 => \^d\(0),
      I2 => E(0),
      I3 => \^remove_idle_reg_reg_0\,
      I4 => wr_addr(6),
      O => ram_reg_0_63_0_6_i_1_n_0
    );
ram_reg_0_63_7_13: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5 downto 0) => rd_addr(5 downto 0),
      ADDRB(5 downto 0) => rd_addr(5 downto 0),
      ADDRC(5 downto 0) => rd_addr(5 downto 0),
      ADDRD(5 downto 0) => rd_addr(5 downto 0),
      ADDRE(5 downto 0) => rd_addr(5 downto 0),
      ADDRF(5 downto 0) => rd_addr(5 downto 0),
      ADDRG(5 downto 0) => rd_addr(5 downto 0),
      ADDRH(5 downto 0) => wr_addr(5 downto 0),
      DIA => wr_data_reg_reg(7),
      DIB => wr_data_reg_reg(8),
      DIC => wr_data_reg_reg(9),
      DID => wr_data_reg_reg(10),
      DIE => wr_data_reg_reg(11),
      DIF => wr_data_reg_reg(12),
      DIG => wr_data_reg_reg(13),
      DIH => '0',
      DOA => ram_reg_0_63_7_13_n_0,
      DOB => ram_reg_0_63_7_13_n_1,
      DOC => ram_reg_0_63_7_13_n_2,
      DOD => ram_reg_0_63_7_13_n_3,
      DOE => ram_reg_0_63_7_13_n_4,
      DOF => ram_reg_0_63_7_13_n_5,
      DOG => ram_reg_0_63_7_13_n_6,
      DOH => NLW_ram_reg_0_63_7_13_DOH_UNCONNECTED,
      WCLK => Rx_SysClk,
      WE => ram_reg_0_63_0_6_i_1_n_0
    );
ram_reg_64_127_0_6: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5 downto 0) => rd_addr(5 downto 0),
      ADDRB(5 downto 0) => rd_addr(5 downto 0),
      ADDRC(5 downto 0) => rd_addr(5 downto 0),
      ADDRD(5 downto 0) => rd_addr(5 downto 0),
      ADDRE(5 downto 0) => rd_addr(5 downto 0),
      ADDRF(5 downto 0) => rd_addr(5 downto 0),
      ADDRG(5 downto 0) => rd_addr(5 downto 0),
      ADDRH(5 downto 0) => wr_addr(5 downto 0),
      DIA => wr_data_reg_reg(0),
      DIB => wr_data_reg_reg(1),
      DIC => wr_data_reg_reg(2),
      DID => wr_data_reg_reg(3),
      DIE => wr_data_reg_reg(4),
      DIF => wr_data_reg_reg(5),
      DIG => wr_data_reg_reg(6),
      DIH => '0',
      DOA => ram_reg_64_127_0_6_n_0,
      DOB => ram_reg_64_127_0_6_n_1,
      DOC => ram_reg_64_127_0_6_n_2,
      DOD => ram_reg_64_127_0_6_n_3,
      DOE => ram_reg_64_127_0_6_n_4,
      DOF => ram_reg_64_127_0_6_n_5,
      DOG => ram_reg_64_127_0_6_n_6,
      DOH => NLW_ram_reg_64_127_0_6_DOH_UNCONNECTED,
      WCLK => Rx_SysClk,
      WE => \__1/ram_reg_64_127_0_6_i_1_n_0\
    );
ram_reg_64_127_7_13: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5 downto 0) => rd_addr(5 downto 0),
      ADDRB(5 downto 0) => rd_addr(5 downto 0),
      ADDRC(5 downto 0) => rd_addr(5 downto 0),
      ADDRD(5 downto 0) => rd_addr(5 downto 0),
      ADDRE(5 downto 0) => rd_addr(5 downto 0),
      ADDRF(5 downto 0) => rd_addr(5 downto 0),
      ADDRG(5 downto 0) => rd_addr(5 downto 0),
      ADDRH(5 downto 0) => wr_addr(5 downto 0),
      DIA => wr_data_reg_reg(7),
      DIB => wr_data_reg_reg(8),
      DIC => wr_data_reg_reg(9),
      DID => wr_data_reg_reg(10),
      DIE => wr_data_reg_reg(11),
      DIF => wr_data_reg_reg(12),
      DIG => wr_data_reg_reg(13),
      DIH => '0',
      DOA => ram_reg_64_127_7_13_n_0,
      DOB => ram_reg_64_127_7_13_n_1,
      DOC => ram_reg_64_127_7_13_n_2,
      DOD => ram_reg_64_127_7_13_n_3,
      DOE => ram_reg_64_127_7_13_n_4,
      DOF => ram_reg_64_127_7_13_n_5,
      DOG => ram_reg_64_127_7_13_n_6,
      DOH => NLW_ram_reg_64_127_7_13_DOH_UNCONNECTED,
      WCLK => Rx_SysClk,
      WE => \__1/ram_reg_64_127_0_6_i_1_n_0\
    );
\rd_addr[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^insert_idle_reg__0\,
      I1 => insert_idle,
      O => rd_enable
    );
\rd_addr_gray[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rd_addr_plus2_reg_n_0_[0]\,
      I1 => p_1_in,
      O => \rd_addr_gray[0]_i_1_n_0\
    );
\rd_addr_gray[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_1_in,
      I1 => p_2_in20_in,
      O => \rd_addr_gray[1]_i_1_n_0\
    );
\rd_addr_gray[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_2_in20_in,
      I1 => p_3_in,
      O => \rd_addr_gray[2]_i_1_n_0\
    );
\rd_addr_gray[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_3_in,
      I1 => p_4_in23_in,
      O => \rd_addr_gray[3]_i_1_n_0\
    );
\rd_addr_gray[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_4_in23_in,
      I1 => p_5_in,
      O => \rd_addr_gray[4]_i_1_n_0\
    );
\rd_addr_gray[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_5_in,
      I1 => \rd_addr_plus2_reg_n_0_[6]\,
      O => \rd_addr_gray[5]_i_1_n_0\
    );
\rd_addr_gray_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \rd_addr_gray[0]_i_1_n_0\,
      Q => rd_addr_gray(0),
      R => reset_modified
    );
\rd_addr_gray_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \rd_addr_gray[1]_i_1_n_0\,
      Q => rd_addr_gray(1),
      R => reset_modified
    );
\rd_addr_gray_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \rd_addr_gray[2]_i_1_n_0\,
      Q => rd_addr_gray(2),
      R => reset_modified
    );
\rd_addr_gray_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \rd_addr_gray[3]_i_1_n_0\,
      Q => rd_addr_gray(3),
      R => reset_modified
    );
\rd_addr_gray_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \rd_addr_gray[4]_i_1_n_0\,
      Q => rd_addr_gray(4),
      R => reset_modified
    );
\rd_addr_gray_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \rd_addr_gray[5]_i_1_n_0\,
      Q => rd_addr_gray(5),
      R => reset_modified
    );
\rd_addr_plus1_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \rd_addr_plus2_reg_n_0_[0]\,
      Q => rd_addr_plus1(0),
      S => reset_modified
    );
\rd_addr_plus1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => p_1_in,
      Q => rd_addr_plus1(1),
      R => reset_modified
    );
\rd_addr_plus1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => p_2_in20_in,
      Q => rd_addr_plus1(2),
      R => reset_modified
    );
\rd_addr_plus1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => p_3_in,
      Q => rd_addr_plus1(3),
      R => reset_modified
    );
\rd_addr_plus1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => p_4_in23_in,
      Q => rd_addr_plus1(4),
      R => reset_modified
    );
\rd_addr_plus1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => p_5_in,
      Q => rd_addr_plus1(5),
      R => reset_modified
    );
\rd_addr_plus1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \rd_addr_plus2_reg_n_0_[6]\,
      Q => rd_addr_plus1(6),
      R => reset_modified
    );
\rd_addr_plus2[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \rd_addr_plus2_reg_n_0_[0]\,
      O => \p_0_in__1\(0)
    );
\rd_addr_plus2[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \rd_addr_plus2_reg_n_0_[0]\,
      I1 => p_1_in,
      I2 => p_2_in20_in,
      O => \p_0_in__1\(2)
    );
\rd_addr_plus2[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => p_3_in,
      I1 => \rd_addr_plus2_reg_n_0_[0]\,
      I2 => p_1_in,
      I3 => p_2_in20_in,
      O => \p_0_in__1\(3)
    );
\rd_addr_plus2[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => p_4_in23_in,
      I1 => p_2_in20_in,
      I2 => p_1_in,
      I3 => \rd_addr_plus2_reg_n_0_[0]\,
      I4 => p_3_in,
      O => \p_0_in__1\(4)
    );
\rd_addr_plus2[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => p_5_in,
      I1 => p_3_in,
      I2 => \rd_addr_plus2_reg_n_0_[0]\,
      I3 => p_1_in,
      I4 => p_2_in20_in,
      I5 => p_4_in23_in,
      O => \p_0_in__1\(5)
    );
\rd_addr_plus2[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \rd_addr_plus2_reg_n_0_[6]\,
      I1 => p_4_in23_in,
      I2 => \rd_addr_plus2[6]_i_2_n_0\,
      I3 => p_3_in,
      I4 => p_5_in,
      O => \p_0_in__1\(6)
    );
\rd_addr_plus2[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => p_2_in20_in,
      I1 => p_1_in,
      I2 => \rd_addr_plus2_reg_n_0_[0]\,
      O => \rd_addr_plus2[6]_i_2_n_0\
    );
\rd_addr_plus2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \p_0_in__1\(0),
      Q => \rd_addr_plus2_reg_n_0_[0]\,
      R => reset_modified
    );
\rd_addr_plus2_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \rd_addr_gray[0]_i_1_n_0\,
      Q => p_1_in,
      S => reset_modified
    );
\rd_addr_plus2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \p_0_in__1\(2),
      Q => p_2_in20_in,
      R => reset_modified
    );
\rd_addr_plus2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \p_0_in__1\(3),
      Q => p_3_in,
      R => reset_modified
    );
\rd_addr_plus2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \p_0_in__1\(4),
      Q => p_4_in23_in,
      R => reset_modified
    );
\rd_addr_plus2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \p_0_in__1\(5),
      Q => p_5_in,
      R => reset_modified
    );
\rd_addr_plus2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => \p_0_in__1\(6),
      Q => \rd_addr_plus2_reg_n_0_[6]\,
      R => reset_modified
    );
\rd_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => rd_addr_plus1(0),
      Q => rd_addr(0),
      R => reset_modified
    );
\rd_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => rd_addr_plus1(1),
      Q => rd_addr(1),
      R => reset_modified
    );
\rd_addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => rd_addr_plus1(2),
      Q => rd_addr(2),
      R => reset_modified
    );
\rd_addr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => rd_addr_plus1(3),
      Q => rd_addr(3),
      R => reset_modified
    );
\rd_addr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => rd_addr_plus1(4),
      Q => rd_addr(4),
      R => reset_modified
    );
\rd_addr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => rd_addr_plus1(5),
      Q => rd_addr(5),
      R => reset_modified
    );
\rd_addr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable,
      D => rd_addr_plus1(6),
      Q => rd_addr(6),
      R => reset_modified
    );
\rd_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(0),
      Q => \rd_data_reg_n_0_[0]\,
      R => reset_modified
    );
\rd_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(10),
      Q => \rd_data_reg_n_0_[10]\,
      R => reset_modified
    );
\rd_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(11),
      Q => \rd_data_reg_n_0_[11]\,
      R => reset_modified
    );
\rd_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(12),
      Q => \rd_data_reg_n_0_[12]\,
      R => reset_modified
    );
\rd_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(13),
      Q => \rd_data_reg_n_0_[13]\,
      R => reset_modified
    );
\rd_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(1),
      Q => \rd_data_reg_n_0_[1]\,
      R => reset_modified
    );
\rd_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(2),
      Q => \rd_data_reg_n_0_[2]\,
      R => reset_modified
    );
\rd_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(3),
      Q => \rd_data_reg_n_0_[3]\,
      R => reset_modified
    );
\rd_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(4),
      Q => \rd_data_reg_n_0_[4]\,
      R => reset_modified
    );
\rd_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(5),
      Q => \rd_data_reg_n_0_[5]\,
      R => reset_modified
    );
\rd_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(6),
      Q => \rd_data_reg_n_0_[6]\,
      R => reset_modified
    );
\rd_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(7),
      Q => \rd_data_reg_n_0_[7]\,
      R => reset_modified
    );
\rd_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(8),
      Q => p_2_in,
      R => reset_modified
    );
\rd_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => dpo(9),
      Q => \rd_data_reg_n_0_[9]\,
      R => reset_modified
    );
\rd_data_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[0]\,
      Q => \rd_data_reg_reg_n_0_[0]\,
      R => reset_modified
    );
\rd_data_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[10]\,
      Q => \rd_data_reg_reg_n_0_[10]\,
      R => reset_modified
    );
\rd_data_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[11]\,
      Q => p_1_in3_in,
      R => reset_modified
    );
\rd_data_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[12]\,
      Q => \rd_data_reg_reg_n_0_[12]\,
      R => reset_modified
    );
\rd_data_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[13]\,
      Q => \^rd_data_reg_reg[13]_0\(0),
      R => reset_modified
    );
\rd_data_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[1]\,
      Q => \rd_data_reg_reg_n_0_[1]\,
      R => reset_modified
    );
\rd_data_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[2]\,
      Q => \rd_data_reg_reg_n_0_[2]\,
      R => reset_modified
    );
\rd_data_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[3]\,
      Q => \rd_data_reg_reg_n_0_[3]\,
      R => reset_modified
    );
\rd_data_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[4]\,
      Q => \rd_data_reg_reg_n_0_[4]\,
      R => reset_modified
    );
\rd_data_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[5]\,
      Q => \rd_data_reg_reg_n_0_[5]\,
      R => reset_modified
    );
\rd_data_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[6]\,
      Q => \rd_data_reg_reg_n_0_[6]\,
      R => reset_modified
    );
\rd_data_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[7]\,
      Q => \rd_data_reg_reg_n_0_[7]\,
      R => reset_modified
    );
\rd_data_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => p_2_in,
      Q => \rd_data_reg_reg_n_0_[8]\,
      R => reset_modified
    );
\rd_data_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => rd_enable_reg,
      D => \rd_data_reg_n_0_[9]\,
      Q => \rd_data_reg_reg_n_0_[9]\,
      R => reset_modified
    );
rd_enable_reg_reg: unisim.vcomponents.FDSE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rd_enable,
      Q => rd_enable_reg,
      S => reset_modified
    );
rd_occupancy0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7 downto 6) => NLW_rd_occupancy0_carry_CO_UNCONNECTED(7 downto 6),
      CO(5) => rd_occupancy0_carry_n_2,
      CO(4) => rd_occupancy0_carry_n_3,
      CO(3) => rd_occupancy0_carry_n_4,
      CO(2) => rd_occupancy0_carry_n_5,
      CO(1) => rd_occupancy0_carry_n_6,
      CO(0) => rd_occupancy0_carry_n_7,
      DI(7 downto 6) => B"00",
      DI(5 downto 0) => rd_wr_addr(5 downto 0),
      O(7) => NLW_rd_occupancy0_carry_O_UNCONNECTED(7),
      O(6 downto 0) => rd_occupancy01_out(6 downto 0),
      S(7) => '0',
      S(6) => \reclock_wr_addrgray[6].sync_wr_addrgray_n_0\,
      S(5) => \reclock_wr_addrgray[6].sync_wr_addrgray_n_1\,
      S(4) => \reclock_wr_addrgray[5].sync_wr_addrgray_n_0\,
      S(3) => \reclock_wr_addrgray[4].sync_wr_addrgray_n_0\,
      S(2) => \reclock_wr_addrgray[3].sync_wr_addrgray_n_0\,
      S(1) => \reclock_wr_addrgray[1].sync_wr_addrgray_n_0\,
      S(0) => \reclock_wr_addrgray[1].sync_wr_addrgray_n_1\
    );
rd_occupancy0_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_1_out,
      I1 => rd_wr_addr_gray_6,
      O => rd_wr_addr(5)
    );
rd_occupancy0_carry_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => p_2_out,
      I1 => rd_wr_addr_gray_6,
      I2 => p_1_out,
      O => rd_wr_addr(4)
    );
rd_occupancy0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => rd_wr_addr_gray_3,
      I1 => p_1_out,
      I2 => rd_wr_addr_gray_6,
      I3 => p_2_out,
      O => rd_wr_addr(3)
    );
rd_occupancy0_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => p_4_out,
      I1 => p_2_out,
      I2 => rd_wr_addr_gray_6,
      I3 => p_1_out,
      I4 => rd_wr_addr_gray_3,
      O => rd_wr_addr(2)
    );
rd_occupancy0_carry_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => p_5_out,
      I1 => rd_wr_addr_gray_3,
      I2 => p_1_out,
      I3 => rd_wr_addr_gray_6,
      I4 => p_2_out,
      I5 => p_4_out,
      O => rd_wr_addr(1)
    );
rd_occupancy0_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rd_wr_addr_gray_0,
      I1 => rd_wr_addr(1),
      O => rd_wr_addr(0)
    );
\rd_occupancy_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rd_occupancy01_out(0),
      Q => rd_occupancy(0),
      R => reset_modified
    );
\rd_occupancy_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rd_occupancy01_out(1),
      Q => rd_occupancy(1),
      R => reset_modified
    );
\rd_occupancy_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rd_occupancy01_out(2),
      Q => rd_occupancy(2),
      R => reset_modified
    );
\rd_occupancy_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rd_occupancy01_out(3),
      Q => rd_occupancy(3),
      R => reset_modified
    );
\rd_occupancy_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rd_occupancy01_out(4),
      Q => \^q\(0),
      R => reset_modified
    );
\rd_occupancy_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rd_occupancy01_out(5),
      Q => \^q\(1),
      R => reset_modified
    );
\rd_occupancy_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rd_occupancy01_out(6),
      Q => \^q\(2),
      S => reset_modified
    );
\reclock_rd_addrgray[0].sync_rd_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7
     port map (
      Q(0) => rd_addr_gray(0),
      Rx_SysClk => Rx_SysClk,
      data_out => wr_rd_addr_gray_0
    );
\reclock_rd_addrgray[1].sync_rd_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8
     port map (
      Q(1 downto 0) => wr_addr(1 downto 0),
      Rx_SysClk => Rx_SysClk,
      S(1) => \reclock_rd_addrgray[1].sync_rd_addrgray_n_0\,
      S(0) => \reclock_rd_addrgray[1].sync_rd_addrgray_n_1\,
      data_out => wr_rd_addr_gray_3,
      data_sync_reg1_0(0) => rd_addr_gray(1),
      wr_occupancy0_carry_i_7_0 => wr_rd_addr_gray_5,
      wr_occupancy0_carry_i_7_1 => wr_rd_addr_gray_6,
      wr_occupancy0_carry_i_7_2 => wr_rd_addr_gray_4,
      wr_occupancy0_carry_i_7_3 => wr_rd_addr_gray_2,
      \wr_occupancy_reg[6]\ => wr_rd_addr_gray_0
    );
\reclock_rd_addrgray[2].sync_rd_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9
     port map (
      Q(0) => rd_addr_gray(2),
      Rx_SysClk => Rx_SysClk,
      data_out => wr_rd_addr_gray_2
    );
\reclock_rd_addrgray[3].sync_rd_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10
     port map (
      Q(0) => wr_addr(2),
      Rx_SysClk => Rx_SysClk,
      S(0) => \reclock_rd_addrgray[3].sync_rd_addrgray_n_0\,
      data_out => wr_rd_addr_gray_3,
      data_sync_reg1_0(0) => rd_addr_gray(3),
      \wr_occupancy_reg[6]\ => wr_rd_addr_gray_5,
      \wr_occupancy_reg[6]_0\ => wr_rd_addr_gray_6,
      \wr_occupancy_reg[6]_1\ => wr_rd_addr_gray_4,
      \wr_occupancy_reg[6]_2\ => wr_rd_addr_gray_2
    );
\reclock_rd_addrgray[4].sync_rd_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11
     port map (
      Q(0) => wr_addr(3),
      Rx_SysClk => Rx_SysClk,
      S(0) => \reclock_rd_addrgray[4].sync_rd_addrgray_n_0\,
      data_out => wr_rd_addr_gray_4,
      data_sync_reg1_0(0) => rd_addr_gray(4),
      \wr_occupancy_reg[6]\ => wr_rd_addr_gray_6,
      \wr_occupancy_reg[6]_0\ => wr_rd_addr_gray_5,
      \wr_occupancy_reg[6]_1\ => wr_rd_addr_gray_3
    );
\reclock_rd_addrgray[5].sync_rd_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12
     port map (
      Q(0) => wr_addr(4),
      Rx_SysClk => Rx_SysClk,
      S(0) => \reclock_rd_addrgray[5].sync_rd_addrgray_n_0\,
      data_out => wr_rd_addr_gray_5,
      data_sync_reg1_0(0) => rd_addr_gray(5),
      \wr_occupancy_reg[6]\ => wr_rd_addr_gray_6,
      \wr_occupancy_reg[6]_0\ => wr_rd_addr_gray_4
    );
\reclock_rd_addrgray[6].sync_rd_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13
     port map (
      Q(1 downto 0) => wr_addr(6 downto 5),
      Rx_SysClk => Rx_SysClk,
      S(1) => \reclock_rd_addrgray[6].sync_rd_addrgray_n_0\,
      S(0) => \reclock_rd_addrgray[6].sync_rd_addrgray_n_1\,
      data_in => rd_addr_plus1(6),
      data_out => wr_rd_addr_gray_6,
      \wr_occupancy_reg[6]\ => wr_rd_addr_gray_5
    );
\reclock_wr_addrgray[0].sync_wr_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14
     port map (
      Q(0) => wr_addr_gray(0),
      Tx_WrClk => Tx_WrClk,
      data_out => rd_wr_addr_gray_0
    );
\reclock_wr_addrgray[1].sync_wr_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15
     port map (
      Q(1 downto 0) => rd_addr(1 downto 0),
      S(1) => \reclock_wr_addrgray[1].sync_wr_addrgray_n_0\,
      S(0) => \reclock_wr_addrgray[1].sync_wr_addrgray_n_1\,
      Tx_WrClk => Tx_WrClk,
      data_out => rd_wr_addr_gray_0,
      data_sync_reg1_0(0) => wr_addr_gray(1),
      data_sync_reg6_0 => p_5_out,
      rd_wr_addr(0) => rd_wr_addr(1)
    );
\reclock_wr_addrgray[2].sync_wr_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16
     port map (
      Q(0) => wr_addr_gray(2),
      Tx_WrClk => Tx_WrClk,
      data_out => p_4_out
    );
\reclock_wr_addrgray[3].sync_wr_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_17
     port map (
      Q(0) => rd_addr(2),
      S(0) => \reclock_wr_addrgray[3].sync_wr_addrgray_n_0\,
      Tx_WrClk => Tx_WrClk,
      data_out => rd_wr_addr_gray_3,
      data_sync_reg1_0(0) => wr_addr_gray(3),
      \rd_occupancy_reg[6]\ => p_1_out,
      \rd_occupancy_reg[6]_0\ => rd_wr_addr_gray_6,
      \rd_occupancy_reg[6]_1\ => p_2_out,
      \rd_occupancy_reg[6]_2\ => p_4_out
    );
\reclock_wr_addrgray[4].sync_wr_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_18
     port map (
      Q(0) => rd_addr(3),
      S(0) => \reclock_wr_addrgray[4].sync_wr_addrgray_n_0\,
      Tx_WrClk => Tx_WrClk,
      data_out => p_2_out,
      data_sync_reg1_0(0) => wr_addr_gray(4),
      \rd_occupancy_reg[6]\ => rd_wr_addr_gray_6,
      \rd_occupancy_reg[6]_0\ => p_1_out,
      \rd_occupancy_reg[6]_1\ => rd_wr_addr_gray_3
    );
\reclock_wr_addrgray[5].sync_wr_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_19
     port map (
      Q(0) => rd_addr(4),
      S(0) => \reclock_wr_addrgray[5].sync_wr_addrgray_n_0\,
      Tx_WrClk => Tx_WrClk,
      data_out => p_1_out,
      data_sync_reg1_0(0) => wr_addr_gray(5),
      \rd_occupancy_reg[6]\ => rd_wr_addr_gray_6,
      \rd_occupancy_reg[6]_0\ => p_2_out
    );
\reclock_wr_addrgray[6].sync_wr_addrgray\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_20
     port map (
      Q(1 downto 0) => rd_addr(6 downto 5),
      S(1) => \reclock_wr_addrgray[6].sync_wr_addrgray_n_0\,
      S(0) => \reclock_wr_addrgray[6].sync_wr_addrgray_n_1\,
      Tx_WrClk => Tx_WrClk,
      data_out => rd_wr_addr_gray_6,
      data_sync_reg1_0(0) => wr_addr_gray(6),
      \rd_occupancy_reg[6]\ => p_1_out
    );
remove_idle_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00E00000"
    )
        port map (
      I0 => remove_idle_i_2_n_0,
      I1 => remove_idle_i_3_n_0,
      I2 => \k28p5_wr_pipe_reg_n_0_[0]\,
      I3 => \^d\(0),
      I4 => wr_occupancy(6),
      O => remove_idle0
    );
remove_idle_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808080800080"
    )
        port map (
      I0 => d16p2_wr,
      I1 => p_4_in9_in,
      I2 => \k28p5_wr_pipe_reg_n_0_[2]\,
      I3 => remove_idle_i_4_n_0,
      I4 => wr_occupancy(5),
      I5 => wr_occupancy(1),
      O => remove_idle_i_2_n_0
    );
remove_idle_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0E0E0E0E0E0E000E"
    )
        port map (
      I0 => d21p5_wr,
      I1 => d2p2_wr,
      I2 => remove_idle_i_5_n_0,
      I3 => remove_idle_i_4_n_0,
      I4 => wr_occupancy(1),
      I5 => wr_occupancy(0),
      O => remove_idle_i_3_n_0
    );
remove_idle_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => wr_occupancy(2),
      I1 => wr_occupancy(4),
      I2 => wr_occupancy(3),
      O => remove_idle_i_4_n_0
    );
remove_idle_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => remove_idle_reg3,
      I1 => wr_occupancy(5),
      I2 => remove_idle_reg4,
      I3 => \k28p5_wr_pipe_reg_n_0_[4]\,
      I4 => remove_idle_i_6_n_0,
      O => remove_idle_i_5_n_0
    );
remove_idle_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF1"
    )
        port map (
      I0 => d21p5_wr_pipe(3),
      I1 => d2p2_wr_pipe(3),
      I2 => \^remove_idle_reg_reg_0\,
      I3 => remove_idle_reg2,
      O => remove_idle_i_6_n_0
    );
remove_idle_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => remove_idle0,
      Q => \^d\(0),
      R => SR(0)
    );
remove_idle_reg2_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \^remove_idle_reg_reg_0\,
      Q => remove_idle_reg2,
      R => SR(0)
    );
remove_idle_reg3_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => remove_idle_reg2,
      Q => remove_idle_reg3,
      R => SR(0)
    );
remove_idle_reg4_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => remove_idle_reg3,
      Q => remove_idle_reg4,
      R => SR(0)
    );
remove_idle_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \^d\(0),
      Q => \^remove_idle_reg_reg_0\,
      R => SR(0)
    );
reset_modified_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"77777774"
    )
        port map (
      I0 => initialize_ram_complete_sync_ris_edg,
      I1 => reset_modified,
      I2 => reset_modified_reg_0,
      I3 => mgt_rx_reset,
      I4 => elastic_buffer_rst_125,
      O => reset_modified_i_1_n_0
    );
reset_modified_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Tx_WrClk,
      CE => '1',
      D => reset_modified_i_1_n_0,
      Q => reset_modified,
      R => '0'
    );
rxbuferr_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040400000000000"
    )
        port map (
      I0 => insert_idle_i_7_n_0,
      I1 => rd_occupancy(3),
      I2 => rd_occupancy(2),
      I3 => rd_occupancy(1),
      I4 => rd_occupancy(0),
      I5 => \^q\(2),
      O => \rd_occupancy_reg[3]_0\
    );
rxbuferr_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF8"
    )
        port map (
      I0 => rd_occupancy(0),
      I1 => rd_occupancy(1),
      I2 => rd_occupancy(2),
      I3 => rd_occupancy(3),
      O => \rd_occupancy_reg[0]_0\
    );
rxbuferr_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rxbuferr_reg_0,
      Q => rxbufstatus(0),
      R => reset_modified
    );
rxchariscomma_usr_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => reset_modified,
      I1 => rd_enable_reg,
      I2 => even,
      O => rxchariscomma_usr_i_1_n_0
    );
rxchariscomma_usr_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \rd_data_reg_reg_n_0_[12]\,
      I1 => rd_enable_reg,
      I2 => even,
      O => rxchariscomma_usr_i_2_n_0
    );
rxchariscomma_usr_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rxchariscomma_usr_i_2_n_0,
      Q => rxchariscomma_usr_reg_0,
      R => rxchariscomma_usr_i_1_n_0
    );
rxcharisk_usr_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => p_1_in3_in,
      I1 => rd_enable_reg,
      I2 => even,
      O => rxcharisk_usr_i_1_n_0
    );
rxcharisk_usr_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rxcharisk_usr_i_1_n_0,
      Q => rxcharisk_usr_reg_0,
      R => rxchariscomma_usr_i_1_n_0
    );
\rxclkcorcnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000440C"
    )
        port map (
      I0 => \^rxclkcorcnt\(1),
      I1 => \^insert_idle_reg__0\,
      I2 => \^rd_data_reg_reg[13]_0\(0),
      I3 => \^rxclkcorcnt\(0),
      I4 => reset_modified,
      O => \rxclkcorcnt[2]_i_1_n_0\
    );
\rxclkcorcnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rxclkcorcnt_reg[0]_0\,
      Q => \^rxclkcorcnt\(0),
      R => reset_modified
    );
\rxclkcorcnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rxclkcorcnt[2]_i_1_n_0\,
      Q => \^rxclkcorcnt\(1),
      R => '0'
    );
\rxdata_usr[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \rd_data_reg_reg_n_0_[0]\,
      I1 => rd_enable_reg,
      O => \rxdata_usr[0]_i_1_n_0\
    );
\rxdata_usr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \rd_data_reg_reg_n_0_[1]\,
      I1 => rd_enable_reg,
      O => \rxdata_usr[1]_i_1_n_0\
    );
\rxdata_usr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rd_data_reg_reg_n_0_[2]\,
      I1 => rd_enable_reg,
      I2 => even,
      O => \rxdata_usr[2]_i_1_n_0\
    );
\rxdata_usr[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rd_data_reg_reg_n_0_[3]\,
      I1 => rd_enable_reg,
      I2 => even,
      O => \rxdata_usr[3]_i_1_n_0\
    );
\rxdata_usr[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"D"
    )
        port map (
      I0 => rd_enable_reg,
      I1 => \rd_data_reg_reg_n_0_[4]\,
      O => \rxdata_usr[4]_i_1_n_0\
    );
\rxdata_usr[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rd_data_reg_reg_n_0_[5]\,
      I1 => rd_enable_reg,
      I2 => even,
      O => \rxdata_usr[5]_i_1_n_0\
    );
\rxdata_usr[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C5"
    )
        port map (
      I0 => even,
      I1 => \rd_data_reg_reg_n_0_[6]\,
      I2 => rd_enable_reg,
      O => \rxdata_usr[6]_i_1_n_0\
    );
\rxdata_usr[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rd_data_reg_reg_n_0_[7]\,
      I1 => rd_enable_reg,
      I2 => even,
      O => \rxdata_usr[7]_i_1_n_0\
    );
\rxdata_usr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rxdata_usr[0]_i_1_n_0\,
      Q => \rxdata_usr_reg[7]_0\(0),
      R => reset_modified
    );
\rxdata_usr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rxdata_usr[1]_i_1_n_0\,
      Q => \rxdata_usr_reg[7]_0\(1),
      R => reset_modified
    );
\rxdata_usr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rxdata_usr[2]_i_1_n_0\,
      Q => \rxdata_usr_reg[7]_0\(2),
      R => reset_modified
    );
\rxdata_usr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rxdata_usr[3]_i_1_n_0\,
      Q => \rxdata_usr_reg[7]_0\(3),
      R => reset_modified
    );
\rxdata_usr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rxdata_usr[4]_i_1_n_0\,
      Q => \rxdata_usr_reg[7]_0\(4),
      R => reset_modified
    );
\rxdata_usr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rxdata_usr[5]_i_1_n_0\,
      Q => \rxdata_usr_reg[7]_0\(5),
      R => reset_modified
    );
\rxdata_usr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rxdata_usr[6]_i_1_n_0\,
      Q => \rxdata_usr_reg[7]_0\(6),
      R => reset_modified
    );
\rxdata_usr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rxdata_usr[7]_i_1_n_0\,
      Q => \rxdata_usr_reg[7]_0\(7),
      R => reset_modified
    );
rxdisperr_usr_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset_modified,
      I1 => rd_enable_reg,
      O => rxdisperr_usr_i_1_n_0
    );
rxdisperr_usr_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rd_data_reg_reg_n_0_[10]\,
      Q => rxdisperr(0),
      R => rxdisperr_usr_i_1_n_0
    );
rxnotintable_usr_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => \rd_data_reg_reg_n_0_[9]\,
      Q => rxnotintable(0),
      R => rxdisperr_usr_i_1_n_0
    );
rxrundisp_usr_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => p_2_in,
      I1 => even,
      I2 => rd_enable_reg,
      I3 => \rd_data_reg_reg_n_0_[8]\,
      O => rxrundisp_usr_i_1_n_0
    );
rxrundisp_usr_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => '1',
      D => rxrundisp_usr_i_1_n_0,
      Q => rxrundisp(0),
      R => reset_modified
    );
start_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Rx_SysClk,
      CE => '1',
      D => '0',
      Q => start,
      R => '0'
    );
sync_initialize_ram_comp: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_21
     port map (
      Tx_WrClk => Tx_WrClk,
      data_out => \^data_out\,
      data_sync_reg1_0 => \^data_in\
    );
\wr_addr[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^initialize_ram_complete_pulse_reg_0\,
      I1 => reset_out,
      I2 => \initialize_counter_reg[5]_1\,
      O => \wr_addr[5]_i_1_n_0\
    );
\wr_addr[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"04FF"
    )
        port map (
      I0 => \^remove_idle_reg_reg_0\,
      I1 => E(0),
      I2 => \^d\(0),
      I3 => \^data_in\,
      O => \wr_addr[5]_i_2_n_0\
    );
\wr_addr[6]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => wr_addr_plus1(6),
      I1 => \^initialize_ram_complete_pulse_reg_0\,
      O => \wr_addr[6]_i_3_n_0\
    );
\wr_addr_gray[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_1_in28_in,
      I1 => p_2_in29_in,
      O => p_6_out(1)
    );
\wr_addr_gray[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_2_in29_in,
      I1 => p_3_in31_in,
      O => p_6_out(2)
    );
\wr_addr_gray[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_3_in31_in,
      I1 => p_4_in33_in,
      O => p_6_out(3)
    );
\wr_addr_gray[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_4_in33_in,
      I1 => p_5_in35_in,
      O => p_6_out(4)
    );
\wr_addr_gray[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_5_in35_in,
      I1 => \wr_addr_plus2_reg_n_0_[6]\,
      O => p_6_out(5)
    );
\wr_addr_gray_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_addr_plus2[1]_i_1_n_0\,
      Q => wr_addr_gray(0),
      S => SR(0)
    );
\wr_addr_gray_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => p_6_out(1),
      Q => wr_addr_gray(1),
      R => SR(0)
    );
\wr_addr_gray_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => p_6_out(2),
      Q => wr_addr_gray(2),
      R => SR(0)
    );
\wr_addr_gray_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => p_6_out(3),
      Q => wr_addr_gray(3),
      R => SR(0)
    );
\wr_addr_gray_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => p_6_out(4),
      Q => wr_addr_gray(4),
      R => SR(0)
    );
\wr_addr_gray_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => p_6_out(5),
      Q => wr_addr_gray(5),
      S => SR(0)
    );
\wr_addr_gray_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_addr_plus2_reg_n_0_[6]\,
      Q => wr_addr_gray(6),
      S => SR(0)
    );
\wr_addr_plus1[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \wr_addr_plus2_reg_n_0_[6]\,
      I1 => \^initialize_ram_complete_pulse_reg_0\,
      O => \wr_addr_plus1[6]_i_1_n_0\
    );
\wr_addr_plus1_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => \wr_addr_plus2_reg_n_0_[0]\,
      Q => wr_addr_plus1(0),
      S => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => p_1_in28_in,
      Q => wr_addr_plus1(1),
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => p_2_in29_in,
      Q => wr_addr_plus1(2),
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => p_3_in31_in,
      Q => wr_addr_plus1(3),
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => p_4_in33_in,
      Q => wr_addr_plus1(4),
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => p_5_in35_in,
      Q => wr_addr_plus1(5),
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr_plus2_reg[6]_0\,
      D => \wr_addr_plus1[6]_i_1_n_0\,
      Q => wr_addr_plus1(6),
      R => SR(0)
    );
\wr_addr_plus2[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \wr_addr_plus2_reg_n_0_[0]\,
      O => \wr_addr_plus2[0]_i_1_n_0\
    );
\wr_addr_plus2[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \wr_addr_plus2_reg_n_0_[0]\,
      I1 => p_1_in28_in,
      O => \wr_addr_plus2[1]_i_1_n_0\
    );
\wr_addr_plus2[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \wr_addr_plus2_reg_n_0_[0]\,
      I1 => p_1_in28_in,
      I2 => p_2_in29_in,
      O => \wr_addr_plus2[2]_i_1_n_0\
    );
\wr_addr_plus2[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => p_1_in28_in,
      I1 => \wr_addr_plus2_reg_n_0_[0]\,
      I2 => p_2_in29_in,
      I3 => p_3_in31_in,
      O => \wr_addr_plus2[3]_i_1_n_0\
    );
\wr_addr_plus2[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => p_2_in29_in,
      I1 => \wr_addr_plus2_reg_n_0_[0]\,
      I2 => p_1_in28_in,
      I3 => p_3_in31_in,
      I4 => p_4_in33_in,
      O => \wr_addr_plus2[4]_i_1_n_0\
    );
\wr_addr_plus2[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => p_3_in31_in,
      I1 => p_1_in28_in,
      I2 => \wr_addr_plus2_reg_n_0_[0]\,
      I3 => p_2_in29_in,
      I4 => p_4_in33_in,
      I5 => p_5_in35_in,
      O => \wr_addr_plus2[5]_i_1_n_0\
    );
\wr_addr_plus2[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF6A"
    )
        port map (
      I0 => \wr_addr_plus2_reg_n_0_[6]\,
      I1 => p_5_in35_in,
      I2 => \wr_addr_plus2[6]_i_2_n_0\,
      I3 => \^initialize_ram_complete_pulse_reg_0\,
      O => \wr_addr_plus2[6]_i_1_n_0\
    );
\wr_addr_plus2[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => p_4_in33_in,
      I1 => p_2_in29_in,
      I2 => \wr_addr_plus2_reg_n_0_[0]\,
      I3 => p_1_in28_in,
      I4 => p_3_in31_in,
      O => \wr_addr_plus2[6]_i_2_n_0\
    );
\wr_addr_plus2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => \wr_addr_plus2[0]_i_1_n_0\,
      Q => \wr_addr_plus2_reg_n_0_[0]\,
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus2_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => \wr_addr_plus2[1]_i_1_n_0\,
      Q => p_1_in28_in,
      S => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => \wr_addr_plus2[2]_i_1_n_0\,
      Q => p_2_in29_in,
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => \wr_addr_plus2[3]_i_1_n_0\,
      Q => p_3_in31_in,
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => \wr_addr_plus2[4]_i_1_n_0\,
      Q => p_4_in33_in,
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => \wr_addr_plus2[5]_i_1_n_0\,
      Q => p_5_in35_in,
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_plus2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr_plus2_reg[6]_0\,
      D => \wr_addr_plus2[6]_i_1_n_0\,
      Q => \wr_addr_plus2_reg_n_0_[6]\,
      R => SR(0)
    );
\wr_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => wr_addr_plus1(0),
      Q => wr_addr(0),
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => wr_addr_plus1(1),
      Q => wr_addr(1),
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => wr_addr_plus1(2),
      Q => wr_addr(2),
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => wr_addr_plus1(3),
      Q => wr_addr(3),
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => wr_addr_plus1(4),
      Q => wr_addr(4),
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr[5]_i_2_n_0\,
      D => wr_addr_plus1(5),
      Q => wr_addr(5),
      R => \wr_addr[5]_i_1_n_0\
    );
\wr_addr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \wr_addr_plus2_reg[6]_0\,
      D => \wr_addr[6]_i_3_n_0\,
      Q => wr_addr(6),
      R => SR(0)
    );
\wr_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(0),
      Q => \wr_data_reg_n_0_[0]\,
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(10),
      Q => wr_data(10),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(11),
      Q => p_0_in,
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(12),
      Q => wr_data(12),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(1),
      Q => \wr_data_reg_n_0_[1]\,
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(2),
      Q => \wr_data_reg_n_0_[2]\,
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(3),
      Q => \wr_data_reg_n_0_[3]\,
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(4),
      Q => \wr_data_reg_n_0_[4]\,
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(5),
      Q => \wr_data_reg_n_0_[5]\,
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(6),
      Q => \wr_data_reg_n_0_[6]\,
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(7),
      Q => \wr_data_reg_n_0_[7]\,
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(8),
      Q => wr_data(8),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg[12]_0\(9),
      Q => wr_data(9),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg_n_0_[0]\,
      Q => wr_data_reg(0),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data(10),
      Q => wr_data_reg(10),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => p_0_in,
      Q => wr_data_reg(11),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data(12),
      Q => wr_data_reg(12),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \^d\(0),
      Q => wr_data_reg(13),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg_n_0_[1]\,
      Q => wr_data_reg(1),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg_n_0_[2]\,
      Q => wr_data_reg(2),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg_n_0_[3]\,
      Q => wr_data_reg(3),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg_n_0_[4]\,
      Q => wr_data_reg(4),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg_n_0_[5]\,
      Q => wr_data_reg(5),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg_n_0_[6]\,
      Q => wr_data_reg(6),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => \wr_data_reg_n_0_[7]\,
      Q => wr_data_reg(7),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data(8),
      Q => wr_data_reg(8),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data(9),
      Q => wr_data_reg(9),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(0),
      Q => wr_data_reg_reg(0),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(10),
      Q => wr_data_reg_reg(10),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(11),
      Q => wr_data_reg_reg(11),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(12),
      Q => wr_data_reg_reg(12),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(13),
      Q => wr_data_reg_reg(13),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(1),
      Q => wr_data_reg_reg(1),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(2),
      Q => wr_data_reg_reg(2),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(3),
      Q => wr_data_reg_reg(3),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(4),
      Q => wr_data_reg_reg(4),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(5),
      Q => wr_data_reg_reg(5),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(6),
      Q => wr_data_reg_reg(6),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(7),
      Q => wr_data_reg_reg(7),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(8),
      Q => wr_data_reg_reg(8),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_data_reg_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => E(0),
      D => wr_data_reg(9),
      Q => wr_data_reg_reg(9),
      R => \wr_data_reg[0]_0\(0)
    );
wr_occupancy0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7 downto 6) => NLW_wr_occupancy0_carry_CO_UNCONNECTED(7 downto 6),
      CO(5) => wr_occupancy0_carry_n_2,
      CO(4) => wr_occupancy0_carry_n_3,
      CO(3) => wr_occupancy0_carry_n_4,
      CO(2) => wr_occupancy0_carry_n_5,
      CO(1) => wr_occupancy0_carry_n_6,
      CO(0) => wr_occupancy0_carry_n_7,
      DI(7 downto 6) => B"00",
      DI(5 downto 0) => wr_addr(5 downto 0),
      O(7) => NLW_wr_occupancy0_carry_O_UNCONNECTED(7),
      O(6 downto 0) => wr_occupancy00_out(6 downto 0),
      S(7) => '0',
      S(6) => \reclock_rd_addrgray[6].sync_rd_addrgray_n_0\,
      S(5) => \reclock_rd_addrgray[6].sync_rd_addrgray_n_1\,
      S(4) => \reclock_rd_addrgray[5].sync_rd_addrgray_n_0\,
      S(3) => \reclock_rd_addrgray[4].sync_rd_addrgray_n_0\,
      S(2) => \reclock_rd_addrgray[3].sync_rd_addrgray_n_0\,
      S(1) => \reclock_rd_addrgray[1].sync_rd_addrgray_n_0\,
      S(0) => \reclock_rd_addrgray[1].sync_rd_addrgray_n_1\
    );
\wr_occupancy_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => wr_occupancy00_out(0),
      Q => wr_occupancy(0),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_occupancy_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => wr_occupancy00_out(1),
      Q => wr_occupancy(1),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_occupancy_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => wr_occupancy00_out(2),
      Q => wr_occupancy(2),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_occupancy_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => wr_occupancy00_out(3),
      Q => wr_occupancy(3),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_occupancy_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => wr_occupancy00_out(4),
      Q => wr_occupancy(4),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_occupancy_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => wr_occupancy00_out(5),
      Q => wr_occupancy(5),
      R => \wr_data_reg[0]_0\(0)
    );
\wr_occupancy_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => Rx_SysClk,
      CE => '1',
      D => wr_occupancy00_out(6),
      Q => wr_occupancy(6),
      S => \wr_data_reg[0]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_GPCS_PMA_GEN is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    MGT_TX_RESET : out STD_LOGIC;
    status_vector : out STD_LOGIC_VECTOR ( 12 downto 0 );
    MGT_RX_RESET : out STD_LOGIC;
    gmii_rxd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_er : out STD_LOGIC;
    txchardispmode : out STD_LOGIC;
    txcharisk : out STD_LOGIC;
    txdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    an_interrupt : out STD_LOGIC;
    gmii_rx_dv : out STD_LOGIC;
    txchardispval : out STD_LOGIC;
    userclk2 : in STD_LOGIC;
    signal_detect : in STD_LOGIC;
    reset : in STD_LOGIC;
    gmii_tx_en : in STD_LOGIC;
    gmii_tx_er : in STD_LOGIC;
    configuration_vector : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gmii_txd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rxnotintable : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxclkcorcnt : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxbufstatus : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdisperr : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxrundisp : in STD_LOGIC_VECTOR ( 0 to 0 );
    an_restart_config : in STD_LOGIC;
    rxcharisk : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchariscomma : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    an_adv_config_vector : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_GPCS_PMA_GEN : entity is "GPCS_PMA_GEN";
end gig_ethernet_pcs_pma_0_GPCS_PMA_GEN;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_GPCS_PMA_GEN is
  signal AN_ENABLE_INT : STD_LOGIC;
  signal BASEX_REMOTE_FAULT_RSLVD : STD_LOGIC_VECTOR ( 1 to 1 );
  signal D : STD_LOGIC;
  signal DUPLEX_MODE_RSLVD_REG : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[10]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[11]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[12]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[13]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[5]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[6]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[7]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[8]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[9]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[10]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[11]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[12]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[13]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[5]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[6]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[7]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[8]\ : STD_LOGIC;
  signal \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[9]\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_10\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_14\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_15\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_16\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_18\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_19\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_20\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_21\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_22\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_23\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_24\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_25\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_26\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_27\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_28\ : STD_LOGIC;
  signal \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_8\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_0\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_1\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_10\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_11\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_12\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_13\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_14\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_15\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_16\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_17\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_18\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_19\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_2\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_20\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_21\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_3\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_4\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_5\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_6\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_7\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_8\ : STD_LOGIC;
  signal \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_9\ : STD_LOGIC;
  signal K28p5_REG1 : STD_LOGIC;
  signal LOOPBACK_INT : STD_LOGIC;
  signal LP_ADV_ABILITY : STD_LOGIC_VECTOR ( 12 to 12 );
  signal \^mgt_rx_reset\ : STD_LOGIC;
  signal MGT_RX_RESET_INT : STD_LOGIC;
  signal \^mgt_tx_reset\ : STD_LOGIC;
  signal MGT_TX_RESET_INT : STD_LOGIC;
  signal \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg_n_0_[0]\ : STD_LOGIC;
  signal \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg_n_0_[2]\ : STD_LOGIC;
  signal \NO_MANAGEMENT.NO_MDIO_HAS_AN.RESTART_AN_EN_i_1_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal RECEIVE : STD_LOGIC;
  signal RECEIVED_IDLE : STD_LOGIC;
  signal RESET_INT : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of RESET_INT : signal is "true";
  signal RESET_INT_PIPE : STD_LOGIC;
  attribute async_reg of RESET_INT_PIPE : signal is "true";
  signal RESET_INT_PIPE_RXRECCLK : STD_LOGIC;
  attribute async_reg of RESET_INT_PIPE_RXRECCLK : signal is "true";
  signal RESET_INT_RXRECCLK : STD_LOGIC;
  attribute async_reg of RESET_INT_RXRECCLK : signal is "true";
  signal RESTART_AN_EN : STD_LOGIC;
  signal RESTART_AN_EN_REG : STD_LOGIC;
  signal RESTART_AN_SET : STD_LOGIC;
  signal RXDISPERR_SRL1_out : STD_LOGIC;
  signal RXEVEN0_out : STD_LOGIC;
  signal RXNOTINTABLE_INT : STD_LOGIC;
  signal RXNOTINTABLE_SRL0_out : STD_LOGIC;
  signal RXRECRESET : STD_LOGIC;
  attribute async_reg of RXRECRESET : signal is "true";
  signal RXRECRESET_PIPE : STD_LOGIC;
  attribute async_reg of RXRECRESET_PIPE : signal is "true";
  signal RXRECRESET_PIPE_1 : STD_LOGIC;
  attribute async_reg of RXRECRESET_PIPE_1 : signal is "true";
  signal RXRECRESET_PIPE_2 : STD_LOGIC;
  attribute async_reg of RXRECRESET_PIPE_2 : signal is "true";
  signal RXRECRESET_PIPE_3 : STD_LOGIC;
  attribute async_reg of RXRECRESET_PIPE_3 : signal is "true";
  signal RXRUNDISP_INT : STD_LOGIC;
  signal RXSYNC_STATUS : STD_LOGIC;
  signal RX_CONFIG_REG : STD_LOGIC_VECTOR ( 15 downto 10 );
  signal RX_CONFIG_REG_REG0 : STD_LOGIC;
  signal RX_CONFIG_VALID : STD_LOGIC;
  signal RX_DV0 : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_13\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_16\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_20\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_21\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_22\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_23\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_24\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_25\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_26\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_27\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_28\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_29\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_30\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_32\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_33\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_3\ : STD_LOGIC;
  signal \RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_4\ : STD_LOGIC;
  signal RX_IDLE : STD_LOGIC;
  signal RX_INVALID : STD_LOGIC;
  signal RX_RUDI_INVALID : STD_LOGIC;
  signal S2 : STD_LOGIC;
  signal SIGNAL_DETECT_MOD : STD_LOGIC;
  signal SOFT_RESET_RXRECCLK : STD_LOGIC;
  signal SOP_REG3 : STD_LOGIC;
  signal SRESET : STD_LOGIC;
  attribute async_reg of SRESET : signal is "true";
  signal SRESET_PIPE : STD_LOGIC;
  attribute async_reg of SRESET_PIPE : signal is "true";
  signal STATUS_VECTOR_0_PRE : STD_LOGIC;
  signal SYNC_SIGNAL_DETECT_n_0 : STD_LOGIC;
  signal SYNC_STATUS_REG : STD_LOGIC;
  signal SYNC_STATUS_REG0 : STD_LOGIC;
  signal \USE_ROCKET_IO.MGT_TX_RESET_INT_i_2_n_0\ : STD_LOGIC;
  signal \USE_ROCKET_IO.MGT_TX_RESET_INT_i_3_n_0\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg_n_0\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg_n_0\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[0]\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[2]\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[0]\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[1]\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[2]\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[3]\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[4]\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[5]\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[6]\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[7]\ : STD_LOGIC;
  signal \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg_n_0\ : STD_LOGIC;
  signal \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_3_n_0\ : STD_LOGIC;
  signal \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_4_n_0\ : STD_LOGIC;
  signal XMIT_CONFIG : STD_LOGIC;
  signal XMIT_DATA : STD_LOGIC;
  signal XMIT_DATA_INT : STD_LOGIC;
  signal data_out : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_out : STD_LOGIC;
  signal p_6_out : STD_LOGIC;
  signal reset_out : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \DELAY_ERROR_TXOUTCLK.DELAY_RXDISPERR\ : label is "SRL16";
  attribute box_type : string;
  attribute box_type of \DELAY_ERROR_TXOUTCLK.DELAY_RXDISPERR\ : label is "PRIMITIVE";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \DELAY_ERROR_TXOUTCLK.DELAY_RXDISPERR\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic ";
  attribute srl_name : string;
  attribute srl_name of \DELAY_ERROR_TXOUTCLK.DELAY_RXDISPERR\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/DELAY_ERROR_TXOUTCLK.DELAY_RXDISPERR ";
  attribute XILINX_LEGACY_PRIM of \DELAY_ERROR_TXOUTCLK.DELAY_RXNOTINTABLE\ : label is "SRL16";
  attribute box_type of \DELAY_ERROR_TXOUTCLK.DELAY_RXNOTINTABLE\ : label is "PRIMITIVE";
  attribute srl_bus_name of \DELAY_ERROR_TXOUTCLK.DELAY_RXNOTINTABLE\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic ";
  attribute srl_name of \DELAY_ERROR_TXOUTCLK.DELAY_RXNOTINTABLE\ : label is "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core /\gpcs_pma_inst/DELAY_ERROR_TXOUTCLK.DELAY_RXNOTINTABLE ";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[0]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[10]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[11]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[12]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[13]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[1]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[2]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[3]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[4]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[5]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[6]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[7]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[8]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[9]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[0]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[10]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[11]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[12]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[13]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[1]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[2]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[3]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[4]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[5]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[6]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[7]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[8]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[9]\ : label is "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \MGT_RESET.RESET_INT_PIPE_RXRECCLK_reg\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \MGT_RESET.RESET_INT_PIPE_RXRECCLK_reg\ : label is "yes";
  attribute ASYNC_REG_boolean of \MGT_RESET.RESET_INT_PIPE_reg\ : label is std.standard.true;
  attribute KEEP of \MGT_RESET.RESET_INT_PIPE_reg\ : label is "yes";
  attribute ASYNC_REG_boolean of \MGT_RESET.RESET_INT_RXRECCLK_reg\ : label is std.standard.true;
  attribute KEEP of \MGT_RESET.RESET_INT_RXRECCLK_reg\ : label is "yes";
  attribute ASYNC_REG_boolean of \MGT_RESET.RESET_INT_reg\ : label is std.standard.true;
  attribute KEEP of \MGT_RESET.RESET_INT_reg\ : label is "yes";
  attribute ASYNC_REG_boolean of \MGT_RESET.SRESET_PIPE_reg\ : label is std.standard.true;
  attribute KEEP of \MGT_RESET.SRESET_PIPE_reg\ : label is "yes";
  attribute ASYNC_REG_boolean of \MGT_RESET.SRESET_reg\ : label is std.standard.true;
  attribute KEEP of \MGT_RESET.SRESET_reg\ : label is "yes";
begin
  MGT_RX_RESET <= \^mgt_rx_reset\;
  MGT_TX_RESET <= \^mgt_tx_reset\;
  Q(0) <= \^q\(0);
\DELAY_ERROR_TXOUTCLK.DELAY_RXDISPERR\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '0',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => userclk2,
      D => D,
      Q => RXDISPERR_SRL1_out
    );
\DELAY_ERROR_TXOUTCLK.DELAY_RXNOTINTABLE\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '0',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => userclk2,
      D => RXNOTINTABLE_INT,
      Q => RXNOTINTABLE_SRL0_out
    );
\DELAY_ERROR_TXOUTCLK.RXDISPERR_REG_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RXDISPERR_SRL1_out,
      Q => status_vector(5),
      R => '0'
    );
\DELAY_ERROR_TXOUTCLK.RXNOTINTABLE_REG_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RXNOTINTABLE_SRL0_out,
      Q => status_vector(6),
      R => '0'
    );
DUPLEX_MODE_RSLVD_REG_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => LP_ADV_ABILITY(12),
      Q => DUPLEX_MODE_RSLVD_REG,
      R => '0'
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => '0',
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[0]\,
      S => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[9]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[10]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[10]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[11]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[11]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[12]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[12]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[13]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[0]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[1]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[1]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[2]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[2]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[3]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[3]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[4]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[4]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[5]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[5]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[6]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[6]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[7]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[7]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[8]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[8]\,
      Q => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[9]\,
      R => p_0_out
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => '0',
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[0]\,
      S => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[9]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[10]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[10]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[11]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[11]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[12]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[12]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[13]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[0]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[1]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[1]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[2]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[2]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[3]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[3]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[4]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[4]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[5]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[5]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[6]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[6]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[7]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[7]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[8]\,
      R => RESET_INT
    );
\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[8]\,
      Q => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[9]\,
      R => RESET_INT
    );
\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION\: entity work.gig_ethernet_pcs_pma_0_AUTO_NEG
     port map (
      BASEX_REMOTE_FAULT_RSLVD(0) => BASEX_REMOTE_FAULT_RSLVD(1),
      CONFIG_REG_MATCH_reg_0 => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_13\,
      CONSISTENCY_MATCH_reg_0 => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_30\,
      D(2) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_18\,
      D(1) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_19\,
      D(0) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_20\,
      \MASK_RUDI_BUFERR_TIMER_reg[12]_0\ => SYNC_SIGNAL_DETECT_n_0,
      \MASK_RUDI_BUFERR_TIMER_reg[3]_0\ => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_16\,
      MASK_RUDI_CLKCOR_reg_0(1) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[2]\,
      MASK_RUDI_CLKCOR_reg_0(0) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[0]\,
      MR_AN_ENABLE_REG1_reg_0(3) => AN_ENABLE_INT,
      MR_AN_ENABLE_REG1_reg_0(2) => \^q\(0),
      MR_AN_ENABLE_REG1_reg_0(1) => \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg_n_0_[2]\,
      MR_AN_ENABLE_REG1_reg_0(0) => \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg_n_0_[0]\,
      \MR_LP_ADV_ABILITY_INT_reg[13]_0\(0) => LP_ADV_ABILITY(12),
      \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg[0]\ => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_10\,
      \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg[0]_0\ => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_14\,
      Q(15 downto 14) => RX_CONFIG_REG(15 downto 14),
      Q(13) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_16\,
      Q(12 downto 10) => RX_CONFIG_REG(12 downto 10),
      Q(9) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_20\,
      Q(8) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_21\,
      Q(7) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_22\,
      Q(6) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_23\,
      Q(5) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_24\,
      Q(4) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_25\,
      Q(3) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_26\,
      Q(2) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_27\,
      Q(1) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_28\,
      Q(0) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_29\,
      RECEIVE => RECEIVE,
      RECEIVED_IDLE => RECEIVED_IDLE,
      RECEIVED_IDLE_reg_0 => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_32\,
      RESTART_AN_SET => RESTART_AN_SET,
      RXSYNC_STATUS => RXSYNC_STATUS,
      RX_CONFIG_REG_NULL_reg_0 => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_8\,
      RX_CONFIG_REG_NULL_reg_1 => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_33\,
      \RX_CONFIG_REG_REG_reg[5]_0\(2) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_21\,
      \RX_CONFIG_REG_REG_reg[5]_0\(1) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_22\,
      \RX_CONFIG_REG_REG_reg[5]_0\(0) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_23\,
      \RX_CONFIG_SNAPSHOT_reg[0]_0\ => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_15\,
      \RX_CONFIG_SNAPSHOT_reg[13]_0\(4) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_24\,
      \RX_CONFIG_SNAPSHOT_reg[13]_0\(3) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_25\,
      \RX_CONFIG_SNAPSHOT_reg[13]_0\(2) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_26\,
      \RX_CONFIG_SNAPSHOT_reg[13]_0\(1) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_27\,
      \RX_CONFIG_SNAPSHOT_reg[13]_0\(0) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_28\,
      RX_CONFIG_VALID => RX_CONFIG_VALID,
      RX_DV0 => RX_DV0,
      RX_IDLE => RX_IDLE,
      RX_INVALID => RX_INVALID,
      RX_RUDI_INVALID => RX_RUDI_INVALID,
      RX_RUDI_INVALID_REG_reg_0 => \RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_4\,
      SOP_REG3 => SOP_REG3,
      SR(0) => RX_CONFIG_REG_REG0,
      XMIT_CONFIG => XMIT_CONFIG,
      XMIT_DATA => XMIT_DATA,
      XMIT_DATA_INT => XMIT_DATA_INT,
      an_adv_config_vector(0) => an_adv_config_vector(0),
      an_interrupt => an_interrupt,
      data_out => data_out,
      \out\ => SRESET,
      p_0_in => p_0_in,
      status_vector(5) => status_vector(12),
      status_vector(4 downto 1) => status_vector(10 downto 7),
      status_vector(0) => status_vector(4),
      userclk2 => userclk2
    );
\IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER\: entity work.gig_ethernet_pcs_pma_0_TX
     port map (
      \CODE_GRP_CNT_reg[0]_0\ => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_5\,
      \CODE_GRP_CNT_reg[0]_1\ => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_6\,
      D(3) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_1\,
      D(2) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_2\,
      D(1) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_3\,
      D(0) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_4\,
      \NO_QSGMII_CHAR.TXCHARDISPVAL_reg_0\ => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_13\,
      \NO_QSGMII_DATA.TXCHARISK_reg_0\ => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_7\,
      \NO_QSGMII_DATA.TXCHARISK_reg_1\ => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_8\,
      \NO_QSGMII_DATA.TXDATA_reg[2]_0\ => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_9\,
      \NO_QSGMII_DATA.TXDATA_reg[3]_0\ => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_10\,
      \NO_QSGMII_DATA.TXDATA_reg[5]_0\ => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_11\,
      \NO_QSGMII_DATA.TXDATA_reg[7]_0\ => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_12\,
      \NO_QSGMII_DATA.TXDATA_reg[7]_1\(7) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_14\,
      \NO_QSGMII_DATA.TXDATA_reg[7]_1\(6) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_15\,
      \NO_QSGMII_DATA.TXDATA_reg[7]_1\(5) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_16\,
      \NO_QSGMII_DATA.TXDATA_reg[7]_1\(4) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_17\,
      \NO_QSGMII_DATA.TXDATA_reg[7]_1\(3) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_18\,
      \NO_QSGMII_DATA.TXDATA_reg[7]_1\(2) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_19\,
      \NO_QSGMII_DATA.TXDATA_reg[7]_1\(1) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_20\,
      \NO_QSGMII_DATA.TXDATA_reg[7]_1\(0) => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_21\,
      Q(1) => \^q\(0),
      Q(0) => LOOPBACK_INT,
      SR(0) => \^mgt_tx_reset\,
      \TX_CONFIG_reg[14]_0\(2) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_18\,
      \TX_CONFIG_reg[14]_0\(1) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_19\,
      \TX_CONFIG_reg[14]_0\(0) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_20\,
      \USE_ROCKET_IO.MGT_TX_RESET_INT_reg\ => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_0\,
      XMIT_CONFIG => XMIT_CONFIG,
      XMIT_DATA => XMIT_DATA,
      gmii_tx_en => gmii_tx_en,
      gmii_tx_er => gmii_tx_er,
      gmii_txd(7 downto 0) => gmii_txd(7 downto 0),
      rxchariscomma(0) => rxchariscomma(0),
      rxcharisk(0) => rxcharisk(0),
      rxdata(7 downto 0) => rxdata(7 downto 0),
      userclk2 => userclk2
    );
\MGT_RESET.RESET_INT_PIPE_RXRECCLK_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => '0',
      CE => '1',
      D => '0',
      PRE => p_6_out,
      Q => RESET_INT_PIPE_RXRECCLK
    );
\MGT_RESET.RESET_INT_PIPE_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => '0',
      PRE => reset_out,
      Q => RESET_INT_PIPE
    );
\MGT_RESET.RESET_INT_RXRECCLK_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => '0',
      CE => '1',
      D => RESET_INT_PIPE_RXRECCLK,
      PRE => p_6_out,
      Q => RESET_INT_RXRECCLK
    );
\MGT_RESET.RESET_INT_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RESET_INT_PIPE,
      PRE => reset_out,
      Q => RESET_INT
    );
\MGT_RESET.SRESET_PIPE_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RESET_INT,
      Q => SRESET_PIPE,
      R => '0'
    );
\MGT_RESET.SRESET_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => SRESET_PIPE,
      Q => SRESET,
      S => RESET_INT
    );
\MGT_RESET.SYNC_ASYNC_RESET\: entity work.gig_ethernet_pcs_pma_0_reset_sync_block
     port map (
      reset => reset,
      reset_out => reset_out,
      userclk2 => userclk2
    );
\MGT_RESET.SYNC_ASYNC_RESET_RECCLK\: entity work.gig_ethernet_pcs_pma_0_reset_sync_block_22
     port map (
      p_6_out => p_6_out,
      reset => reset,
      reset_out => SOFT_RESET_RXRECCLK
    );
\MGT_RESET.SYNC_SOFT_RESET_RECCLK\: entity work.gig_ethernet_pcs_pma_0_reset_sync_block_23
     port map (
      reset_out => SOFT_RESET_RXRECCLK
    );
\NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => configuration_vector(0),
      Q => \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg_n_0_[0]\,
      R => SRESET
    );
\NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => configuration_vector(1),
      Q => LOOPBACK_INT,
      R => SRESET
    );
\NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => configuration_vector(2),
      Q => \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg_n_0_[2]\,
      R => SRESET
    );
\NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => configuration_vector(3),
      Q => \^q\(0),
      R => SRESET
    );
\NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => configuration_vector(4),
      Q => AN_ENABLE_INT,
      R => SRESET
    );
\NO_MANAGEMENT.NO_MDIO_HAS_AN.RESTART_AN_EN_REG_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => an_restart_config,
      Q => RESTART_AN_EN_REG,
      R => SRESET
    );
\NO_MANAGEMENT.NO_MDIO_HAS_AN.RESTART_AN_EN_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => an_restart_config,
      I1 => RESTART_AN_EN_REG,
      O => \NO_MANAGEMENT.NO_MDIO_HAS_AN.RESTART_AN_EN_i_1_n_0\
    );
\NO_MANAGEMENT.NO_MDIO_HAS_AN.RESTART_AN_EN_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \NO_MANAGEMENT.NO_MDIO_HAS_AN.RESTART_AN_EN_i_1_n_0\,
      Q => RESTART_AN_EN,
      R => SRESET
    );
\NO_MANAGEMENT.NO_MDIO_HAS_AN.RESTART_AN_SET_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RESTART_AN_EN,
      Q => RESTART_AN_SET,
      R => SRESET
    );
\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK\: entity work.gig_ethernet_pcs_pma_0_RX
     port map (
      BASEX_REMOTE_FAULT_RSLVD(0) => BASEX_REMOTE_FAULT_RSLVD(1),
      CONFIG_REG_MATCH_reg(2) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_21\,
      CONFIG_REG_MATCH_reg(1) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_22\,
      CONFIG_REG_MATCH_reg(0) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_23\,
      CONSISTENCY_MATCH_reg(4) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_24\,
      CONSISTENCY_MATCH_reg(3) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_25\,
      CONSISTENCY_MATCH_reg(2) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_26\,
      CONSISTENCY_MATCH_reg(1) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_27\,
      CONSISTENCY_MATCH_reg(0) => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_28\,
      CONSISTENCY_MATCH_reg_0 => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_15\,
      D => D,
      EXTEND_reg_0 => \RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_3\,
      FALSE_NIT_reg_0 => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg_n_0\,
      I_REG_reg_0 => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_32\,
      K28p5_REG1 => K28p5_REG1,
      \MGT_RESET.SRESET_reg\(0) => RX_CONFIG_REG_REG0,
      Q(7) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[7]\,
      Q(6) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[6]\,
      Q(5) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[5]\,
      Q(4) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[4]\,
      Q(3) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[3]\,
      Q(2) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[2]\,
      Q(1) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[1]\,
      Q(0) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[0]\,
      RECEIVE => RECEIVE,
      RECEIVED_IDLE => RECEIVED_IDLE,
      RXCHARISK_REG1_reg_0 => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg_n_0\,
      RXEVEN0_out => RXEVEN0_out,
      RXNOTINTABLE_INT => RXNOTINTABLE_INT,
      RXSYNC_STATUS => RXSYNC_STATUS,
      RX_CONFIG_REG_NULL_reg => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_8\,
      \RX_CONFIG_REG_reg[13]_0\ => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_30\,
      \RX_CONFIG_REG_reg[15]_0\(15 downto 14) => RX_CONFIG_REG(15 downto 14),
      \RX_CONFIG_REG_reg[15]_0\(13) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_16\,
      \RX_CONFIG_REG_reg[15]_0\(12 downto 10) => RX_CONFIG_REG(12 downto 10),
      \RX_CONFIG_REG_reg[15]_0\(9) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_20\,
      \RX_CONFIG_REG_reg[15]_0\(8) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_21\,
      \RX_CONFIG_REG_reg[15]_0\(7) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_22\,
      \RX_CONFIG_REG_reg[15]_0\(6) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_23\,
      \RX_CONFIG_REG_reg[15]_0\(5) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_24\,
      \RX_CONFIG_REG_reg[15]_0\(4) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_25\,
      \RX_CONFIG_REG_reg[15]_0\(3) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_26\,
      \RX_CONFIG_REG_reg[15]_0\(2) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_27\,
      \RX_CONFIG_REG_reg[15]_0\(1) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_28\,
      \RX_CONFIG_REG_reg[15]_0\(0) => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_29\,
      \RX_CONFIG_REG_reg[4]_0\ => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_13\,
      \RX_CONFIG_REG_reg[7]_0\(1) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[2]\,
      \RX_CONFIG_REG_reg[7]_0\(0) => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[0]\,
      RX_CONFIG_VALID => RX_CONFIG_VALID,
      RX_CONFIG_VALID_INT_reg_0 => \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_33\,
      RX_DV0 => RX_DV0,
      RX_ER_reg_0 => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_14\,
      RX_IDLE => RX_IDLE,
      RX_INVALID => RX_INVALID,
      RX_INVALID_reg_0 => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_10\,
      RX_RUDI_INVALID => RX_RUDI_INVALID,
      RX_RUDI_INVALID_REG_reg(3) => AN_ENABLE_INT,
      RX_RUDI_INVALID_REG_reg(2) => \^q\(0),
      RX_RUDI_INVALID_REG_reg(1) => \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg_n_0_[2]\,
      RX_RUDI_INVALID_REG_reg(0) => \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg_n_0_[0]\,
      S2 => S2,
      SOP_REG3 => SOP_REG3,
      SR(0) => \^mgt_rx_reset\,
      SYNC_STATUS_REG0 => SYNC_STATUS_REG0,
      XMIT_DATA => XMIT_DATA,
      XMIT_DATA_INT => XMIT_DATA_INT,
      gmii_rx_dv => gmii_rx_dv,
      gmii_rx_er => gmii_rx_er,
      gmii_rxd(7 downto 0) => gmii_rxd(7 downto 0),
      \out\ => SRESET,
      p_0_in => p_0_in,
      status_vector(1 downto 0) => status_vector(3 downto 2),
      userclk2 => userclk2
    );
\RX_GMII_AT_TXOUTCLK.SYNCHRONISATION\: entity work.gig_ethernet_pcs_pma_0_SYNCHRONISE
     port map (
      D => D,
      EVEN_reg_0 => \RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_3\,
      EVEN_reg_1 => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg_n_0\,
      \FSM_onehot_STATE_reg[2]_0\ => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg_n_0\,
      K28p5_REG1 => K28p5_REG1,
      \MGT_RESET.SRESET_reg\ => \RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_4\,
      Q(0) => LOOPBACK_INT,
      RXEVEN0_out => RXEVEN0_out,
      RXNOTINTABLE_INT => RXNOTINTABLE_INT,
      RXSYNC_STATUS => RXSYNC_STATUS,
      S2 => S2,
      SIGNAL_DETECT_MOD => SIGNAL_DETECT_MOD,
      SR(0) => \^mgt_rx_reset\,
      SYNC_STATUS_REG0 => SYNC_STATUS_REG0,
      \out\ => SRESET,
      p_0_in => p_0_in,
      userclk2 => userclk2
    );
STATUS_VECTOR_0_PRE_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_10\,
      Q => STATUS_VECTOR_0_PRE,
      R => '0'
    );
\STATUS_VECTOR_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => STATUS_VECTOR_0_PRE,
      Q => status_vector(0),
      R => '0'
    );
\STATUS_VECTOR_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => DUPLEX_MODE_RSLVD_REG,
      Q => status_vector(11),
      R => '0'
    );
\STATUS_VECTOR_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => SYNC_STATUS_REG,
      Q => status_vector(1),
      R => '0'
    );
SYNC_SIGNAL_DETECT: entity work.gig_ethernet_pcs_pma_0_sync_block
     port map (
      \MASK_RUDI_BUFERR_TIMER_reg[12]\ => \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_16\,
      Q(0) => \NO_MANAGEMENT.CONFIGURATION_VECTOR_REG_reg_n_0_[2]\,
      SIGNAL_DETECT_MOD => SIGNAL_DETECT_MOD,
      data_out => data_out,
      data_sync_reg6_0 => SYNC_SIGNAL_DETECT_n_0,
      p_0_in => p_0_in,
      signal_detect => signal_detect,
      userclk2 => userclk2
    );
SYNC_STATUS_REG_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => RXSYNC_STATUS,
      Q => SYNC_STATUS_REG,
      R => '0'
    );
\USE_ROCKET_IO.MGT_TX_RESET_INT_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \USE_ROCKET_IO.MGT_TX_RESET_INT_i_2_n_0\,
      I1 => \USE_ROCKET_IO.MGT_TX_RESET_INT_i_3_n_0\,
      I2 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[6]\,
      I3 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[7]\,
      I4 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[4]\,
      I5 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[5]\,
      O => MGT_TX_RESET_INT
    );
\USE_ROCKET_IO.MGT_TX_RESET_INT_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[13]\,
      I1 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[12]\,
      I2 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[9]\,
      I3 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[8]\,
      I4 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[11]\,
      I5 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[10]\,
      O => \USE_ROCKET_IO.MGT_TX_RESET_INT_i_2_n_0\
    );
\USE_ROCKET_IO.MGT_TX_RESET_INT_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[2]\,
      I1 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[3]\,
      I2 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[0]\,
      I3 => \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[1]\,
      O => \USE_ROCKET_IO.MGT_TX_RESET_INT_i_3_n_0\
    );
\USE_ROCKET_IO.MGT_TX_RESET_INT_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => MGT_TX_RESET_INT,
      Q => \^mgt_tx_reset\,
      S => RESET_INT
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => rxbufstatus(0),
      Q => p_0_in,
      R => RXRUNDISP_INT
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_8\,
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg_n_0\,
      R => \^mgt_rx_reset\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_7\,
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg_n_0\,
      R => \^mgt_rx_reset\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => rxclkcorcnt(0),
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[0]\,
      R => RXRUNDISP_INT
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => rxclkcorcnt(1),
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[2]\,
      R => RXRUNDISP_INT
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_21\,
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[0]\,
      R => \^mgt_rx_reset\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_20\,
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[1]\,
      R => \^mgt_rx_reset\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_19\,
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[2]\,
      R => \^mgt_rx_reset\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_18\,
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[3]\,
      R => \^mgt_rx_reset\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_17\,
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[4]\,
      R => \^mgt_rx_reset\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_16\,
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[5]\,
      R => \^mgt_rx_reset\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_15\,
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[6]\,
      R => \^mgt_rx_reset\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_14\,
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[7]\,
      R => \^mgt_rx_reset\
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDISPERR_INT_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => rxdisperr(0),
      Q => D,
      R => RXRUNDISP_INT
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXNOTINTABLE_INT_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => LOOPBACK_INT,
      I1 => \^mgt_rx_reset\,
      O => RXRUNDISP_INT
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXNOTINTABLE_INT_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => rxnotintable(0),
      Q => RXNOTINTABLE_INT,
      R => RXRUNDISP_INT
    );
\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => rxrundisp(0),
      Q => \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg_n_0\,
      R => RXRUNDISP_INT
    );
\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in,
      I1 => RESET_INT,
      O => p_0_out
    );
\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_3_n_0\,
      I1 => \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_4_n_0\,
      I2 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[6]\,
      I3 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[7]\,
      I4 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[4]\,
      I5 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[5]\,
      O => MGT_RX_RESET_INT
    );
\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[13]\,
      I1 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[12]\,
      I2 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[9]\,
      I3 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[8]\,
      I4 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[11]\,
      I5 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[10]\,
      O => \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_3_n_0\
    );
\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[2]\,
      I1 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[3]\,
      I2 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[0]\,
      I3 => \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[1]\,
      O => \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_4_n_0\
    );
\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => MGT_RX_RESET_INT,
      Q => \^mgt_rx_reset\,
      S => p_0_out
    );
\USE_ROCKET_IO.TXCHARDISPMODE_reg\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_5\,
      Q => txchardispmode,
      R => \^mgt_tx_reset\
    );
\USE_ROCKET_IO.TXCHARDISPVAL_reg\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_13\,
      Q => txchardispval,
      R => '0'
    );
\USE_ROCKET_IO.TXCHARISK_reg\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_6\,
      Q => txcharisk,
      R => \^mgt_tx_reset\
    );
\USE_ROCKET_IO.TXDATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_4\,
      Q => txdata(0),
      R => '0'
    );
\USE_ROCKET_IO.TXDATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_3\,
      Q => txdata(1),
      R => '0'
    );
\USE_ROCKET_IO.TXDATA_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_9\,
      Q => txdata(2),
      S => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_0\
    );
\USE_ROCKET_IO.TXDATA_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_10\,
      Q => txdata(3),
      S => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_0\
    );
\USE_ROCKET_IO.TXDATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_2\,
      Q => txdata(4),
      R => '0'
    );
\USE_ROCKET_IO.TXDATA_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_11\,
      Q => txdata(5),
      S => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_0\
    );
\USE_ROCKET_IO.TXDATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_1\,
      Q => txdata(6),
      R => '0'
    );
\USE_ROCKET_IO.TXDATA_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => userclk2,
      CE => '1',
      D => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_12\,
      Q => txdata(7),
      S => \IS_2_5G_DISABLED_PRE_SHRINK.TRANSMITTER_n_0\
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => RXRECRESET
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => RXRECRESET_PIPE
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => RXRECRESET_PIPE_1
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => RXRECRESET_PIPE_2
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => RXRECRESET_PIPE_3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_lvds_transceiver is
  port (
    al_rx_valid_out : out STD_LOGIC;
    \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1\ : out STD_LOGIC;
    rxrecreset0 : out STD_LOGIC;
    \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1\ : out STD_LOGIC;
    BaseX_Rx_Fifo_Rd_En : out STD_LOGIC_VECTOR ( 0 to 0 );
    ActCnt_GE_HalfBT : out STD_LOGIC;
    LossOfSignal : out STD_LOGIC;
    initialize_ram_complete_sync_reg1 : out STD_LOGIC;
    data_out : out STD_LOGIC;
    remove_idle : out STD_LOGIC;
    \remove_idle_reg__0\ : out STD_LOGIC;
    \insert_idle_reg__0\ : out STD_LOGIC;
    rxdisperr : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxnotintable : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxrundisp : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxclkcorcnt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    initialize_ram_complete : out STD_LOGIC;
    initialize_ram_complete_pulse : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ActiveIsSlve : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    Mstr_Load_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    WrapToZero : out STD_LOGIC;
    monitor_late_reg : out STD_LOGIC;
    insert5_reg : out STD_LOGIC;
    insert3_reg : out STD_LOGIC;
    pd_ovflw_down_reg : out STD_LOGIC;
    pd_ovflw_up_reg : out STD_LOGIC;
    Aligned : out STD_LOGIC;
    Rx_Valid_Int_reg : out STD_LOGIC;
    rxbufstatus : out STD_LOGIC_VECTOR ( 0 to 0 );
    IntRdEna_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    \Mstr_CntValIn_Out_reg[8]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \s_state_reg[4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \act_count_reg[5]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \Slve_CntValIn_Out_reg[8]\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \pd_count_reg[4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \Slve_CntValIn_Out_reg[1]\ : out STD_LOGIC;
    \rxdh_reg[7]\ : out STD_LOGIC;
    \rxdh_reg[16]\ : out STD_LOGIC;
    \Slve_CntValIn_Out_reg[0]\ : out STD_LOGIC;
    BaseX_Idly_Load : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \rd_occupancy_reg[6]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \rd_data_reg_reg[13]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchariscomma_usr_reg : out STD_LOGIC;
    rxcharisk_usr_reg : out STD_LOGIC;
    \rxdata_usr_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \tx_data_8b_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \s_state_reg[0]\ : out STD_LOGIC;
    \s_state_reg[5]\ : out STD_LOGIC;
    \s_state_reg[4]_0\ : out STD_LOGIC;
    \s_state_reg[2]\ : out STD_LOGIC;
    \s_state_reg[4]_1\ : out STD_LOGIC;
    \s_state_reg[0]_0\ : out STD_LOGIC;
    \active_reg[1]\ : out STD_LOGIC;
    \act_count_reg[0]\ : out STD_LOGIC;
    \act_count_reg[4]\ : out STD_LOGIC;
    \act_count_reg[3]\ : out STD_LOGIC;
    \rxdh_reg[18]\ : out STD_LOGIC;
    \initialize_counter_reg[5]\ : out STD_LOGIC;
    \s_state_reg[3]\ : out STD_LOGIC;
    \rd_occupancy_reg[3]\ : out STD_LOGIC;
    \rd_occupancy_reg[0]\ : out STD_LOGIC;
    Rx_SysClk : in STD_LOGIC;
    \d2p2_wr_pipe_reg[3]\ : in STD_LOGIC;
    \d21p5_wr_pipe_reg[3]\ : in STD_LOGIC;
    D0 : in STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    initialize_ram_complete_sync_ris_edg0 : in STD_LOGIC;
    \rxclkcorcnt_reg[0]\ : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    LossOfSignal_reg : in STD_LOGIC;
    ActiveIsSlve_reg : in STD_LOGIC;
    Slve_Load_reg : in STD_LOGIC;
    Mstr_Load_reg_0 : in STD_LOGIC;
    WrapToZero_reg : in STD_LOGIC;
    monitor_late_reg_0 : in STD_LOGIC;
    insert5_reg_0 : in STD_LOGIC;
    insert3_reg_0 : in STD_LOGIC;
    pd_ovflw_down_reg_0 : in STD_LOGIC;
    pd_ovflw_up_reg_0 : in STD_LOGIC;
    Aligned_reg : in STD_LOGIC;
    initialize_ram_complete_reg : in STD_LOGIC;
    rxbuferr_reg : in STD_LOGIC;
    IntRdEna_reg_0 : in STD_LOGIC;
    CLK : in STD_LOGIC;
    \IntRx_BtVal_reg[8]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \wr_addr_plus2_reg[6]\ : in STD_LOGIC;
    txchardispval : in STD_LOGIC;
    txchardispmode : in STD_LOGIC;
    txdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txcharisk : in STD_LOGIC;
    BaseX_Rx_Q_Out : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mgt_rx_reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_lvds_transceiver : entity is "gig_ethernet_pcs_pma_0_lvds_transceiver";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_lvds_transceiver;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_lvds_transceiver is
  signal \^al_rx_valid_out\ : STD_LOGIC;
  signal b3 : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal code_err_i : STD_LOGIC;
  signal counter_flag : STD_LOGIC;
  signal counter_flag_i_2_n_0 : STD_LOGIC;
  signal counter_flag_i_3_n_0 : STD_LOGIC;
  signal counter_flag_reg_n_0 : STD_LOGIC;
  signal \counter_stg0_carry__0_n_6\ : STD_LOGIC;
  signal \counter_stg0_carry__0_n_7\ : STD_LOGIC;
  signal counter_stg0_carry_n_0 : STD_LOGIC;
  signal counter_stg0_carry_n_1 : STD_LOGIC;
  signal counter_stg0_carry_n_2 : STD_LOGIC;
  signal counter_stg0_carry_n_3 : STD_LOGIC;
  signal counter_stg0_carry_n_4 : STD_LOGIC;
  signal counter_stg0_carry_n_5 : STD_LOGIC;
  signal counter_stg0_carry_n_6 : STD_LOGIC;
  signal counter_stg0_carry_n_7 : STD_LOGIC;
  signal counter_stg_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal decoded_rxchariscomma : STD_LOGIC;
  signal decoded_rxchariscomma0 : STD_LOGIC;
  signal decoded_rxcharisk : STD_LOGIC;
  signal decoded_rxdata : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal decoded_rxdisperr : STD_LOGIC;
  signal decoded_rxnotintable : STD_LOGIC;
  signal decoded_rxrundisp : STD_LOGIC;
  signal elastic_buffer_rst_125 : STD_LOGIC;
  signal elastic_buffer_rst_312 : STD_LOGIC;
  signal \^initialize_ram_complete\ : STD_LOGIC;
  signal k : STD_LOGIC;
  signal \p_0_in__3\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal reset_sync_312_rxelastic_buffer_n_0 : STD_LOGIC;
  signal rx_rst_312 : STD_LOGIC;
  signal \^rxrecreset0\ : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal serdes_1_to_10_i_n_61 : STD_LOGIC;
  signal serdes_1_to_10_i_n_62 : STD_LOGIC;
  signal serdes_1_to_10_i_n_63 : STD_LOGIC;
  signal serdes_1_to_10_i_n_64 : STD_LOGIC;
  signal serdes_1_to_10_i_n_65 : STD_LOGIC;
  signal serdes_1_to_10_i_n_66 : STD_LOGIC;
  signal serdes_1_to_10_i_n_67 : STD_LOGIC;
  signal tx_data_10b : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal tx_data_8b_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal tx_rst_125 : STD_LOGIC;
  signal tx_rst_156 : STD_LOGIC;
  signal \NLW_counter_stg0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_counter_stg0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of counter_flag_i_3 : label is "soft_lutpair179";
  attribute SOFT_HLUTNM of \counter_stg[0]_i_1\ : label is "soft_lutpair179";
begin
  al_rx_valid_out <= \^al_rx_valid_out\;
  initialize_ram_complete <= \^initialize_ram_complete\;
  rxrecreset0 <= \^rxrecreset0\;
counter_flag_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => counter_stg_reg(2),
      I1 => counter_stg_reg(4),
      I2 => counter_stg_reg(1),
      I3 => counter_stg_reg(10),
      I4 => counter_flag_i_2_n_0,
      I5 => counter_flag_i_3_n_0,
      O => counter_flag
    );
counter_flag_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => counter_stg_reg(7),
      I1 => counter_stg_reg(3),
      I2 => counter_stg_reg(11),
      I3 => counter_stg_reg(8),
      O => counter_flag_i_2_n_0
    );
counter_flag_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => counter_stg_reg(6),
      I1 => counter_stg_reg(0),
      I2 => counter_stg_reg(9),
      I3 => counter_stg_reg(5),
      O => counter_flag_i_3_n_0
    );
counter_flag_reg: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => counter_flag,
      D => counter_flag,
      Q => counter_flag_reg_n_0,
      R => reset_out
    );
counter_stg0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => counter_stg_reg(0),
      CI_TOP => '0',
      CO(7) => counter_stg0_carry_n_0,
      CO(6) => counter_stg0_carry_n_1,
      CO(5) => counter_stg0_carry_n_2,
      CO(4) => counter_stg0_carry_n_3,
      CO(3) => counter_stg0_carry_n_4,
      CO(2) => counter_stg0_carry_n_5,
      CO(1) => counter_stg0_carry_n_6,
      CO(0) => counter_stg0_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \p_0_in__3\(8 downto 1),
      S(7 downto 0) => counter_stg_reg(8 downto 1)
    );
\counter_stg0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => counter_stg0_carry_n_0,
      CI_TOP => '0',
      CO(7 downto 2) => \NLW_counter_stg0_carry__0_CO_UNCONNECTED\(7 downto 2),
      CO(1) => \counter_stg0_carry__0_n_6\,
      CO(0) => \counter_stg0_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 3) => \NLW_counter_stg0_carry__0_O_UNCONNECTED\(7 downto 3),
      O(2 downto 0) => \p_0_in__3\(11 downto 9),
      S(7 downto 3) => B"00000",
      S(2 downto 0) => counter_stg_reg(11 downto 9)
    );
\counter_stg[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_stg_reg(0),
      O => \p_0_in__3\(0)
    );
\counter_stg[11]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_flag_reg_n_0,
      O => sel
    );
\counter_stg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(0),
      Q => counter_stg_reg(0),
      R => reset_out
    );
\counter_stg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(10),
      Q => counter_stg_reg(10),
      R => reset_out
    );
\counter_stg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(11),
      Q => counter_stg_reg(11),
      R => reset_out
    );
\counter_stg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(1),
      Q => counter_stg_reg(1),
      R => reset_out
    );
\counter_stg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(2),
      Q => counter_stg_reg(2),
      R => reset_out
    );
\counter_stg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(3),
      Q => counter_stg_reg(3),
      R => reset_out
    );
\counter_stg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(4),
      Q => counter_stg_reg(4),
      R => reset_out
    );
\counter_stg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(5),
      Q => counter_stg_reg(5),
      R => reset_out
    );
\counter_stg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(6),
      Q => counter_stg_reg(6),
      R => reset_out
    );
\counter_stg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(7),
      Q => counter_stg_reg(7),
      R => reset_out
    );
\counter_stg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(8),
      Q => counter_stg_reg(8),
      R => reset_out
    );
\counter_stg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => Tx_WrClk,
      CE => sel,
      D => \p_0_in__3\(9),
      Q => counter_stg_reg(9),
      R => reset_out
    );
decode_8b10b: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_decode_8b10b_lut_base
     port map (
      D(11) => decoded_rxcharisk,
      D(10) => decoded_rxdisperr,
      D(9) => decoded_rxnotintable,
      D(8) => decoded_rxrundisp,
      D(7 downto 0) => decoded_rxdata(7 downto 0),
      E(0) => \^al_rx_valid_out\,
      Rx_SysClk => Rx_SysClk,
      b3(7 downto 5) => b3(7 downto 5),
      code_err_i => code_err_i,
      \gdeni.disp_err_reg_0\ => serdes_1_to_10_i_n_66,
      \grdni.run_disp_i_reg_0\ => serdes_1_to_10_i_n_67,
      k => k,
      \out\(4) => serdes_1_to_10_i_n_61,
      \out\(3) => serdes_1_to_10_i_n_62,
      \out\(2) => serdes_1_to_10_i_n_63,
      \out\(1) => serdes_1_to_10_i_n_64,
      \out\(0) => serdes_1_to_10_i_n_65
    );
decoded_rxchariscomma_reg: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => \^al_rx_valid_out\,
      D => decoded_rxchariscomma0,
      Q => decoded_rxchariscomma,
      R => '0'
    );
elastic_buffer_rst_125_reg: unisim.vcomponents.FDSE
     port map (
      C => Tx_WrClk,
      CE => counter_flag,
      D => '0',
      Q => elastic_buffer_rst_125,
      S => reset_out
    );
encode_8b10b: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_encode_8b10b_lut_base
     port map (
      Tx_WrClk => Tx_WrClk,
      tx_data_10b(9 downto 0) => tx_data_10b(9 downto 0),
      txchardispmode => txchardispmode,
      txchardispval => txchardispval,
      txcharisk => txcharisk,
      txdata(7 downto 0) => txdata(7 downto 0)
    );
gb_out_inst: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_tx_ten_to_eight
     port map (
      CLK => CLK,
      \DataOut_reg[7]_0\(7 downto 0) => tx_data_8b_int(7 downto 0),
      IntRdEna_reg_0(0) => IntRdEna_reg(0),
      IntRdEna_reg_1 => IntRdEna_reg_0,
      Q(3 downto 0) => Q(3 downto 0),
      Tx_WrClk => Tx_WrClk,
      reset_out => tx_rst_125,
      tx_data_10b(9 downto 0) => tx_data_10b(9 downto 0)
    );
reset_sync_125_tx: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_3
     port map (
      Tx_WrClk => Tx_WrClk,
      reset_out => reset_out,
      reset_sync6_0 => tx_rst_125
    );
reset_sync_312_rx: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_4
     port map (
      Rx_SysClk => Rx_SysClk,
      SR(0) => \^rxrecreset0\,
      \d21p5_wr_pipe_reg[3]\ => elastic_buffer_rst_312,
      reset_out => rx_rst_312,
      reset_sync5_0 => reset_out
    );
reset_sync_312_rxelastic_buffer: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_5
     port map (
      Rx_SysClk => Rx_SysClk,
      SR(0) => reset_sync_312_rxelastic_buffer_n_0,
      data_in => \^initialize_ram_complete\,
      elastic_buffer_rst_125 => elastic_buffer_rst_125,
      mgt_rx_reset => mgt_rx_reset,
      reset_out => elastic_buffer_rst_312,
      \wr_data_reg[0]\ => rx_rst_312
    );
reset_sync_312_tx: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_6
     port map (
      CLK => CLK,
      reset_out => reset_out,
      reset_sync6_0 => tx_rst_156
    );
rx_elastic_buffer_inst: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_rx_elastic_buffer
     port map (
      D(0) => remove_idle,
      E(0) => \^al_rx_valid_out\,
      Q(2 downto 0) => \rd_occupancy_reg[6]\(2 downto 0),
      Rx_SysClk => Rx_SysClk,
      SR(0) => \^rxrecreset0\,
      Tx_WrClk => Tx_WrClk,
      \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0\ => \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1\,
      \d21p5_wr_pipe_reg[3]_0\ => \d21p5_wr_pipe_reg[3]\,
      \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0\ => \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1\,
      \d2p2_wr_pipe_reg[3]_0\ => \d2p2_wr_pipe_reg[3]\,
      data_in => \^initialize_ram_complete\,
      data_out => data_out,
      elastic_buffer_rst_125 => elastic_buffer_rst_125,
      \initialize_counter_reg[5]_0\ => \initialize_counter_reg[5]\,
      \initialize_counter_reg[5]_1\ => rx_rst_312,
      initialize_ram_complete_pulse_reg_0 => initialize_ram_complete_pulse,
      initialize_ram_complete_reg_0 => initialize_ram_complete_reg,
      initialize_ram_complete_sync_reg1 => initialize_ram_complete_sync_reg1,
      initialize_ram_complete_sync_ris_edg0 => initialize_ram_complete_sync_ris_edg0,
      \insert_idle_reg__0\ => \insert_idle_reg__0\,
      mgt_rx_reset => mgt_rx_reset,
      \rd_data_reg_reg[13]_0\(0) => \rd_data_reg_reg[13]\(0),
      \rd_occupancy_reg[0]_0\ => \rd_occupancy_reg[0]\,
      \rd_occupancy_reg[3]_0\ => \rd_occupancy_reg[3]\,
      remove_idle_reg_reg_0 => \remove_idle_reg__0\,
      reset_modified_reg_0 => reset_out,
      reset_out => elastic_buffer_rst_312,
      rxbuferr_reg_0 => rxbuferr_reg,
      rxbufstatus(0) => rxbufstatus(0),
      rxchariscomma_usr_reg_0 => rxchariscomma_usr_reg,
      rxcharisk_usr_reg_0 => rxcharisk_usr_reg,
      rxclkcorcnt(1 downto 0) => rxclkcorcnt(1 downto 0),
      \rxclkcorcnt_reg[0]_0\ => \rxclkcorcnt_reg[0]\,
      \rxdata_usr_reg[7]_0\(7 downto 0) => \rxdata_usr_reg[7]\(7 downto 0),
      rxdisperr(0) => rxdisperr(0),
      rxnotintable(0) => rxnotintable(0),
      rxrundisp(0) => rxrundisp(0),
      \wr_addr_plus2_reg[6]_0\ => \wr_addr_plus2_reg[6]\,
      \wr_data_reg[0]_0\(0) => reset_sync_312_rxelastic_buffer_n_0,
      \wr_data_reg[12]_0\(12) => decoded_rxchariscomma,
      \wr_data_reg[12]_0\(11) => decoded_rxcharisk,
      \wr_data_reg[12]_0\(10) => decoded_rxdisperr,
      \wr_data_reg[12]_0\(9) => decoded_rxnotintable,
      \wr_data_reg[12]_0\(8) => decoded_rxrundisp,
      \wr_data_reg[12]_0\(7 downto 0) => decoded_rxdata(7 downto 0)
    );
serdes_1_to_10_i: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_serdes_1_to_10
     port map (
      ActCnt_GE_HalfBT_reg_0 => ActCnt_GE_HalfBT,
      ActiveIsSlve_reg_0 => ActiveIsSlve,
      ActiveIsSlve_reg_1 => ActiveIsSlve_reg,
      Aligned => Aligned,
      Aligned_reg_0 => Aligned_reg,
      BaseX_Idly_Load(1 downto 0) => BaseX_Idly_Load(1 downto 0),
      BaseX_Rx_Fifo_Rd_En(0) => BaseX_Rx_Fifo_Rd_En(0),
      BaseX_Rx_Q_Out(7 downto 0) => BaseX_Rx_Q_Out(7 downto 0),
      D(0) => D(0),
      D0 => D0,
      E(0) => \^al_rx_valid_out\,
      \IntReset_dly_reg[0]_0\(0) => rx_rst_312,
      \IntRx_BtVal_reg[8]_0\(5 downto 0) => \IntRx_BtVal_reg[8]\(5 downto 0),
      LossOfSignal_reg_0 => LossOfSignal_reg,
      \Mstr_CntValIn_Out_reg[8]_0\(8 downto 0) => \Mstr_CntValIn_Out_reg[8]\(8 downto 0),
      Mstr_Load_reg_0(0) => Mstr_Load_reg(0),
      Mstr_Load_reg_1 => Mstr_Load_reg_0,
      Q(6 downto 0) => \Slve_CntValIn_Out_reg[8]\(6 downto 0),
      Rx_SysClk => Rx_SysClk,
      Rx_Valid_Int_reg_0(0) => Rx_Valid_Int_reg,
      SR(0) => LossOfSignal,
      \Slve_CntValIn_Out_reg[0]_0\ => \Slve_CntValIn_Out_reg[0]\,
      \Slve_CntValIn_Out_reg[1]_0\ => \Slve_CntValIn_Out_reg[1]\,
      Slve_Load_reg_0 => Slve_Load_reg,
      WrapToZero => WrapToZero,
      WrapToZero_reg_0 => WrapToZero_reg,
      \act_count_reg[0]_0\ => \act_count_reg[0]\,
      \act_count_reg[3]_0\ => \act_count_reg[3]\,
      \act_count_reg[4]_0\ => \act_count_reg[4]\,
      \act_count_reg[5]_0\(0) => \act_count_reg[5]\(0),
      \active_reg[1]_0\ => \active_reg[1]\,
      b3(7 downto 5) => b3(7 downto 5),
      code_err_i => code_err_i,
      decoded_rxchariscomma0 => decoded_rxchariscomma0,
      \gdeni.disp_err_reg\(0) => decoded_rxrundisp,
      \grdni.run_disp_i_reg\ => serdes_1_to_10_i_n_66,
      \grdni.run_disp_i_reg_0\ => serdes_1_to_10_i_n_67,
      insert3_reg_0 => insert3_reg,
      insert3_reg_1 => insert3_reg_0,
      insert5_reg_0 => insert5_reg,
      insert5_reg_1 => insert5_reg_0,
      k => k,
      monitor_late_reg_0 => monitor_late_reg,
      monitor_late_reg_1 => monitor_late_reg_0,
      \out\(4) => serdes_1_to_10_i_n_61,
      \out\(3) => serdes_1_to_10_i_n_62,
      \out\(2) => serdes_1_to_10_i_n_63,
      \out\(1) => serdes_1_to_10_i_n_64,
      \out\(0) => serdes_1_to_10_i_n_65,
      \pd_count_reg[4]_0\(4 downto 0) => \pd_count_reg[4]\(4 downto 0),
      pd_ovflw_down_reg_0 => pd_ovflw_down_reg,
      pd_ovflw_down_reg_1 => pd_ovflw_down_reg_0,
      pd_ovflw_up_reg_0 => pd_ovflw_up_reg,
      pd_ovflw_up_reg_1 => pd_ovflw_up_reg_0,
      \rxdh_reg[16]_0\ => \rxdh_reg[16]\,
      \rxdh_reg[18]_0\ => \rxdh_reg[18]\,
      \rxdh_reg[7]_0\ => \rxdh_reg[7]\,
      \s_state_reg[0]_0\ => \s_state_reg[0]\,
      \s_state_reg[0]_1\ => \s_state_reg[0]_0\,
      \s_state_reg[2]_0\ => \s_state_reg[2]\,
      \s_state_reg[3]_0\ => \s_state_reg[3]\,
      \s_state_reg[4]_0\(4 downto 0) => \s_state_reg[4]\(4 downto 0),
      \s_state_reg[4]_1\ => \s_state_reg[4]_0\,
      \s_state_reg[4]_2\ => \s_state_reg[4]_1\,
      \s_state_reg[5]_0\ => \s_state_reg[5]\
    );
\tx_data_8b_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => tx_data_8b_int(0),
      Q => \tx_data_8b_reg[7]_0\(0),
      R => tx_rst_156
    );
\tx_data_8b_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => tx_data_8b_int(1),
      Q => \tx_data_8b_reg[7]_0\(1),
      R => tx_rst_156
    );
\tx_data_8b_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => tx_data_8b_int(2),
      Q => \tx_data_8b_reg[7]_0\(2),
      R => tx_rst_156
    );
\tx_data_8b_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => tx_data_8b_int(3),
      Q => \tx_data_8b_reg[7]_0\(3),
      R => tx_rst_156
    );
\tx_data_8b_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => tx_data_8b_int(4),
      Q => \tx_data_8b_reg[7]_0\(4),
      R => tx_rst_156
    );
\tx_data_8b_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => tx_data_8b_int(5),
      Q => \tx_data_8b_reg[7]_0\(5),
      R => tx_rst_156
    );
\tx_data_8b_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => tx_data_8b_int(6),
      Q => \tx_data_8b_reg[7]_0\(6),
      R => tx_rst_156
    );
\tx_data_8b_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => tx_data_8b_int(7),
      Q => \tx_data_8b_reg[7]_0\(7),
      R => tx_rst_156
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sgmii_adapt is
  port (
    sgmii_clk_r_0 : out STD_LOGIC;
    sgmii_clk_en : out STD_LOGIC;
    gmii_rxd_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv_0 : out STD_LOGIC;
    gmii_rx_er_0 : out STD_LOGIC;
    gmii_txd_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en_out : out STD_LOGIC;
    gmii_tx_er_out : out STD_LOGIC;
    sgmii_clk_f_0 : out STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    mgt_tx_reset : in STD_LOGIC;
    speed_is_10_100_0 : in STD_LOGIC;
    speed_is_100_0 : in STD_LOGIC;
    gmii_rxd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv : in STD_LOGIC;
    gmii_rx_er_in : in STD_LOGIC;
    gmii_txd_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en_0 : in STD_LOGIC;
    gmii_tx_er_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sgmii_adapt : entity is "gig_ethernet_pcs_pma_0_sgmii_adapt";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sgmii_adapt;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sgmii_adapt is
  signal \^sgmii_clk_en\ : STD_LOGIC;
  signal speed_is_100_resync : STD_LOGIC;
  signal speed_is_10_100_resync : STD_LOGIC;
  signal sync_reset : STD_LOGIC;
begin
  sgmii_clk_en <= \^sgmii_clk_en\;
clock_generation: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_clk_gen
     port map (
      Tx_WrClk => Tx_WrClk,
      data_out => speed_is_100_resync,
      reset_out => sync_reset,
      sgmii_clk_en_reg_0 => \^sgmii_clk_en\,
      sgmii_clk_f_0 => sgmii_clk_f_0,
      sgmii_clk_r_0 => sgmii_clk_r_0,
      speed_is_10_100_fall_reg_0 => speed_is_10_100_resync
    );
gen_sync_reset: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_0
     port map (
      Tx_WrClk => Tx_WrClk,
      mgt_tx_reset => mgt_tx_reset,
      reset_out => sync_reset
    );
receiver: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_rx_rate_adapt
     port map (
      Tx_WrClk => Tx_WrClk,
      gmii_rx_dv => gmii_rx_dv,
      gmii_rx_dv_0 => gmii_rx_dv_0,
      gmii_rx_er_0 => gmii_rx_er_0,
      gmii_rx_er_in => gmii_rx_er_in,
      gmii_rx_er_out_reg_0 => \^sgmii_clk_en\,
      gmii_rxd(7 downto 0) => gmii_rxd(7 downto 0),
      gmii_rxd_0(7 downto 0) => gmii_rxd_0(7 downto 0),
      reset_out => sync_reset
    );
resync_speed_100: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block
     port map (
      Tx_WrClk => Tx_WrClk,
      data_out => speed_is_100_resync,
      speed_is_100_0 => speed_is_100_0
    );
resync_speed_10_100: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_1
     port map (
      Tx_WrClk => Tx_WrClk,
      data_out => speed_is_10_100_resync,
      speed_is_10_100_0 => speed_is_10_100_0
    );
transmitter: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_tx_rate_adapt
     port map (
      E(0) => \^sgmii_clk_en\,
      Tx_WrClk => Tx_WrClk,
      gmii_tx_en_0 => gmii_tx_en_0,
      gmii_tx_en_out => gmii_tx_en_out,
      gmii_tx_er_0 => gmii_tx_er_0,
      gmii_tx_er_out => gmii_tx_er_out,
      gmii_txd_0(7 downto 0) => gmii_txd_0(7 downto 0),
      gmii_txd_out(7 downto 0) => gmii_txd_out(7 downto 0),
      reset_out => sync_reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 is
  port (
    reset : in STD_LOGIC;
    signal_detect : in STD_LOGIC;
    link_timer_value : in STD_LOGIC_VECTOR ( 9 downto 0 );
    link_timer_basex : in STD_LOGIC_VECTOR ( 9 downto 0 );
    link_timer_sgmii : in STD_LOGIC_VECTOR ( 9 downto 0 );
    rx_gt_nominal_latency : in STD_LOGIC_VECTOR ( 15 downto 0 );
    speed_is_10_100 : in STD_LOGIC;
    speed_is_100 : in STD_LOGIC;
    mgt_rx_reset : out STD_LOGIC;
    mgt_tx_reset : out STD_LOGIC;
    userclk : in STD_LOGIC;
    userclk2 : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    rxbufstatus : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxchariscomma : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcharisk : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxclkcorcnt : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rxdisperr : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxnotintable : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxrundisp : in STD_LOGIC_VECTOR ( 0 to 0 );
    txbuferr : in STD_LOGIC;
    powerdown : out STD_LOGIC;
    txchardispmode : out STD_LOGIC;
    txchardispval : out STD_LOGIC;
    txcharisk : out STD_LOGIC;
    txdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    enablealign : out STD_LOGIC;
    gtx_clk : in STD_LOGIC;
    tx_code_group : out STD_LOGIC_VECTOR ( 9 downto 0 );
    loc_ref : out STD_LOGIC;
    ewrap : out STD_LOGIC;
    rx_code_group0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    rx_code_group1 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    pma_rx_clk0 : in STD_LOGIC;
    pma_rx_clk1 : in STD_LOGIC;
    en_cdet : out STD_LOGIC;
    gmii_txd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en : in STD_LOGIC;
    gmii_tx_er : in STD_LOGIC;
    gmii_rxd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv : out STD_LOGIC;
    gmii_rx_er : out STD_LOGIC;
    gmii_isolate : out STD_LOGIC;
    an_interrupt : out STD_LOGIC;
    an_enable : out STD_LOGIC;
    speed_selection : out STD_LOGIC_VECTOR ( 1 downto 0 );
    phyad : in STD_LOGIC_VECTOR ( 4 downto 0 );
    mdc : in STD_LOGIC;
    mdio_in : in STD_LOGIC;
    mdio_out : out STD_LOGIC;
    mdio_tri : out STD_LOGIC;
    an_adv_config_vector : in STD_LOGIC_VECTOR ( 15 downto 0 );
    an_adv_config_val : in STD_LOGIC;
    an_restart_config : in STD_LOGIC;
    configuration_vector : in STD_LOGIC_VECTOR ( 4 downto 0 );
    configuration_valid : in STD_LOGIC;
    status_vector : out STD_LOGIC_VECTOR ( 15 downto 0 );
    basex_or_sgmii : in STD_LOGIC;
    drp_dclk : in STD_LOGIC;
    drp_req : out STD_LOGIC;
    drp_gnt : in STD_LOGIC;
    drp_den : out STD_LOGIC;
    drp_dwe : out STD_LOGIC;
    drp_drdy : in STD_LOGIC;
    drp_daddr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    drp_di : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drp_do : in STD_LOGIC_VECTOR ( 15 downto 0 );
    systemtimer_s_field : in STD_LOGIC_VECTOR ( 47 downto 0 );
    systemtimer_ns_field : in STD_LOGIC_VECTOR ( 31 downto 0 );
    correction_timer : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rxrecclk : in STD_LOGIC;
    rxphy_s_field : out STD_LOGIC_VECTOR ( 47 downto 0 );
    rxphy_ns_field : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rxphy_correction_timer : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    s_axi_resetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    reset_done : in STD_LOGIC
  );
  attribute B_SHIFTER_ADDR : string;
  attribute B_SHIFTER_ADDR of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "10'b0101001110";
  attribute C_1588 : integer;
  attribute C_1588 of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is 0;
  attribute C_2_5G : string;
  attribute C_2_5G of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "FALSE";
  attribute C_COMPONENT_NAME : string;
  attribute C_COMPONENT_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "gig_ethernet_pcs_pma_0";
  attribute C_DYNAMIC_SWITCHING : string;
  attribute C_DYNAMIC_SWITCHING of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "FALSE";
  attribute C_ELABORATION_TRANSIENT_DIR : string;
  attribute C_ELABORATION_TRANSIENT_DIR of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "BlankString";
  attribute C_FAMILY : string;
  attribute C_FAMILY of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "virtexuplusHBM";
  attribute C_HAS_AN : string;
  attribute C_HAS_AN of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "TRUE";
  attribute C_HAS_AXIL : string;
  attribute C_HAS_AXIL of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "FALSE";
  attribute C_HAS_MDIO : string;
  attribute C_HAS_MDIO of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "FALSE";
  attribute C_HAS_TEMAC : string;
  attribute C_HAS_TEMAC of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "TRUE";
  attribute C_IS_SGMII : string;
  attribute C_IS_SGMII of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "TRUE";
  attribute C_RX_GMII_CLK : string;
  attribute C_RX_GMII_CLK of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "TXOUTCLK";
  attribute C_SGMII_FABRIC_BUFFER : string;
  attribute C_SGMII_FABRIC_BUFFER of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "TRUE";
  attribute C_SGMII_PHY_MODE : string;
  attribute C_SGMII_PHY_MODE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "FALSE";
  attribute C_USE_LVDS : string;
  attribute C_USE_LVDS of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "TRUE";
  attribute C_USE_TBI : string;
  attribute C_USE_TBI of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "FALSE";
  attribute C_USE_TRANSCEIVER : string;
  attribute C_USE_TRANSCEIVER of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "FALSE";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "yes";
  attribute GT_RX_BYTE_WIDTH : integer;
  attribute GT_RX_BYTE_WIDTH of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 : entity is "gig_ethernet_pcs_pma_v16_1_6";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6 is
  signal \<const0>\ : STD_LOGIC;
  signal \^status_vector\ : STD_LOGIC_VECTOR ( 13 downto 0 );
begin
  an_enable <= \<const0>\;
  drp_daddr(9) <= \<const0>\;
  drp_daddr(8) <= \<const0>\;
  drp_daddr(7) <= \<const0>\;
  drp_daddr(6) <= \<const0>\;
  drp_daddr(5) <= \<const0>\;
  drp_daddr(4) <= \<const0>\;
  drp_daddr(3) <= \<const0>\;
  drp_daddr(2) <= \<const0>\;
  drp_daddr(1) <= \<const0>\;
  drp_daddr(0) <= \<const0>\;
  drp_den <= \<const0>\;
  drp_di(15) <= \<const0>\;
  drp_di(14) <= \<const0>\;
  drp_di(13) <= \<const0>\;
  drp_di(12) <= \<const0>\;
  drp_di(11) <= \<const0>\;
  drp_di(10) <= \<const0>\;
  drp_di(9) <= \<const0>\;
  drp_di(8) <= \<const0>\;
  drp_di(7) <= \<const0>\;
  drp_di(6) <= \<const0>\;
  drp_di(5) <= \<const0>\;
  drp_di(4) <= \<const0>\;
  drp_di(3) <= \<const0>\;
  drp_di(2) <= \<const0>\;
  drp_di(1) <= \<const0>\;
  drp_di(0) <= \<const0>\;
  drp_dwe <= \<const0>\;
  drp_req <= \<const0>\;
  en_cdet <= \<const0>\;
  enablealign <= \<const0>\;
  ewrap <= \<const0>\;
  loc_ref <= \<const0>\;
  mdio_out <= \<const0>\;
  mdio_tri <= \<const0>\;
  powerdown <= \<const0>\;
  rxphy_correction_timer(63) <= \<const0>\;
  rxphy_correction_timer(62) <= \<const0>\;
  rxphy_correction_timer(61) <= \<const0>\;
  rxphy_correction_timer(60) <= \<const0>\;
  rxphy_correction_timer(59) <= \<const0>\;
  rxphy_correction_timer(58) <= \<const0>\;
  rxphy_correction_timer(57) <= \<const0>\;
  rxphy_correction_timer(56) <= \<const0>\;
  rxphy_correction_timer(55) <= \<const0>\;
  rxphy_correction_timer(54) <= \<const0>\;
  rxphy_correction_timer(53) <= \<const0>\;
  rxphy_correction_timer(52) <= \<const0>\;
  rxphy_correction_timer(51) <= \<const0>\;
  rxphy_correction_timer(50) <= \<const0>\;
  rxphy_correction_timer(49) <= \<const0>\;
  rxphy_correction_timer(48) <= \<const0>\;
  rxphy_correction_timer(47) <= \<const0>\;
  rxphy_correction_timer(46) <= \<const0>\;
  rxphy_correction_timer(45) <= \<const0>\;
  rxphy_correction_timer(44) <= \<const0>\;
  rxphy_correction_timer(43) <= \<const0>\;
  rxphy_correction_timer(42) <= \<const0>\;
  rxphy_correction_timer(41) <= \<const0>\;
  rxphy_correction_timer(40) <= \<const0>\;
  rxphy_correction_timer(39) <= \<const0>\;
  rxphy_correction_timer(38) <= \<const0>\;
  rxphy_correction_timer(37) <= \<const0>\;
  rxphy_correction_timer(36) <= \<const0>\;
  rxphy_correction_timer(35) <= \<const0>\;
  rxphy_correction_timer(34) <= \<const0>\;
  rxphy_correction_timer(33) <= \<const0>\;
  rxphy_correction_timer(32) <= \<const0>\;
  rxphy_correction_timer(31) <= \<const0>\;
  rxphy_correction_timer(30) <= \<const0>\;
  rxphy_correction_timer(29) <= \<const0>\;
  rxphy_correction_timer(28) <= \<const0>\;
  rxphy_correction_timer(27) <= \<const0>\;
  rxphy_correction_timer(26) <= \<const0>\;
  rxphy_correction_timer(25) <= \<const0>\;
  rxphy_correction_timer(24) <= \<const0>\;
  rxphy_correction_timer(23) <= \<const0>\;
  rxphy_correction_timer(22) <= \<const0>\;
  rxphy_correction_timer(21) <= \<const0>\;
  rxphy_correction_timer(20) <= \<const0>\;
  rxphy_correction_timer(19) <= \<const0>\;
  rxphy_correction_timer(18) <= \<const0>\;
  rxphy_correction_timer(17) <= \<const0>\;
  rxphy_correction_timer(16) <= \<const0>\;
  rxphy_correction_timer(15) <= \<const0>\;
  rxphy_correction_timer(14) <= \<const0>\;
  rxphy_correction_timer(13) <= \<const0>\;
  rxphy_correction_timer(12) <= \<const0>\;
  rxphy_correction_timer(11) <= \<const0>\;
  rxphy_correction_timer(10) <= \<const0>\;
  rxphy_correction_timer(9) <= \<const0>\;
  rxphy_correction_timer(8) <= \<const0>\;
  rxphy_correction_timer(7) <= \<const0>\;
  rxphy_correction_timer(6) <= \<const0>\;
  rxphy_correction_timer(5) <= \<const0>\;
  rxphy_correction_timer(4) <= \<const0>\;
  rxphy_correction_timer(3) <= \<const0>\;
  rxphy_correction_timer(2) <= \<const0>\;
  rxphy_correction_timer(1) <= \<const0>\;
  rxphy_correction_timer(0) <= \<const0>\;
  rxphy_ns_field(31) <= \<const0>\;
  rxphy_ns_field(30) <= \<const0>\;
  rxphy_ns_field(29) <= \<const0>\;
  rxphy_ns_field(28) <= \<const0>\;
  rxphy_ns_field(27) <= \<const0>\;
  rxphy_ns_field(26) <= \<const0>\;
  rxphy_ns_field(25) <= \<const0>\;
  rxphy_ns_field(24) <= \<const0>\;
  rxphy_ns_field(23) <= \<const0>\;
  rxphy_ns_field(22) <= \<const0>\;
  rxphy_ns_field(21) <= \<const0>\;
  rxphy_ns_field(20) <= \<const0>\;
  rxphy_ns_field(19) <= \<const0>\;
  rxphy_ns_field(18) <= \<const0>\;
  rxphy_ns_field(17) <= \<const0>\;
  rxphy_ns_field(16) <= \<const0>\;
  rxphy_ns_field(15) <= \<const0>\;
  rxphy_ns_field(14) <= \<const0>\;
  rxphy_ns_field(13) <= \<const0>\;
  rxphy_ns_field(12) <= \<const0>\;
  rxphy_ns_field(11) <= \<const0>\;
  rxphy_ns_field(10) <= \<const0>\;
  rxphy_ns_field(9) <= \<const0>\;
  rxphy_ns_field(8) <= \<const0>\;
  rxphy_ns_field(7) <= \<const0>\;
  rxphy_ns_field(6) <= \<const0>\;
  rxphy_ns_field(5) <= \<const0>\;
  rxphy_ns_field(4) <= \<const0>\;
  rxphy_ns_field(3) <= \<const0>\;
  rxphy_ns_field(2) <= \<const0>\;
  rxphy_ns_field(1) <= \<const0>\;
  rxphy_ns_field(0) <= \<const0>\;
  rxphy_s_field(47) <= \<const0>\;
  rxphy_s_field(46) <= \<const0>\;
  rxphy_s_field(45) <= \<const0>\;
  rxphy_s_field(44) <= \<const0>\;
  rxphy_s_field(43) <= \<const0>\;
  rxphy_s_field(42) <= \<const0>\;
  rxphy_s_field(41) <= \<const0>\;
  rxphy_s_field(40) <= \<const0>\;
  rxphy_s_field(39) <= \<const0>\;
  rxphy_s_field(38) <= \<const0>\;
  rxphy_s_field(37) <= \<const0>\;
  rxphy_s_field(36) <= \<const0>\;
  rxphy_s_field(35) <= \<const0>\;
  rxphy_s_field(34) <= \<const0>\;
  rxphy_s_field(33) <= \<const0>\;
  rxphy_s_field(32) <= \<const0>\;
  rxphy_s_field(31) <= \<const0>\;
  rxphy_s_field(30) <= \<const0>\;
  rxphy_s_field(29) <= \<const0>\;
  rxphy_s_field(28) <= \<const0>\;
  rxphy_s_field(27) <= \<const0>\;
  rxphy_s_field(26) <= \<const0>\;
  rxphy_s_field(25) <= \<const0>\;
  rxphy_s_field(24) <= \<const0>\;
  rxphy_s_field(23) <= \<const0>\;
  rxphy_s_field(22) <= \<const0>\;
  rxphy_s_field(21) <= \<const0>\;
  rxphy_s_field(20) <= \<const0>\;
  rxphy_s_field(19) <= \<const0>\;
  rxphy_s_field(18) <= \<const0>\;
  rxphy_s_field(17) <= \<const0>\;
  rxphy_s_field(16) <= \<const0>\;
  rxphy_s_field(15) <= \<const0>\;
  rxphy_s_field(14) <= \<const0>\;
  rxphy_s_field(13) <= \<const0>\;
  rxphy_s_field(12) <= \<const0>\;
  rxphy_s_field(11) <= \<const0>\;
  rxphy_s_field(10) <= \<const0>\;
  rxphy_s_field(9) <= \<const0>\;
  rxphy_s_field(8) <= \<const0>\;
  rxphy_s_field(7) <= \<const0>\;
  rxphy_s_field(6) <= \<const0>\;
  rxphy_s_field(5) <= \<const0>\;
  rxphy_s_field(4) <= \<const0>\;
  rxphy_s_field(3) <= \<const0>\;
  rxphy_s_field(2) <= \<const0>\;
  rxphy_s_field(1) <= \<const0>\;
  rxphy_s_field(0) <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_wready <= \<const0>\;
  speed_selection(1) <= \<const0>\;
  speed_selection(0) <= \<const0>\;
  status_vector(15) <= \<const0>\;
  status_vector(14) <= \<const0>\;
  status_vector(13 downto 9) <= \^status_vector\(13 downto 9);
  status_vector(8) <= \<const0>\;
  status_vector(7 downto 0) <= \^status_vector\(7 downto 0);
  tx_code_group(9) <= \<const0>\;
  tx_code_group(8) <= \<const0>\;
  tx_code_group(7) <= \<const0>\;
  tx_code_group(6) <= \<const0>\;
  tx_code_group(5) <= \<const0>\;
  tx_code_group(4) <= \<const0>\;
  tx_code_group(3) <= \<const0>\;
  tx_code_group(2) <= \<const0>\;
  tx_code_group(1) <= \<const0>\;
  tx_code_group(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
gpcs_pma_inst: entity work.gig_ethernet_pcs_pma_0_GPCS_PMA_GEN
     port map (
      MGT_RX_RESET => mgt_rx_reset,
      MGT_TX_RESET => mgt_tx_reset,
      Q(0) => gmii_isolate,
      an_adv_config_vector(0) => an_adv_config_vector(11),
      an_interrupt => an_interrupt,
      an_restart_config => an_restart_config,
      configuration_vector(4 downto 0) => configuration_vector(4 downto 0),
      gmii_rx_dv => gmii_rx_dv,
      gmii_rx_er => gmii_rx_er,
      gmii_rxd(7 downto 0) => gmii_rxd(7 downto 0),
      gmii_tx_en => gmii_tx_en,
      gmii_tx_er => gmii_tx_er,
      gmii_txd(7 downto 0) => gmii_txd(7 downto 0),
      reset => reset,
      rxbufstatus(0) => rxbufstatus(1),
      rxchariscomma(0) => rxchariscomma(0),
      rxcharisk(0) => rxcharisk(0),
      rxclkcorcnt(1) => rxclkcorcnt(2),
      rxclkcorcnt(0) => rxclkcorcnt(0),
      rxdata(7 downto 0) => rxdata(7 downto 0),
      rxdisperr(0) => rxdisperr(0),
      rxnotintable(0) => rxnotintable(0),
      rxrundisp(0) => rxrundisp(0),
      signal_detect => signal_detect,
      status_vector(12 downto 8) => \^status_vector\(13 downto 9),
      status_vector(7 downto 0) => \^status_vector\(7 downto 0),
      txchardispmode => txchardispmode,
      txchardispval => txchardispval,
      txcharisk => txcharisk,
      txdata(7 downto 0) => txdata(7 downto 0),
      userclk2 => userclk2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block is
  port (
    Tx_Dly_Rdy : out STD_LOGIC;
    Tx_Vtc_Rdy : out STD_LOGIC;
    Rx_Dly_Rdy : out STD_LOGIC;
    Rx_Vtc_Rdy : out STD_LOGIC;
    riu_rd_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid : out STD_LOGIC;
    riu_prsnt : out STD_LOGIC;
    sgmii_clk_r_0 : out STD_LOGIC;
    sgmii_clk_en_0 : out STD_LOGIC;
    gmii_rxd_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv_0 : out STD_LOGIC;
    gmii_rx_er_0 : out STD_LOGIC;
    sgmii_clk_f_0 : out STD_LOGIC;
    gmii_isolate_0 : out STD_LOGIC;
    an_interrupt_0 : out STD_LOGIC;
    status_vector_0 : out STD_LOGIC_VECTOR ( 12 downto 0 );
    txp_0 : out STD_LOGIC;
    txn_0 : out STD_LOGIC;
    Rx_SysClk : in STD_LOGIC;
    tx_dly_rdy_3 : in STD_LOGIC;
    tx_dly_rdy_1 : in STD_LOGIC;
    tx_dly_rdy_2 : in STD_LOGIC;
    tx_vtc_rdy_3 : in STD_LOGIC;
    tx_vtc_rdy_1 : in STD_LOGIC;
    tx_vtc_rdy_2 : in STD_LOGIC;
    rx_dly_rdy_3 : in STD_LOGIC;
    rx_dly_rdy_1 : in STD_LOGIC;
    rx_dly_rdy_2 : in STD_LOGIC;
    rx_vtc_rdy_3 : in STD_LOGIC;
    rx_vtc_rdy_1 : in STD_LOGIC;
    rx_vtc_rdy_2 : in STD_LOGIC;
    tx_bsc_rst_out : in STD_LOGIC;
    rx_bsc_rst_out : in STD_LOGIC;
    tx_bs_rst_out : in STD_LOGIC;
    rx_bs_rst_out : in STD_LOGIC;
    tx_rst_dly_out : in STD_LOGIC;
    rx_rst_dly_out : in STD_LOGIC;
    tx_bsc_en_vtc_out : in STD_LOGIC;
    rx_bsc_en_vtc_out : in STD_LOGIC;
    tx_bs_en_vtc_out : in STD_LOGIC;
    rx_bs_en_vtc_out : in STD_LOGIC;
    riu_clk_out : in STD_LOGIC;
    riu_addr_out : in STD_LOGIC_VECTOR ( 5 downto 0 );
    riu_wr_data_out : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_wr_en_out : in STD_LOGIC;
    riu_nibble_sel_out : in STD_LOGIC_VECTOR ( 1 downto 0 );
    tx_pll_clk_out : in STD_LOGIC;
    rx_pll_clk_out : in STD_LOGIC;
    dummy_port_in : in STD_LOGIC;
    CLK : in STD_LOGIC;
    Tx_WrClk : in STD_LOGIC;
    speed_is_10_100_0 : in STD_LOGIC;
    speed_is_100_0 : in STD_LOGIC;
    gmii_txd_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en_0 : in STD_LOGIC;
    gmii_tx_er_0 : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    signal_detect_0 : in STD_LOGIC;
    an_adv_config_vector_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    an_restart_config_0 : in STD_LOGIC;
    configuration_vector_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    D : in STD_LOGIC_VECTOR ( 5 downto 0 );
    rxp_0 : in STD_LOGIC;
    rxn_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block : entity is "gig_ethernet_pcs_pma_0_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block is
  signal ActiveIsSlve_i_1_n_0 : STD_LOGIC;
  signal Aligned_i_1_n_0 : STD_LOGIC;
  signal BaseX_Tx_Data_Out : STD_LOGIC_VECTOR ( 2 to 2 );
  signal IntRdEna_i_1_n_0 : STD_LOGIC;
  signal LossOfSignal_i_1_n_0 : STD_LOGIC;
  signal Mstr_Load_i_1_n_0 : STD_LOGIC;
  signal Rx_Dly_Rdy_Int : STD_LOGIC;
  signal Rx_Vtc_Rdy_Int : STD_LOGIC;
  signal Slve_Load_i_1_n_0 : STD_LOGIC;
  signal Tx_Dly_Rdy_Int : STD_LOGIC;
  signal Tx_Vtc_Rdy_Int : STD_LOGIC;
  signal WrapToZero_i_1_n_0 : STD_LOGIC;
  signal al_rx_valid_out : STD_LOGIC;
  signal fifo_empty : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal fifo_read_0 : STD_LOGIC;
  signal \gb_out_inst/IntWrAddr_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \gb_out_inst/p_0_in\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_1\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_100\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_101\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_102\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_103\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_104\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_105\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_24\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_25\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_27\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_28\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_29\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_3\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_30\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_31\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_33\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_36\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_37\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_38\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_39\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_40\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_41\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_42\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_43\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_44\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_45\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_47\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_48\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_49\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_51\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_52\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_53\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_54\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_55\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_56\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_57\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_63\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_64\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_65\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_66\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_72\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_91\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_92\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_93\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_94\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_95\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_96\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_97\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_98\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_99\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate__0_n_0\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate_n_0\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_n_0\ : STD_LOGIC;
  signal \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_n_0\ : STD_LOGIC;
  signal gmii_rx_dv_int : STD_LOGIC;
  signal gmii_rx_er_int : STD_LOGIC;
  signal gmii_rxd_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gmii_tx_en_int : STD_LOGIC;
  signal gmii_tx_er_int : STD_LOGIC;
  signal gmii_txd_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal initialize_ram_complete_i_1_n_0 : STD_LOGIC;
  signal insert3_i_1_n_0 : STD_LOGIC;
  signal insert5_i_1_n_0 : STD_LOGIC;
  signal mgt_rx_reset : STD_LOGIC;
  signal mgt_tx_reset_0 : STD_LOGIC;
  signal mload : STD_LOGIC;
  signal monitor_late_i_1_n_0 : STD_LOGIC;
  signal pd_ovflw_down_i_1_n_0 : STD_LOGIC;
  signal pd_ovflw_up_i_1_n_0 : STD_LOGIC;
  signal \rx_elastic_buffer_inst/initialize_ram_complete\ : STD_LOGIC;
  signal \rx_elastic_buffer_inst/initialize_ram_complete_pulse\ : STD_LOGIC;
  signal \rx_elastic_buffer_inst/initialize_ram_complete_sync\ : STD_LOGIC;
  signal \rx_elastic_buffer_inst/initialize_ram_complete_sync_reg1\ : STD_LOGIC;
  signal \rx_elastic_buffer_inst/initialize_ram_complete_sync_ris_edg0\ : STD_LOGIC;
  signal \rx_elastic_buffer_inst/insert_idle_reg__0\ : STD_LOGIC;
  signal \rx_elastic_buffer_inst/rd_occupancy\ : STD_LOGIC_VECTOR ( 6 downto 4 );
  signal \rx_elastic_buffer_inst/remove_idle\ : STD_LOGIC;
  signal \rx_elastic_buffer_inst/remove_idle_reg__0\ : STD_LOGIC;
  signal rxbuferr : STD_LOGIC;
  signal rxbuferr_i_1_n_0 : STD_LOGIC;
  signal rxchariscomma : STD_LOGIC;
  signal rxcharisk : STD_LOGIC;
  signal rxclkcorcnt : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \rxclkcorcnt[0]_i_1_n_0\ : STD_LOGIC;
  signal rxdata : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rxdisperr : STD_LOGIC;
  signal rxn_diffout : STD_LOGIC;
  signal rxnotintable : STD_LOGIC;
  signal rxp_diffout : STD_LOGIC;
  signal rxrecreset0 : STD_LOGIC;
  signal rxrundisp : STD_LOGIC;
  signal \serdes_1_to_10_i/ActCnt_GE_HalfBT\ : STD_LOGIC;
  signal \serdes_1_to_10_i/ActiveIsSlve\ : STD_LOGIC;
  signal \serdes_1_to_10_i/Aligned\ : STD_LOGIC;
  signal \serdes_1_to_10_i/D0\ : STD_LOGIC;
  signal \serdes_1_to_10_i/LossOfSignal\ : STD_LOGIC;
  signal \serdes_1_to_10_i/WrapToZero\ : STD_LOGIC;
  signal \serdes_1_to_10_i/act_count_reg\ : STD_LOGIC_VECTOR ( 5 to 5 );
  signal \serdes_1_to_10_i/p_0_in\ : STD_LOGIC;
  signal \serdes_1_to_10_i/pd_count\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal serdesm_data : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal serdess_data : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal sload : STD_LOGIC;
  signal tx_data_8b : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal txchardispmode : STD_LOGIC;
  signal txchardispval : STD_LOGIC;
  signal txcharisk : STD_LOGIC;
  signal txdata : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \wr_addr[6]_i_2_n_0\ : STD_LOGIC;
  signal NLW_gen_io_logic_BaseX_Idly_CntValueOut_UNCONNECTED : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal NLW_gen_io_logic_BaseX_Odly_CntValueOut_UNCONNECTED : STD_LOGIC_VECTOR ( 62 downto 0 );
  signal NLW_gen_io_logic_BaseX_Rx_Fifo_Empty_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_gen_io_logic_BaseX_Rx_Q_CombOut_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_gen_io_logic_BaseX_Rx_Q_Out_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gen_io_logic_BaseX_TriOdly_CntValueOut_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_gen_io_logic_BaseX_Tx_Data_Out_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_gen_io_logic_BaseX_Tx_Tri_Out_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_an_enable_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_drp_den_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_drp_dwe_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_drp_req_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_en_cdet_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_enablealign_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_ewrap_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_loc_ref_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_mdio_out_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_mdio_tri_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_powerdown_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_arready_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_awready_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_bvalid_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_rvalid_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_wready_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_drp_daddr_UNCONNECTED\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_drp_di_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_rxphy_correction_timer_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_rxphy_ns_field_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_rxphy_s_field_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_bresp_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_rdata_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_rresp_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_speed_selection_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_status_vector_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_tx_code_group_UNCONNECTED\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute box_type : string;
  attribute box_type of \gen_IOB.gen_IOB[0].data_in\ : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of \gen_IOB.gen_IOB[0].io_data_out\ : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gen_IOB.gen_IOB[0].io_data_out\ : label is "OBUFDS";
  attribute box_type of \gen_IOB.gen_IOB[0].io_data_out\ : label is "PRIMITIVE";
  attribute C_BytePosition : integer;
  attribute C_BytePosition of gen_io_logic : label is 0;
  attribute C_IoBank : integer;
  attribute C_IoBank of gen_io_logic : label is 44;
  attribute C_Part : string;
  attribute C_Part of gen_io_logic : label is "XCKU060";
  attribute C_Rx_BtslcNulType : string;
  attribute C_Rx_BtslcNulType of gen_io_logic : label is "SERIAL";
  attribute C_Rx_Data_Width : integer;
  attribute C_Rx_Data_Width of gen_io_logic : label is 4;
  attribute C_Rx_Delay_Format : string;
  attribute C_Rx_Delay_Format of gen_io_logic : label is "COUNT";
  attribute C_Rx_Delay_Type : string;
  attribute C_Rx_Delay_Type of gen_io_logic : label is "VAR_LOAD";
  attribute C_Rx_Delay_Value : integer;
  attribute C_Rx_Delay_Value of gen_io_logic : label is 0;
  attribute C_Rx_RefClk_Frequency : string;
  attribute C_Rx_RefClk_Frequency of gen_io_logic : label is "312.500000";
  attribute C_Rx_Self_Calibrate : string;
  attribute C_Rx_Self_Calibrate of gen_io_logic : label is "ENABLE";
  attribute C_Rx_Serial_Mode : string;
  attribute C_Rx_Serial_Mode of gen_io_logic : label is "TRUE";
  attribute C_Rx_UsedBitslices : string;
  attribute C_Rx_UsedBitslices of gen_io_logic : label is "7'b0110001";
  attribute C_TxInUpperNibble : integer;
  attribute C_TxInUpperNibble of gen_io_logic : label is 1;
  attribute C_Tx_BtslceTr : string;
  attribute C_Tx_BtslceTr of gen_io_logic : label is "T";
  attribute C_Tx_BtslceUsedAsT : string;
  attribute C_Tx_BtslceUsedAsT of gen_io_logic : label is "7'b0000000";
  attribute C_Tx_Data_Width : integer;
  attribute C_Tx_Data_Width of gen_io_logic : label is 8;
  attribute C_Tx_Delay_Format : string;
  attribute C_Tx_Delay_Format of gen_io_logic : label is "TIME";
  attribute C_Tx_Delay_Type : string;
  attribute C_Tx_Delay_Type of gen_io_logic : label is "FIXED";
  attribute C_Tx_Delay_Value : integer;
  attribute C_Tx_Delay_Value of gen_io_logic : label is 0;
  attribute C_Tx_RefClk_Frequency : string;
  attribute C_Tx_RefClk_Frequency of gen_io_logic : label is "1250.000000";
  attribute C_Tx_Self_Calibrate : string;
  attribute C_Tx_Self_Calibrate of gen_io_logic : label is "ENABLE";
  attribute C_Tx_Serial_Mode : string;
  attribute C_Tx_Serial_Mode of gen_io_logic : label is "FALSE";
  attribute C_Tx_UsedBitslices : string;
  attribute C_Tx_UsedBitslices of gen_io_logic : label is "7'b0000100";
  attribute C_UseRxRiu : integer;
  attribute C_UseRxRiu of gen_io_logic : label is 1;
  attribute C_UseTxRiu : integer;
  attribute C_UseTxRiu of gen_io_logic : label is 1;
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of gen_io_logic : label is std.standard.true;
  attribute B_SHIFTER_ADDR : string;
  attribute B_SHIFTER_ADDR of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "10'b0101001110";
  attribute C_1588 : integer;
  attribute C_1588 of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is 0;
  attribute C_2_5G : string;
  attribute C_2_5G of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "FALSE";
  attribute C_COMPONENT_NAME : string;
  attribute C_COMPONENT_NAME of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "gig_ethernet_pcs_pma_0";
  attribute C_DYNAMIC_SWITCHING : string;
  attribute C_DYNAMIC_SWITCHING of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "FALSE";
  attribute C_ELABORATION_TRANSIENT_DIR : string;
  attribute C_ELABORATION_TRANSIENT_DIR of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "BlankString";
  attribute C_FAMILY : string;
  attribute C_FAMILY of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "virtexuplusHBM";
  attribute C_HAS_AN : string;
  attribute C_HAS_AN of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "TRUE";
  attribute C_HAS_AXIL : string;
  attribute C_HAS_AXIL of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "FALSE";
  attribute C_HAS_MDIO : string;
  attribute C_HAS_MDIO of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "FALSE";
  attribute C_HAS_TEMAC : string;
  attribute C_HAS_TEMAC of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "TRUE";
  attribute C_IS_SGMII : string;
  attribute C_IS_SGMII of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "TRUE";
  attribute C_RX_GMII_CLK : string;
  attribute C_RX_GMII_CLK of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "TXOUTCLK";
  attribute C_SGMII_FABRIC_BUFFER : string;
  attribute C_SGMII_FABRIC_BUFFER of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "TRUE";
  attribute C_SGMII_PHY_MODE : string;
  attribute C_SGMII_PHY_MODE of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "FALSE";
  attribute C_USE_LVDS : string;
  attribute C_USE_LVDS of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "TRUE";
  attribute C_USE_TBI : string;
  attribute C_USE_TBI of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "FALSE";
  attribute C_USE_TRANSCEIVER : string;
  attribute C_USE_TRANSCEIVER of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "FALSE";
  attribute GT_RX_BYTE_WIDTH : integer;
  attribute GT_RX_BYTE_WIDTH of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is 1;
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate\ : label is "soft_lutpair187";
  attribute SOFT_HLUTNM of \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate__0\ : label is "soft_lutpair187";
begin
ActiveIsSlve_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_49\,
      I1 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_47\,
      I2 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_48\,
      I3 => \serdes_1_to_10_i/p_0_in\,
      I4 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_95\,
      I5 => \serdes_1_to_10_i/ActiveIsSlve\,
      O => ActiveIsSlve_i_1_n_0
    );
Aligned_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFD00"
    )
        port map (
      I0 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_65\,
      I1 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_101\,
      I2 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_64\,
      I3 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_33\,
      I4 => \serdes_1_to_10_i/Aligned\,
      O => Aligned_i_1_n_0
    );
FifoRd_0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_empty(4),
      I1 => fifo_empty(5),
      O => \serdes_1_to_10_i/D0\
    );
IntRdEna_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0010"
    )
        port map (
      I0 => \gb_out_inst/IntWrAddr_reg\(2),
      I1 => \gb_out_inst/IntWrAddr_reg\(3),
      I2 => \gb_out_inst/IntWrAddr_reg\(1),
      I3 => \gb_out_inst/IntWrAddr_reg\(0),
      I4 => \gb_out_inst/p_0_in\(0),
      O => IntRdEna_i_1_n_0
    );
LossOfSignal_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0AAAAAABAAABA"
    )
        port map (
      I0 => \serdes_1_to_10_i/LossOfSignal\,
      I1 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_100\,
      I2 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_97\,
      I3 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_98\,
      I4 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_99\,
      I5 => \serdes_1_to_10_i/act_count_reg\(5),
      O => LossOfSignal_i_1_n_0
    );
Mstr_Load_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBABBAAB88A88AA8"
    )
        port map (
      I0 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_94\,
      I1 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_93\,
      I2 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_92\,
      I3 => \serdes_1_to_10_i/ActiveIsSlve\,
      I4 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_96\,
      I5 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_25\,
      O => Mstr_Load_i_1_n_0
    );
Slve_Load_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAFFEAAAAA002"
    )
        port map (
      I0 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_94\,
      I1 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_96\,
      I2 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_92\,
      I3 => \serdes_1_to_10_i/ActiveIsSlve\,
      I4 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_93\,
      I5 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_24\,
      O => Slve_Load_i_1_n_0
    );
WrapToZero_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFAF00000020"
    )
        port map (
      I0 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_49\,
      I1 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_48\,
      I2 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_95\,
      I3 => \serdes_1_to_10_i/p_0_in\,
      I4 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_47\,
      I5 => \serdes_1_to_10_i/WrapToZero\,
      O => WrapToZero_i_1_n_0
    );
clock_reset_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => tx_dly_rdy_3,
      I1 => Tx_Dly_Rdy_Int,
      I2 => tx_dly_rdy_1,
      I3 => tx_dly_rdy_2,
      O => Tx_Dly_Rdy
    );
clock_reset_i_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => tx_vtc_rdy_3,
      I1 => Tx_Vtc_Rdy_Int,
      I2 => tx_vtc_rdy_1,
      I3 => tx_vtc_rdy_2,
      O => Tx_Vtc_Rdy
    );
clock_reset_i_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => rx_dly_rdy_3,
      I1 => Rx_Dly_Rdy_Int,
      I2 => rx_dly_rdy_1,
      I3 => rx_dly_rdy_2,
      O => Rx_Dly_Rdy
    );
clock_reset_i_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => rx_vtc_rdy_3,
      I1 => Rx_Vtc_Rdy_Int,
      I2 => rx_vtc_rdy_1,
      I3 => rx_vtc_rdy_2,
      O => Rx_Vtc_Rdy
    );
\gen_IOB.gen_IOB[0].data_in\: unisim.vcomponents.IBUFDS_DIFF_OUT
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => rxp_0,
      IB => rxn_0,
      O => rxp_diffout,
      OB => rxn_diffout
    );
\gen_IOB.gen_IOB[0].io_data_out\: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => BaseX_Tx_Data_Out(2),
      O => txp_0,
      OB => txn_0
    );
gen_io_logic: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_BaseX_Byte
     port map (
      BaseX_Dly_Clk => Rx_SysClk,
      BaseX_Idly_Ce(5 downto 0) => B"000000",
      BaseX_Idly_CntValueIn(53) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_51\,
      BaseX_Idly_CntValueIn(52) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_52\,
      BaseX_Idly_CntValueIn(51) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_53\,
      BaseX_Idly_CntValueIn(50) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_54\,
      BaseX_Idly_CntValueIn(49) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_55\,
      BaseX_Idly_CntValueIn(48) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_56\,
      BaseX_Idly_CntValueIn(47) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_57\,
      BaseX_Idly_CntValueIn(46) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_63\,
      BaseX_Idly_CntValueIn(45) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_66\,
      BaseX_Idly_CntValueIn(44) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_36\,
      BaseX_Idly_CntValueIn(43) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_37\,
      BaseX_Idly_CntValueIn(42) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_38\,
      BaseX_Idly_CntValueIn(41) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_39\,
      BaseX_Idly_CntValueIn(40) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_40\,
      BaseX_Idly_CntValueIn(39) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_41\,
      BaseX_Idly_CntValueIn(38) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_42\,
      BaseX_Idly_CntValueIn(37) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_43\,
      BaseX_Idly_CntValueIn(36) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_44\,
      BaseX_Idly_CntValueIn(35 downto 0) => B"000000000000000000000000000000000000",
      BaseX_Idly_CntValueOut(53 downto 0) => NLW_gen_io_logic_BaseX_Idly_CntValueOut_UNCONNECTED(53 downto 0),
      BaseX_Idly_Inc(5 downto 0) => B"000000",
      BaseX_Idly_Load(5) => sload,
      BaseX_Idly_Load(4) => mload,
      BaseX_Idly_Load(3 downto 0) => B"0000",
      BaseX_Odly_Ce(6 downto 0) => B"0000000",
      BaseX_Odly_CntValueIn(62 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000",
      BaseX_Odly_CntValueOut(62 downto 0) => NLW_gen_io_logic_BaseX_Odly_CntValueOut_UNCONNECTED(62 downto 0),
      BaseX_Odly_Inc(6 downto 0) => B"0000000",
      BaseX_Odly_Load(6 downto 0) => B"0000000",
      BaseX_Riu_Addr(5 downto 0) => riu_addr_out(5 downto 0),
      BaseX_Riu_Clk => riu_clk_out,
      BaseX_Riu_Nibble_Sel(1 downto 0) => riu_nibble_sel_out(1 downto 0),
      BaseX_Riu_Prsnt => riu_prsnt,
      BaseX_Riu_Rd_Data(15 downto 0) => riu_rd_data(15 downto 0),
      BaseX_Riu_Valid => riu_valid,
      BaseX_Riu_Wr_Data(15 downto 0) => riu_wr_data_out(15 downto 0),
      BaseX_Riu_Wr_En => riu_wr_en_out,
      BaseX_Rx_Bs_En_Vtc => rx_bs_en_vtc_out,
      BaseX_Rx_Bs_Rst => rx_bs_rst_out,
      BaseX_Rx_Bsc_En_Vtc => rx_bsc_en_vtc_out,
      BaseX_Rx_Bsc_Rst => rx_bsc_rst_out,
      BaseX_Rx_Data_In(5) => rxn_diffout,
      BaseX_Rx_Data_In(4) => rxp_diffout,
      BaseX_Rx_Data_In(3 downto 1) => B"000",
      BaseX_Rx_Data_In(0) => dummy_port_in,
      BaseX_Rx_Dly_Rdy => Rx_Dly_Rdy_Int,
      BaseX_Rx_Fifo_Empty(5 downto 4) => fifo_empty(5 downto 4),
      BaseX_Rx_Fifo_Empty(3 downto 0) => NLW_gen_io_logic_BaseX_Rx_Fifo_Empty_UNCONNECTED(3 downto 0),
      BaseX_Rx_Fifo_Rd_Clk => Rx_SysClk,
      BaseX_Rx_Fifo_Rd_En(5) => fifo_read_0,
      BaseX_Rx_Fifo_Rd_En(4) => fifo_read_0,
      BaseX_Rx_Fifo_Rd_En(3 downto 0) => B"0000",
      BaseX_Rx_Phy_Rden(3 downto 0) => B"1111",
      BaseX_Rx_Pll_Clk => rx_pll_clk_out,
      BaseX_Rx_Q_CombOut(5 downto 0) => NLW_gen_io_logic_BaseX_Rx_Q_CombOut_UNCONNECTED(5 downto 0),
      BaseX_Rx_Q_Out(23 downto 20) => serdess_data(3 downto 0),
      BaseX_Rx_Q_Out(19 downto 16) => serdesm_data(3 downto 0),
      BaseX_Rx_Q_Out(15 downto 0) => NLW_gen_io_logic_BaseX_Rx_Q_Out_UNCONNECTED(15 downto 0),
      BaseX_Rx_Rst_Dly => rx_rst_dly_out,
      BaseX_Rx_Vtc_Rdy => Rx_Vtc_Rdy_Int,
      BaseX_TriOdly_Ce => '0',
      BaseX_TriOdly_CntValueIn(8 downto 0) => B"000000000",
      BaseX_TriOdly_CntValueOut(8 downto 0) => NLW_gen_io_logic_BaseX_TriOdly_CntValueOut_UNCONNECTED(8 downto 0),
      BaseX_TriOdly_Inc => '0',
      BaseX_TriOdly_Load => '0',
      BaseX_Tx_Bs_En_Vtc => tx_bs_en_vtc_out,
      BaseX_Tx_Bs_Rst => tx_bs_rst_out,
      BaseX_Tx_Bsc_En_Vtc => tx_bsc_en_vtc_out,
      BaseX_Tx_Bsc_Rst => tx_bsc_rst_out,
      BaseX_Tx_D_In(55 downto 24) => B"00000000000000000000000000000000",
      BaseX_Tx_D_In(23 downto 16) => tx_data_8b(7 downto 0),
      BaseX_Tx_D_In(15 downto 0) => B"0000000000000000",
      BaseX_Tx_Data_Out(6 downto 3) => NLW_gen_io_logic_BaseX_Tx_Data_Out_UNCONNECTED(6 downto 3),
      BaseX_Tx_Data_Out(2) => BaseX_Tx_Data_Out(2),
      BaseX_Tx_Data_Out(1 downto 0) => NLW_gen_io_logic_BaseX_Tx_Data_Out_UNCONNECTED(1 downto 0),
      BaseX_Tx_Dly_Rdy => Tx_Dly_Rdy_Int,
      BaseX_Tx_Phy_Rden(3 downto 0) => B"0000",
      BaseX_Tx_Pll_Clk => tx_pll_clk_out,
      BaseX_Tx_Rst_Dly => tx_rst_dly_out,
      BaseX_Tx_T_In(6 downto 0) => B"0000000",
      BaseX_Tx_TbyteIn(3 downto 0) => B"0000",
      BaseX_Tx_Tri_Out(6 downto 0) => NLW_gen_io_logic_BaseX_Tx_Tri_Out_UNCONNECTED(6 downto 0),
      BaseX_Tx_Vtc_Rdy => Tx_Vtc_Rdy_Int,
      Tx_RdClk => CLK
    );
\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_1_6
     port map (
      an_adv_config_val => '0',
      an_adv_config_vector(15 downto 12) => B"0000",
      an_adv_config_vector(11) => an_adv_config_vector_0(0),
      an_adv_config_vector(10 downto 0) => B"00000000000",
      an_enable => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_an_enable_UNCONNECTED\,
      an_interrupt => an_interrupt_0,
      an_restart_config => an_restart_config_0,
      basex_or_sgmii => '0',
      configuration_valid => '0',
      configuration_vector(4 downto 0) => configuration_vector_0(4 downto 0),
      correction_timer(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      dcm_locked => '1',
      drp_daddr(9 downto 0) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_drp_daddr_UNCONNECTED\(9 downto 0),
      drp_dclk => '0',
      drp_den => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_drp_den_UNCONNECTED\,
      drp_di(15 downto 0) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_drp_di_UNCONNECTED\(15 downto 0),
      drp_do(15 downto 0) => B"0000000000000000",
      drp_drdy => '0',
      drp_dwe => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_drp_dwe_UNCONNECTED\,
      drp_gnt => '0',
      drp_req => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_drp_req_UNCONNECTED\,
      en_cdet => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_en_cdet_UNCONNECTED\,
      enablealign => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_enablealign_UNCONNECTED\,
      ewrap => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_ewrap_UNCONNECTED\,
      gmii_isolate => gmii_isolate_0,
      gmii_rx_dv => gmii_rx_dv_int,
      gmii_rx_er => gmii_rx_er_int,
      gmii_rxd(7 downto 0) => gmii_rxd_int(7 downto 0),
      gmii_tx_en => gmii_tx_en_int,
      gmii_tx_er => gmii_tx_er_int,
      gmii_txd(7 downto 0) => gmii_txd_int(7 downto 0),
      gtx_clk => '0',
      link_timer_basex(9 downto 0) => B"0000000000",
      link_timer_sgmii(9 downto 0) => B"0000000000",
      link_timer_value(9 downto 0) => B"0000110010",
      loc_ref => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_loc_ref_UNCONNECTED\,
      mdc => '0',
      mdio_in => '0',
      mdio_out => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_mdio_out_UNCONNECTED\,
      mdio_tri => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_mdio_tri_UNCONNECTED\,
      mgt_rx_reset => mgt_rx_reset,
      mgt_tx_reset => mgt_tx_reset_0,
      phyad(4 downto 0) => B"00000",
      pma_rx_clk0 => '0',
      pma_rx_clk1 => '0',
      powerdown => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_powerdown_UNCONNECTED\,
      reset => reset_out,
      reset_done => '1',
      rx_code_group0(9 downto 0) => B"0000000000",
      rx_code_group1(9 downto 0) => B"0000000000",
      rx_gt_nominal_latency(15 downto 0) => B"0000000011001000",
      rxbufstatus(1) => rxbuferr,
      rxbufstatus(0) => '0',
      rxchariscomma(0) => rxchariscomma,
      rxcharisk(0) => rxcharisk,
      rxclkcorcnt(2) => rxclkcorcnt(2),
      rxclkcorcnt(1) => '0',
      rxclkcorcnt(0) => rxclkcorcnt(0),
      rxdata(7 downto 0) => rxdata(7 downto 0),
      rxdisperr(0) => rxdisperr,
      rxnotintable(0) => rxnotintable,
      rxphy_correction_timer(63 downto 0) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_rxphy_correction_timer_UNCONNECTED\(63 downto 0),
      rxphy_ns_field(31 downto 0) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_rxphy_ns_field_UNCONNECTED\(31 downto 0),
      rxphy_s_field(47 downto 0) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_rxphy_s_field_UNCONNECTED\(47 downto 0),
      rxrecclk => '0',
      rxrundisp(0) => rxrundisp,
      s_axi_aclk => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arready => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_arready_UNCONNECTED\,
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awready => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_awready_UNCONNECTED\,
      s_axi_awvalid => '0',
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_bresp_UNCONNECTED\(1 downto 0),
      s_axi_bvalid => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_bvalid_UNCONNECTED\,
      s_axi_rdata(31 downto 0) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_rdata_UNCONNECTED\(31 downto 0),
      s_axi_resetn => '0',
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_rresp_UNCONNECTED\(1 downto 0),
      s_axi_rvalid => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_rvalid_UNCONNECTED\,
      s_axi_wdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_wready => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_s_axi_wready_UNCONNECTED\,
      s_axi_wvalid => '0',
      signal_detect => signal_detect_0,
      speed_is_100 => '0',
      speed_is_10_100 => '0',
      speed_selection(1 downto 0) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_speed_selection_UNCONNECTED\(1 downto 0),
      status_vector(15 downto 14) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_status_vector_UNCONNECTED\(15 downto 14),
      status_vector(13 downto 9) => status_vector_0(12 downto 8),
      status_vector(8) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_status_vector_UNCONNECTED\(8),
      status_vector(7 downto 0) => status_vector_0(7 downto 0),
      systemtimer_ns_field(31 downto 0) => B"00000000000000000000000000000000",
      systemtimer_s_field(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      tx_code_group(9 downto 0) => \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].gig_ethernet_pcs_pma_0_core_tx_code_group_UNCONNECTED\(9 downto 0),
      txbuferr => '0',
      txchardispmode => txchardispmode,
      txchardispval => txchardispval,
      txcharisk => txcharisk,
      txdata(7 downto 0) => txdata(7 downto 0),
      userclk => '0',
      userclk2 => Tx_WrClk
    );
\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_lvds_transceiver
     port map (
      ActCnt_GE_HalfBT => \serdes_1_to_10_i/ActCnt_GE_HalfBT\,
      ActiveIsSlve => \serdes_1_to_10_i/ActiveIsSlve\,
      ActiveIsSlve_reg => ActiveIsSlve_i_1_n_0,
      Aligned => \serdes_1_to_10_i/Aligned\,
      Aligned_reg => Aligned_i_1_n_0,
      BaseX_Idly_Load(1) => sload,
      BaseX_Idly_Load(0) => mload,
      BaseX_Rx_Fifo_Rd_En(0) => fifo_read_0,
      BaseX_Rx_Q_Out(7 downto 4) => serdess_data(3 downto 0),
      BaseX_Rx_Q_Out(3 downto 0) => serdesm_data(3 downto 0),
      CLK => CLK,
      D(0) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_24\,
      D0 => \serdes_1_to_10_i/D0\,
      IntRdEna_reg(0) => \gb_out_inst/p_0_in\(0),
      IntRdEna_reg_0 => IntRdEna_i_1_n_0,
      \IntRx_BtVal_reg[8]\(5 downto 0) => D(5 downto 0),
      LossOfSignal => \serdes_1_to_10_i/LossOfSignal\,
      LossOfSignal_reg => LossOfSignal_i_1_n_0,
      \Mstr_CntValIn_Out_reg[8]\(8) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_36\,
      \Mstr_CntValIn_Out_reg[8]\(7) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_37\,
      \Mstr_CntValIn_Out_reg[8]\(6) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_38\,
      \Mstr_CntValIn_Out_reg[8]\(5) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_39\,
      \Mstr_CntValIn_Out_reg[8]\(4) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_40\,
      \Mstr_CntValIn_Out_reg[8]\(3) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_41\,
      \Mstr_CntValIn_Out_reg[8]\(2) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_42\,
      \Mstr_CntValIn_Out_reg[8]\(1) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_43\,
      \Mstr_CntValIn_Out_reg[8]\(0) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_44\,
      Mstr_Load_reg(0) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_25\,
      Mstr_Load_reg_0 => Mstr_Load_i_1_n_0,
      Q(3 downto 0) => \gb_out_inst/IntWrAddr_reg\(3 downto 0),
      Rx_SysClk => Rx_SysClk,
      Rx_Valid_Int_reg => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_33\,
      \Slve_CntValIn_Out_reg[0]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_66\,
      \Slve_CntValIn_Out_reg[1]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_63\,
      \Slve_CntValIn_Out_reg[8]\(6) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_51\,
      \Slve_CntValIn_Out_reg[8]\(5) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_52\,
      \Slve_CntValIn_Out_reg[8]\(4) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_53\,
      \Slve_CntValIn_Out_reg[8]\(3) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_54\,
      \Slve_CntValIn_Out_reg[8]\(2) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_55\,
      \Slve_CntValIn_Out_reg[8]\(1) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_56\,
      \Slve_CntValIn_Out_reg[8]\(0) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_57\,
      Slve_Load_reg => Slve_Load_i_1_n_0,
      Tx_WrClk => Tx_WrClk,
      WrapToZero => \serdes_1_to_10_i/WrapToZero\,
      WrapToZero_reg => WrapToZero_i_1_n_0,
      \act_count_reg[0]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_98\,
      \act_count_reg[3]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_100\,
      \act_count_reg[4]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_99\,
      \act_count_reg[5]\(0) => \serdes_1_to_10_i/act_count_reg\(5),
      \active_reg[1]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_97\,
      al_rx_valid_out => al_rx_valid_out,
      \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_3\,
      \d21p5_wr_pipe_reg[3]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate__0_n_0\,
      \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_1\,
      \d2p2_wr_pipe_reg[3]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate_n_0\,
      data_out => \rx_elastic_buffer_inst/initialize_ram_complete_sync\,
      \initialize_counter_reg[5]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_102\,
      initialize_ram_complete => \rx_elastic_buffer_inst/initialize_ram_complete\,
      initialize_ram_complete_pulse => \rx_elastic_buffer_inst/initialize_ram_complete_pulse\,
      initialize_ram_complete_reg => initialize_ram_complete_i_1_n_0,
      initialize_ram_complete_sync_reg1 => \rx_elastic_buffer_inst/initialize_ram_complete_sync_reg1\,
      initialize_ram_complete_sync_ris_edg0 => \rx_elastic_buffer_inst/initialize_ram_complete_sync_ris_edg0\,
      insert3_reg => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_29\,
      insert3_reg_0 => insert3_i_1_n_0,
      insert5_reg => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_28\,
      insert5_reg_0 => insert5_i_1_n_0,
      \insert_idle_reg__0\ => \rx_elastic_buffer_inst/insert_idle_reg__0\,
      mgt_rx_reset => mgt_rx_reset,
      monitor_late_reg => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_27\,
      monitor_late_reg_0 => monitor_late_i_1_n_0,
      \pd_count_reg[4]\(4 downto 0) => \serdes_1_to_10_i/pd_count\(4 downto 0),
      pd_ovflw_down_reg => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_30\,
      pd_ovflw_down_reg_0 => pd_ovflw_down_i_1_n_0,
      pd_ovflw_up_reg => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_31\,
      pd_ovflw_up_reg_0 => pd_ovflw_up_i_1_n_0,
      \rd_data_reg_reg[13]\(0) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_72\,
      \rd_occupancy_reg[0]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_105\,
      \rd_occupancy_reg[3]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_104\,
      \rd_occupancy_reg[6]\(2 downto 0) => \rx_elastic_buffer_inst/rd_occupancy\(6 downto 4),
      remove_idle => \rx_elastic_buffer_inst/remove_idle\,
      \remove_idle_reg__0\ => \rx_elastic_buffer_inst/remove_idle_reg__0\,
      reset_out => reset_out,
      rxbuferr_reg => rxbuferr_i_1_n_0,
      rxbufstatus(0) => rxbuferr,
      rxchariscomma_usr_reg => rxchariscomma,
      rxcharisk_usr_reg => rxcharisk,
      rxclkcorcnt(1) => rxclkcorcnt(2),
      rxclkcorcnt(0) => rxclkcorcnt(0),
      \rxclkcorcnt_reg[0]\ => \rxclkcorcnt[0]_i_1_n_0\,
      \rxdata_usr_reg[7]\(7 downto 0) => rxdata(7 downto 0),
      \rxdh_reg[16]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_65\,
      \rxdh_reg[18]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_101\,
      \rxdh_reg[7]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_64\,
      rxdisperr(0) => rxdisperr,
      rxnotintable(0) => rxnotintable,
      rxrecreset0 => rxrecreset0,
      rxrundisp(0) => rxrundisp,
      \s_state_reg[0]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_91\,
      \s_state_reg[0]_0\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_96\,
      \s_state_reg[2]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_94\,
      \s_state_reg[3]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_103\,
      \s_state_reg[4]\(4) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_45\,
      \s_state_reg[4]\(3) => \serdes_1_to_10_i/p_0_in\,
      \s_state_reg[4]\(2) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_47\,
      \s_state_reg[4]\(1) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_48\,
      \s_state_reg[4]\(0) => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_49\,
      \s_state_reg[4]_0\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_93\,
      \s_state_reg[4]_1\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_95\,
      \s_state_reg[5]\ => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_92\,
      \tx_data_8b_reg[7]_0\(7 downto 0) => tx_data_8b(7 downto 0),
      txchardispmode => txchardispmode,
      txchardispval => txchardispval,
      txcharisk => txcharisk,
      txdata(7 downto 0) => txdata(7 downto 0),
      \wr_addr_plus2_reg[6]\ => \wr_addr[6]_i_2_n_0\
    );
\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].sgmii_logic\: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sgmii_adapt
     port map (
      Tx_WrClk => Tx_WrClk,
      gmii_rx_dv => gmii_rx_dv_int,
      gmii_rx_dv_0 => gmii_rx_dv_0,
      gmii_rx_er_0 => gmii_rx_er_0,
      gmii_rx_er_in => gmii_rx_er_int,
      gmii_rxd(7 downto 0) => gmii_rxd_int(7 downto 0),
      gmii_rxd_0(7 downto 0) => gmii_rxd_0(7 downto 0),
      gmii_tx_en_0 => gmii_tx_en_0,
      gmii_tx_en_out => gmii_tx_en_int,
      gmii_tx_er_0 => gmii_tx_er_0,
      gmii_tx_er_out => gmii_tx_er_int,
      gmii_txd_0(7 downto 0) => gmii_txd_0(7 downto 0),
      gmii_txd_out(7 downto 0) => gmii_txd_int(7 downto 0),
      mgt_tx_reset => mgt_tx_reset_0,
      sgmii_clk_en => sgmii_clk_en_0,
      sgmii_clk_f_0 => sgmii_clk_f_0,
      sgmii_clk_r_0 => sgmii_clk_r_0,
      speed_is_100_0 => speed_is_100_0,
      speed_is_10_100_0 => speed_is_10_100_0
    );
\gen_lvds_transceiver.gen_lvds_transceiver_logic_gate\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_1\,
      I1 => \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_n_0\,
      O => \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate_n_0\
    );
\gen_lvds_transceiver.gen_lvds_transceiver_logic_gate__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_3\,
      I1 => \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_n_0\,
      O => \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate__0_n_0\
    );
\gen_lvds_transceiver.gen_lvds_transceiver_logic_r\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => al_rx_valid_out,
      D => '1',
      Q => \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_n_0\,
      R => rxrecreset0
    );
\gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => al_rx_valid_out,
      D => \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_n_0\,
      Q => \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0\,
      R => rxrecreset0
    );
\gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1\: unisim.vcomponents.FDRE
     port map (
      C => Rx_SysClk,
      CE => al_rx_valid_out,
      D => \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0\,
      Q => \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_n_0\,
      R => rxrecreset0
    );
initialize_ram_complete_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_102\,
      I1 => \rx_elastic_buffer_inst/initialize_ram_complete\,
      O => initialize_ram_complete_i_1_n_0
    );
initialize_ram_complete_sync_ris_edg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rx_elastic_buffer_inst/initialize_ram_complete_sync\,
      I1 => \rx_elastic_buffer_inst/initialize_ram_complete_sync_reg1\,
      O => \rx_elastic_buffer_inst/initialize_ram_complete_sync_ris_edg0\
    );
insert3_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF5F50020A0A0"
    )
        port map (
      I0 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_103\,
      I1 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_45\,
      I2 => \serdes_1_to_10_i/p_0_in\,
      I3 => \serdes_1_to_10_i/WrapToZero\,
      I4 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_47\,
      I5 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_29\,
      O => insert3_i_1_n_0
    );
insert5_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFD5D500808080"
    )
        port map (
      I0 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_103\,
      I1 => \serdes_1_to_10_i/p_0_in\,
      I2 => \serdes_1_to_10_i/WrapToZero\,
      I3 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_45\,
      I4 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_47\,
      I5 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_28\,
      O => insert5_i_1_n_0
    );
monitor_late_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8BFF8B00"
    )
        port map (
      I0 => \serdes_1_to_10_i/WrapToZero\,
      I1 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_45\,
      I2 => \serdes_1_to_10_i/ActCnt_GE_HalfBT\,
      I3 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_91\,
      I4 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_27\,
      O => monitor_late_i_1_n_0
    );
pd_ovflw_down_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF11111113"
    )
        port map (
      I0 => \serdes_1_to_10_i/pd_count\(3),
      I1 => \serdes_1_to_10_i/pd_count\(4),
      I2 => \serdes_1_to_10_i/pd_count\(2),
      I3 => \serdes_1_to_10_i/pd_count\(1),
      I4 => \serdes_1_to_10_i/pd_count\(0),
      I5 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_30\,
      O => pd_ovflw_down_i_1_n_0
    );
pd_ovflw_up_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \serdes_1_to_10_i/pd_count\(4),
      I1 => \serdes_1_to_10_i/pd_count\(3),
      I2 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_31\,
      O => pd_ovflw_up_i_1_n_0
    );
rxbuferr_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAAAAAB"
    )
        port map (
      I0 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_104\,
      I1 => \rx_elastic_buffer_inst/rd_occupancy\(6),
      I2 => \rx_elastic_buffer_inst/rd_occupancy\(5),
      I3 => \rx_elastic_buffer_inst/rd_occupancy\(4),
      I4 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_105\,
      I5 => rxbuferr,
      O => rxbuferr_i_1_n_0
    );
\rxclkcorcnt[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F4C"
    )
        port map (
      I0 => rxclkcorcnt(2),
      I1 => \rx_elastic_buffer_inst/insert_idle_reg__0\,
      I2 => rxclkcorcnt(0),
      I3 => \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_72\,
      O => \rxclkcorcnt[0]_i_1_n_0\
    );
\wr_addr[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF5575"
    )
        port map (
      I0 => \rx_elastic_buffer_inst/initialize_ram_complete\,
      I1 => \rx_elastic_buffer_inst/remove_idle\,
      I2 => al_rx_valid_out,
      I3 => \rx_elastic_buffer_inst/remove_idle_reg__0\,
      I4 => \rx_elastic_buffer_inst/initialize_ram_complete_pulse\,
      O => \wr_addr[6]_i_2_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_support is
  port (
    dummy_port_in : in STD_LOGIC;
    txp_0 : out STD_LOGIC;
    txn_0 : out STD_LOGIC;
    rxp_0 : in STD_LOGIC;
    rxn_0 : in STD_LOGIC;
    signal_detect_0 : in STD_LOGIC;
    gmii_txd_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en_0 : in STD_LOGIC;
    gmii_tx_er_0 : in STD_LOGIC;
    gmii_rxd_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv_0 : out STD_LOGIC;
    gmii_rx_er_0 : out STD_LOGIC;
    gmii_isolate_0 : out STD_LOGIC;
    sgmii_clk_r_0 : out STD_LOGIC;
    sgmii_clk_f_0 : out STD_LOGIC;
    sgmii_clk_en_0 : out STD_LOGIC;
    speed_is_10_100_0 : in STD_LOGIC;
    speed_is_100_0 : in STD_LOGIC;
    an_interrupt_0 : out STD_LOGIC;
    an_adv_config_vector_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    an_restart_config_0 : in STD_LOGIC;
    status_vector_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    configuration_vector_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    refclk625_p : in STD_LOGIC;
    refclk625_n : in STD_LOGIC;
    clk125_out : out STD_LOGIC;
    clk312_out : out STD_LOGIC;
    rst_125_out : out STD_LOGIC;
    tx_logic_reset : out STD_LOGIC;
    rx_logic_reset : out STD_LOGIC;
    rx_locked : out STD_LOGIC;
    tx_locked : out STD_LOGIC;
    tx_bsc_rst_out : out STD_LOGIC;
    rx_bsc_rst_out : out STD_LOGIC;
    tx_bs_rst_out : out STD_LOGIC;
    rx_bs_rst_out : out STD_LOGIC;
    tx_rst_dly_out : out STD_LOGIC;
    rx_rst_dly_out : out STD_LOGIC;
    tx_bsc_en_vtc_out : out STD_LOGIC;
    rx_bsc_en_vtc_out : out STD_LOGIC;
    tx_bs_en_vtc_out : out STD_LOGIC;
    rx_bs_en_vtc_out : out STD_LOGIC;
    riu_clk_out : out STD_LOGIC;
    riu_addr_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    riu_wr_data_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_wr_en_out : out STD_LOGIC;
    riu_nibble_sel_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tx_pll_clk_out : out STD_LOGIC;
    rx_pll_clk_out : out STD_LOGIC;
    tx_rdclk_out : out STD_LOGIC;
    riu_rddata_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_3 : in STD_LOGIC;
    riu_prsnt_3 : in STD_LOGIC;
    riu_rddata_2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_2 : in STD_LOGIC;
    riu_prsnt_2 : in STD_LOGIC;
    riu_rddata_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_1 : in STD_LOGIC;
    riu_prsnt_1 : in STD_LOGIC;
    rx_btval_3 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rx_btval_2 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rx_btval_1 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    tx_dly_rdy_1 : in STD_LOGIC;
    rx_dly_rdy_1 : in STD_LOGIC;
    rx_vtc_rdy_1 : in STD_LOGIC;
    tx_vtc_rdy_1 : in STD_LOGIC;
    tx_dly_rdy_2 : in STD_LOGIC;
    rx_dly_rdy_2 : in STD_LOGIC;
    rx_vtc_rdy_2 : in STD_LOGIC;
    tx_vtc_rdy_2 : in STD_LOGIC;
    tx_dly_rdy_3 : in STD_LOGIC;
    rx_dly_rdy_3 : in STD_LOGIC;
    rx_vtc_rdy_3 : in STD_LOGIC;
    tx_vtc_rdy_3 : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_support : entity is "yes";
  attribute EXAMPLE_SIMULATION : integer;
  attribute EXAMPLE_SIMULATION of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_support : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_support : entity is "gig_ethernet_pcs_pma_0_support";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_support;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_support is
  signal \<const0>\ : STD_LOGIC;
  signal \^clk125_out\ : STD_LOGIC;
  signal \^clk312_out\ : STD_LOGIC;
  signal \^riu_addr_out\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^riu_clk_out\ : STD_LOGIC;
  signal \^riu_nibble_sel_out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal riu_prsnt : STD_LOGIC;
  signal riu_rd_data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal riu_valid : STD_LOGIC;
  signal \^riu_wr_data_out\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^riu_wr_en_out\ : STD_LOGIC;
  signal \^rst_125_out\ : STD_LOGIC;
  signal \^rx_bs_en_vtc_out\ : STD_LOGIC;
  signal \^rx_bs_rst_out\ : STD_LOGIC;
  signal \^rx_bsc_en_vtc_out\ : STD_LOGIC;
  signal \^rx_bsc_rst_out\ : STD_LOGIC;
  signal rx_btval : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal rx_dly_rdy : STD_LOGIC;
  signal \^rx_logic_reset\ : STD_LOGIC;
  signal \^rx_pll_clk_out\ : STD_LOGIC;
  signal \^rx_rst_dly_out\ : STD_LOGIC;
  signal rx_vtc_rdy : STD_LOGIC;
  signal \^status_vector_0\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \^tx_bs_en_vtc_out\ : STD_LOGIC;
  signal \^tx_bs_rst_out\ : STD_LOGIC;
  signal \^tx_bsc_en_vtc_out\ : STD_LOGIC;
  signal \^tx_bsc_rst_out\ : STD_LOGIC;
  signal tx_dly_rdy : STD_LOGIC;
  signal \^tx_logic_reset\ : STD_LOGIC;
  signal \^tx_pll_clk_out\ : STD_LOGIC;
  signal \^tx_rdclk_out\ : STD_LOGIC;
  signal \^tx_rst_dly_out\ : STD_LOGIC;
  signal tx_vtc_rdy : STD_LOGIC;
  signal NLW_clock_reset_i_ClockIn_se_out_UNCONNECTED : STD_LOGIC;
  signal NLW_clock_reset_i_Debug_Out_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute C_IoBank : integer;
  attribute C_IoBank of clock_reset_i : label is 44;
  attribute C_Part : string;
  attribute C_Part of clock_reset_i : label is "XCKU060";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of clock_reset_i : label is std.standard.true;
  attribute EXAMPLE_SIMULATION of clock_reset_i : label is 0;
begin
  clk125_out <= \^clk125_out\;
  clk312_out <= \^clk312_out\;
  riu_addr_out(5 downto 0) <= \^riu_addr_out\(5 downto 0);
  riu_clk_out <= \^riu_clk_out\;
  riu_nibble_sel_out(1 downto 0) <= \^riu_nibble_sel_out\(1 downto 0);
  riu_wr_data_out(15 downto 0) <= \^riu_wr_data_out\(15 downto 0);
  riu_wr_en_out <= \^riu_wr_en_out\;
  rst_125_out <= \^rst_125_out\;
  rx_bs_en_vtc_out <= \^rx_bs_en_vtc_out\;
  rx_bs_rst_out <= \^rx_bs_rst_out\;
  rx_bsc_en_vtc_out <= \^rx_bsc_en_vtc_out\;
  rx_bsc_rst_out <= \^rx_bsc_rst_out\;
  rx_logic_reset <= \^rx_logic_reset\;
  rx_pll_clk_out <= \^rx_pll_clk_out\;
  rx_rst_dly_out <= \^rx_rst_dly_out\;
  status_vector_0(15) <= \<const0>\;
  status_vector_0(14) <= \<const0>\;
  status_vector_0(13 downto 9) <= \^status_vector_0\(13 downto 9);
  status_vector_0(8) <= \<const0>\;
  status_vector_0(7 downto 0) <= \^status_vector_0\(7 downto 0);
  tx_bs_en_vtc_out <= \^tx_bs_en_vtc_out\;
  tx_bs_rst_out <= \^tx_bs_rst_out\;
  tx_bsc_en_vtc_out <= \^tx_bsc_en_vtc_out\;
  tx_bsc_rst_out <= \^tx_bsc_rst_out\;
  tx_logic_reset <= \^tx_logic_reset\;
  tx_pll_clk_out <= \^tx_pll_clk_out\;
  tx_rdclk_out <= \^tx_rdclk_out\;
  tx_rst_dly_out <= \^tx_rst_dly_out\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
clock_reset_i: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_Clock_Reset
     port map (
      ClockIn_n => refclk625_n,
      ClockIn_p => refclk625_p,
      ClockIn_se_out => NLW_clock_reset_i_ClockIn_se_out_UNCONNECTED,
      Debug_Out(7 downto 0) => NLW_clock_reset_i_Debug_Out_UNCONNECTED(7 downto 0),
      ResetIn => reset,
      Riu_Addr(5 downto 0) => \^riu_addr_out\(5 downto 0),
      Riu_Nibble_Sel(1 downto 0) => \^riu_nibble_sel_out\(1 downto 0),
      Riu_Prsnt_0 => riu_prsnt,
      Riu_Prsnt_1 => riu_prsnt_1,
      Riu_Prsnt_2 => riu_prsnt_2,
      Riu_Prsnt_3 => riu_prsnt_3,
      Riu_RdData_0(15 downto 0) => riu_rd_data(15 downto 0),
      Riu_RdData_1(15 downto 0) => riu_rddata_1(15 downto 0),
      Riu_RdData_2(15 downto 0) => riu_rddata_2(15 downto 0),
      Riu_RdData_3(15 downto 0) => riu_rddata_3(15 downto 0),
      Riu_Valid_0 => riu_valid,
      Riu_Valid_1 => riu_valid_1,
      Riu_Valid_2 => riu_valid_2,
      Riu_Valid_3 => riu_valid_3,
      Riu_WrData(15 downto 0) => \^riu_wr_data_out\(15 downto 0),
      Riu_Wr_En => \^riu_wr_en_out\,
      Rx_Bs_EnVtc => \^rx_bs_en_vtc_out\,
      Rx_Bs_Rst => \^rx_bs_rst_out\,
      Rx_Bs_RstDly => \^rx_rst_dly_out\,
      Rx_Bsc_EnVtc => \^rx_bsc_en_vtc_out\,
      Rx_Bsc_Rst => \^rx_bsc_rst_out\,
      Rx_BtVal_0(8 downto 0) => rx_btval(8 downto 0),
      Rx_BtVal_1(8 downto 0) => rx_btval_1(8 downto 0),
      Rx_BtVal_2(8 downto 0) => rx_btval_2(8 downto 0),
      Rx_BtVal_3(8 downto 0) => rx_btval_3(8 downto 0),
      Rx_ClkOutPhy => \^rx_pll_clk_out\,
      Rx_Dly_Rdy => rx_dly_rdy,
      Rx_Locked => rx_locked,
      Rx_LogicRst => \^rx_logic_reset\,
      Rx_RiuClk => \^riu_clk_out\,
      Rx_SysClk => \^clk312_out\,
      Rx_Vtc_Rdy => rx_vtc_rdy,
      Tx_Bs_EnVtc => \^tx_bs_en_vtc_out\,
      Tx_Bs_Rst => \^tx_bs_rst_out\,
      Tx_Bs_RstDly => \^tx_rst_dly_out\,
      Tx_Bsc_EnVtc => \^tx_bsc_en_vtc_out\,
      Tx_Bsc_Rst => \^tx_bsc_rst_out\,
      Tx_ClkOutPhy => \^tx_pll_clk_out\,
      Tx_Dly_Rdy => tx_dly_rdy,
      Tx_Locked => tx_locked,
      Tx_LogicRst => \^tx_logic_reset\,
      Tx_SysClk => \^tx_rdclk_out\,
      Tx_Vtc_Rdy => tx_vtc_rdy,
      Tx_WrClk => \^clk125_out\
    );
pcs_pma_block_i: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block
     port map (
      CLK => \^tx_rdclk_out\,
      D(5 downto 0) => rx_btval(8 downto 3),
      Rx_Dly_Rdy => rx_dly_rdy,
      Rx_SysClk => \^clk312_out\,
      Rx_Vtc_Rdy => rx_vtc_rdy,
      Tx_Dly_Rdy => tx_dly_rdy,
      Tx_Vtc_Rdy => tx_vtc_rdy,
      Tx_WrClk => \^clk125_out\,
      an_adv_config_vector_0(0) => an_adv_config_vector_0(11),
      an_interrupt_0 => an_interrupt_0,
      an_restart_config_0 => an_restart_config_0,
      configuration_vector_0(4 downto 0) => configuration_vector_0(4 downto 0),
      dummy_port_in => dummy_port_in,
      gmii_isolate_0 => gmii_isolate_0,
      gmii_rx_dv_0 => gmii_rx_dv_0,
      gmii_rx_er_0 => gmii_rx_er_0,
      gmii_rxd_0(7 downto 0) => gmii_rxd_0(7 downto 0),
      gmii_tx_en_0 => gmii_tx_en_0,
      gmii_tx_er_0 => gmii_tx_er_0,
      gmii_txd_0(7 downto 0) => gmii_txd_0(7 downto 0),
      reset_out => \^rst_125_out\,
      riu_addr_out(5 downto 0) => \^riu_addr_out\(5 downto 0),
      riu_clk_out => \^riu_clk_out\,
      riu_nibble_sel_out(1 downto 0) => \^riu_nibble_sel_out\(1 downto 0),
      riu_prsnt => riu_prsnt,
      riu_rd_data(15 downto 0) => riu_rd_data(15 downto 0),
      riu_valid => riu_valid,
      riu_wr_data_out(15 downto 0) => \^riu_wr_data_out\(15 downto 0),
      riu_wr_en_out => \^riu_wr_en_out\,
      rx_bs_en_vtc_out => \^rx_bs_en_vtc_out\,
      rx_bs_rst_out => \^rx_bs_rst_out\,
      rx_bsc_en_vtc_out => \^rx_bsc_en_vtc_out\,
      rx_bsc_rst_out => \^rx_bsc_rst_out\,
      rx_dly_rdy_1 => rx_dly_rdy_1,
      rx_dly_rdy_2 => rx_dly_rdy_2,
      rx_dly_rdy_3 => rx_dly_rdy_3,
      rx_pll_clk_out => \^rx_pll_clk_out\,
      rx_rst_dly_out => \^rx_rst_dly_out\,
      rx_vtc_rdy_1 => rx_vtc_rdy_1,
      rx_vtc_rdy_2 => rx_vtc_rdy_2,
      rx_vtc_rdy_3 => rx_vtc_rdy_3,
      rxn_0 => rxn_0,
      rxp_0 => rxp_0,
      sgmii_clk_en_0 => sgmii_clk_en_0,
      sgmii_clk_f_0 => sgmii_clk_f_0,
      sgmii_clk_r_0 => sgmii_clk_r_0,
      signal_detect_0 => signal_detect_0,
      speed_is_100_0 => speed_is_100_0,
      speed_is_10_100_0 => speed_is_10_100_0,
      status_vector_0(12 downto 8) => \^status_vector_0\(13 downto 9),
      status_vector_0(7 downto 0) => \^status_vector_0\(7 downto 0),
      tx_bs_en_vtc_out => \^tx_bs_en_vtc_out\,
      tx_bs_rst_out => \^tx_bs_rst_out\,
      tx_bsc_en_vtc_out => \^tx_bsc_en_vtc_out\,
      tx_bsc_rst_out => \^tx_bsc_rst_out\,
      tx_dly_rdy_1 => tx_dly_rdy_1,
      tx_dly_rdy_2 => tx_dly_rdy_2,
      tx_dly_rdy_3 => tx_dly_rdy_3,
      tx_pll_clk_out => \^tx_pll_clk_out\,
      tx_rst_dly_out => \^tx_rst_dly_out\,
      tx_vtc_rdy_1 => tx_vtc_rdy_1,
      tx_vtc_rdy_2 => tx_vtc_rdy_2,
      tx_vtc_rdy_3 => tx_vtc_rdy_3,
      txn_0 => txn_0,
      txp_0 => txp_0
    );
reset_sync_clk125_i: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync
     port map (
      Tx_WrClk => \^clk125_out\,
      rst_125_out => \^rst_125_out\,
      rx_logic_reset => \^rx_logic_reset\,
      tx_logic_reset => \^tx_logic_reset\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0 is
  port (
    dummy_port_in : in STD_LOGIC;
    txp_0 : out STD_LOGIC;
    txn_0 : out STD_LOGIC;
    rxp_0 : in STD_LOGIC;
    rxn_0 : in STD_LOGIC;
    signal_detect_0 : in STD_LOGIC;
    gmii_txd_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en_0 : in STD_LOGIC;
    gmii_tx_er_0 : in STD_LOGIC;
    gmii_rxd_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv_0 : out STD_LOGIC;
    gmii_rx_er_0 : out STD_LOGIC;
    gmii_isolate_0 : out STD_LOGIC;
    sgmii_clk_r_0 : out STD_LOGIC;
    sgmii_clk_f_0 : out STD_LOGIC;
    sgmii_clk_en_0 : out STD_LOGIC;
    speed_is_10_100_0 : in STD_LOGIC;
    speed_is_100_0 : in STD_LOGIC;
    an_interrupt_0 : out STD_LOGIC;
    an_adv_config_vector_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    an_restart_config_0 : in STD_LOGIC;
    status_vector_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    configuration_vector_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    refclk625_p : in STD_LOGIC;
    refclk625_n : in STD_LOGIC;
    clk125_out : out STD_LOGIC;
    clk312_out : out STD_LOGIC;
    rst_125_out : out STD_LOGIC;
    tx_logic_reset : out STD_LOGIC;
    rx_logic_reset : out STD_LOGIC;
    rx_locked : out STD_LOGIC;
    tx_locked : out STD_LOGIC;
    tx_bsc_rst_out : out STD_LOGIC;
    rx_bsc_rst_out : out STD_LOGIC;
    tx_bs_rst_out : out STD_LOGIC;
    rx_bs_rst_out : out STD_LOGIC;
    tx_rst_dly_out : out STD_LOGIC;
    rx_rst_dly_out : out STD_LOGIC;
    tx_bsc_en_vtc_out : out STD_LOGIC;
    rx_bsc_en_vtc_out : out STD_LOGIC;
    tx_bs_en_vtc_out : out STD_LOGIC;
    rx_bs_en_vtc_out : out STD_LOGIC;
    riu_clk_out : out STD_LOGIC;
    riu_addr_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    riu_wr_data_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_wr_en_out : out STD_LOGIC;
    riu_nibble_sel_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    riu_rddata_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_3 : in STD_LOGIC;
    riu_prsnt_3 : in STD_LOGIC;
    riu_rddata_2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_2 : in STD_LOGIC;
    riu_prsnt_2 : in STD_LOGIC;
    riu_rddata_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_1 : in STD_LOGIC;
    riu_prsnt_1 : in STD_LOGIC;
    rx_btval_3 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rx_btval_2 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rx_btval_1 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    tx_dly_rdy_1 : in STD_LOGIC;
    rx_dly_rdy_1 : in STD_LOGIC;
    rx_vtc_rdy_1 : in STD_LOGIC;
    tx_vtc_rdy_1 : in STD_LOGIC;
    tx_dly_rdy_2 : in STD_LOGIC;
    rx_dly_rdy_2 : in STD_LOGIC;
    rx_vtc_rdy_2 : in STD_LOGIC;
    tx_vtc_rdy_2 : in STD_LOGIC;
    tx_dly_rdy_3 : in STD_LOGIC;
    rx_dly_rdy_3 : in STD_LOGIC;
    rx_vtc_rdy_3 : in STD_LOGIC;
    tx_vtc_rdy_3 : in STD_LOGIC;
    tx_pll_clk_out : out STD_LOGIC;
    rx_pll_clk_out : out STD_LOGIC;
    tx_rdclk_out : out STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of gig_ethernet_pcs_pma_0 : entity is true;
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gig_ethernet_pcs_pma_0 : entity is "yes";
  attribute EXAMPLE_SIMULATION : integer;
  attribute EXAMPLE_SIMULATION of gig_ethernet_pcs_pma_0 : entity is 0;
end gig_ethernet_pcs_pma_0;

architecture STRUCTURE of gig_ethernet_pcs_pma_0 is
  attribute EXAMPLE_SIMULATION of inst : label is 0;
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of inst : label is "gig_ethernet_pcs_pma_v16_1_6,Vivado 2019.1";
  attribute downgradeipidentifiedwarnings of inst : label is "yes";
begin
inst: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_support
     port map (
      an_adv_config_vector_0(15 downto 0) => an_adv_config_vector_0(15 downto 0),
      an_interrupt_0 => an_interrupt_0,
      an_restart_config_0 => an_restart_config_0,
      clk125_out => clk125_out,
      clk312_out => clk312_out,
      configuration_vector_0(4 downto 0) => configuration_vector_0(4 downto 0),
      dummy_port_in => dummy_port_in,
      gmii_isolate_0 => gmii_isolate_0,
      gmii_rx_dv_0 => gmii_rx_dv_0,
      gmii_rx_er_0 => gmii_rx_er_0,
      gmii_rxd_0(7 downto 0) => gmii_rxd_0(7 downto 0),
      gmii_tx_en_0 => gmii_tx_en_0,
      gmii_tx_er_0 => gmii_tx_er_0,
      gmii_txd_0(7 downto 0) => gmii_txd_0(7 downto 0),
      refclk625_n => refclk625_n,
      refclk625_p => refclk625_p,
      reset => reset,
      riu_addr_out(5 downto 0) => riu_addr_out(5 downto 0),
      riu_clk_out => riu_clk_out,
      riu_nibble_sel_out(1 downto 0) => riu_nibble_sel_out(1 downto 0),
      riu_prsnt_1 => riu_prsnt_1,
      riu_prsnt_2 => riu_prsnt_2,
      riu_prsnt_3 => riu_prsnt_3,
      riu_rddata_1(15 downto 0) => riu_rddata_1(15 downto 0),
      riu_rddata_2(15 downto 0) => riu_rddata_2(15 downto 0),
      riu_rddata_3(15 downto 0) => riu_rddata_3(15 downto 0),
      riu_valid_1 => riu_valid_1,
      riu_valid_2 => riu_valid_2,
      riu_valid_3 => riu_valid_3,
      riu_wr_data_out(15 downto 0) => riu_wr_data_out(15 downto 0),
      riu_wr_en_out => riu_wr_en_out,
      rst_125_out => rst_125_out,
      rx_bs_en_vtc_out => rx_bs_en_vtc_out,
      rx_bs_rst_out => rx_bs_rst_out,
      rx_bsc_en_vtc_out => rx_bsc_en_vtc_out,
      rx_bsc_rst_out => rx_bsc_rst_out,
      rx_btval_1(8 downto 0) => rx_btval_1(8 downto 0),
      rx_btval_2(8 downto 0) => rx_btval_2(8 downto 0),
      rx_btval_3(8 downto 0) => rx_btval_3(8 downto 0),
      rx_dly_rdy_1 => rx_dly_rdy_1,
      rx_dly_rdy_2 => rx_dly_rdy_2,
      rx_dly_rdy_3 => rx_dly_rdy_3,
      rx_locked => rx_locked,
      rx_logic_reset => rx_logic_reset,
      rx_pll_clk_out => rx_pll_clk_out,
      rx_rst_dly_out => rx_rst_dly_out,
      rx_vtc_rdy_1 => rx_vtc_rdy_1,
      rx_vtc_rdy_2 => rx_vtc_rdy_2,
      rx_vtc_rdy_3 => rx_vtc_rdy_3,
      rxn_0 => rxn_0,
      rxp_0 => rxp_0,
      sgmii_clk_en_0 => sgmii_clk_en_0,
      sgmii_clk_f_0 => sgmii_clk_f_0,
      sgmii_clk_r_0 => sgmii_clk_r_0,
      signal_detect_0 => signal_detect_0,
      speed_is_100_0 => speed_is_100_0,
      speed_is_10_100_0 => speed_is_10_100_0,
      status_vector_0(15 downto 0) => status_vector_0(15 downto 0),
      tx_bs_en_vtc_out => tx_bs_en_vtc_out,
      tx_bs_rst_out => tx_bs_rst_out,
      tx_bsc_en_vtc_out => tx_bsc_en_vtc_out,
      tx_bsc_rst_out => tx_bsc_rst_out,
      tx_dly_rdy_1 => tx_dly_rdy_1,
      tx_dly_rdy_2 => tx_dly_rdy_2,
      tx_dly_rdy_3 => tx_dly_rdy_3,
      tx_locked => tx_locked,
      tx_logic_reset => tx_logic_reset,
      tx_pll_clk_out => tx_pll_clk_out,
      tx_rdclk_out => tx_rdclk_out,
      tx_rst_dly_out => tx_rst_dly_out,
      tx_vtc_rdy_1 => tx_vtc_rdy_1,
      tx_vtc_rdy_2 => tx_vtc_rdy_2,
      tx_vtc_rdy_3 => tx_vtc_rdy_3,
      txn_0 => txn_0,
      txp_0 => txp_0
    );
end STRUCTURE;
