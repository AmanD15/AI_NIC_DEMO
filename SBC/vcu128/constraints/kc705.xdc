# General configurations
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 63.8 [current_design]
set_property BITSTREAM.CONFIG.SPI_OPCODE 8'h6B [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pulldown [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
#set clk dedicated
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clk_wiz_0_inst/inst/clk_in1_clk_wiz_0]
# CLK_100
set_property PACKAGE_PIN BH51 [get_ports {c0_sys_clk_p }]
set_property IOSTANDARD DIFF_SSTL12 [get_ports {c0_sys_clk_p}]
set_property PACKAGE_PIN BJ51 [get_ports {c0_sys_clk_n}]
set_property IOSTANDARD DIFF_SSTL12 [get_ports {c0_sys_clk_n}]


set_property PACKAGE_PIN BJ4 [get_ports {CLKREF_P}]
set_property IOSTANDARD DIFF_SSTL12 [get_ports {CLKREF_P}]
set_property PACKAGE_PIN BK3 [get_ports {CLKREF_N}]
set_property IOSTANDARD DIFF_SSTL12 [get_ports {CLKREF_N}]

set_property PACKAGE_PIN F35 [get_ports {clk_in_p}]
set_property IOSTANDARD DIFF_SSTL12 [get_ports {clk_in_p}]
set_property PACKAGE_PIN F36 [get_ports {clk_in_n}]
set_property IOSTANDARD DIFF_SSTL12 [get_ports {clk_in_n}]


create_clock -period 10.000 -name clk_100mhz [get_ports CLKREF_P]
create_clock -period 10.000 -name clk_in_p [get_ports clk_in_p]
create_generated_clock -name clk_125mhz [get_pins clk_mmcm_inst/CLKOUT1] 



# LEDs
set_property PACKAGE_PIN BH24     [get_ports {led[0]}] ;# Bank  67 VCCO - VCC1V8   - IO_L18N_T2U_N11_AD2N_67
set_property IOSTANDARD  LVCMOS18 [get_ports {led[0]}] ;# Bank  67 VCCO - VCC1V8   - IO_L18N_T2U_N11_AD2N_67
set_property PACKAGE_PIN BG24     [get_ports {led[1]}] ;# Bank  67 VCCO - VCC1V8   - IO_L18P_T2U_N10_AD2P_67
set_property IOSTANDARD  LVCMOS18 [get_ports {led[1]}] ;# Bank  67 VCCO - VCC1V8   - IO_L18P_T2U_N10_AD2P_67
set_property PACKAGE_PIN BG25     [get_ports {led[2]}] ;# Bank  67 VCCO - VCC1V8   - IO_L17N_T2U_N9_AD10N_67
set_property IOSTANDARD  LVCMOS18 [get_ports {led[2]}] ;# Bank  67 VCCO - VCC1V8   - IO_L17N_T2U_N9_AD10N_67
set_property PACKAGE_PIN BF25     [get_ports {led[3]}] ;# Bank  67 VCCO - VCC1V8   - IO_L17P_T2U_N8_AD10P_67
set_property IOSTANDARD  LVCMOS18 [get_ports {led[3]}] ;# Bank  67 VCCO - VCC1V8   - IO_L17P_T2U_N8_AD10P_67
set_property PACKAGE_PIN BF26     [get_ports {led[4]}] ;# Bank  67 VCCO - VCC1V8   - IO_L16N_T2U_N7_QBC_AD3N_67
set_property IOSTANDARD  LVCMOS18 [get_ports {led[4]}] ;# Bank  67 VCCO - VCC1V8   - IO_L16N_T2U_N7_QBC_AD3N_67
set_property PACKAGE_PIN BF27     [get_ports {led[5]}] ;# Bank  67 VCCO - VCC1V8   - IO_L16P_T2U_N6_QBC_AD3P_67
set_property IOSTANDARD  LVCMOS18 [get_ports {led[5]}] ;# Bank  67 VCCO - VCC1V8   - IO_L16P_T2U_N6_QBC_AD3P_67
set_property PACKAGE_PIN BG27     [get_ports {led[6]}] ;# Bank  67 VCCO - VCC1V8   - IO_L15N_T2L_N5_AD11N_67
set_property IOSTANDARD  LVCMOS18 [get_ports {led[6]}] ;# Bank  67 VCCO - VCC1V8   - IO_L15N_T2L_N5_AD11N_67
set_property PACKAGE_PIN BG28     [get_ports {led[7]}] ;# Bank  67 VCCO - VCC1V8   - IO_L15P_T2L_N4_AD11P_67
set_property IOSTANDARD  LVCMOS18 [get_ports {led[7]}] ;# Bank  67 VCCO - VCC1V8   - IO_L15P_T2L_N4_AD11P_67

set_false_path -to [get_ports {led[*]}]
set_output_delay 0 [get_ports {led[*]}]


## uart0
set_property PACKAGE_PIN BP26     [get_ports "DEBUG_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2N_T0L_N3_67
set_property IOSTANDARD  LVCMOS18 [get_ports "DEBUG_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2N_T0L_N3_67
set_property PACKAGE_PIN BN26     [get_ports "DEBUG_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2P_T0L_N2_67
set_property IOSTANDARD  LVCMOS18 [get_ports "DEBUG_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2P_T0L_N2_67

## uart1
set_property PACKAGE_PIN BK28     [get_ports "SERIAL_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9N_T1L_N5_AD12N_67
set_property IOSTANDARD  LVCMOS18 [get_ports "SERIAL_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9N_T1L_N5_AD12N_67
set_property PACKAGE_PIN BJ28     [get_ports "SERIAL_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9P_T1L_N4_AD12P_67
set_property IOSTANDARD  LVCMOS18 [get_ports "SERIAL_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9P_T1L_N4_AD12P_67



#set_false_path -to [get_ports {uart_txd uart_rts}]
#set_output_delay 0 [get_ports {uart_txd uart_rts}]
#set_false_path -from [get_ports {uart_rxd uart_cts}]
#set_input_delay 0 [get_ports {uart_rxd uart_cts}]


########################################################################################################
## 1. ETHERNET related ports.
########################################################################################################

# Gigabit Ethernet SGMII PHY
set_property PACKAGE_PIN BH22     [get_ports {phy_sgmii_tx_n}] ;# ENET_SGMII_IN_N Bank  67 VCCO - VCC1V8   - IO_L23N_T3U_N9_67
set_property IOSTANDARD  LVDS     [get_ports {phy_sgmii_tx_n}] ;# ENET_SGMII_IN_N Bank  67 VCCO - VCC1V8   - IO_L23N_T3U_N9_67
set_property PACKAGE_PIN BG22     [get_ports {phy_sgmii_tx_p}] ;# ENET_SGMII_IN_P Bank  67 VCCO - VCC1V8   - IO_L23P_T3U_N8_67
set_property IOSTANDARD  LVDS     [get_ports {phy_sgmii_tx_p}] ;# ENET_SGMII_IN_P Bank  67 VCCO - VCC1V8   - IO_L23P_T3U_N8_67
set_property PACKAGE_PIN BK21     [get_ports {phy_sgmii_rx_n}] ;# ENET_SGMII_OUT_N Bank  67 VCCO - VCC1V8   - IO_L21N_T3L_N5_AD8N_67
set_property IOSTANDARD  LVDS     [get_ports {phy_sgmii_rx_n}] ;# ENET_SGMII_OUT_N Bank  67 VCCO - VCC1V8   - IO_L21N_T3L_N5_AD8N_67
set_property PACKAGE_PIN BJ22     [get_ports {phy_sgmii_rx_p}] ;# ENET_SGMII_OUT_P Bank  67 VCCO - VCC1V8   - IO_L21P_T3L_N4_AD8P_67
set_property IOSTANDARD  LVDS     [get_ports {phy_sgmii_rx_p}] ;# ENET_SGMII_OUT_P Bank  67 VCCO - VCC1V8   - IO_L21P_T3L_N4_AD8P_67
set_property PACKAGE_PIN BJ27     [get_ports {phy_sgmii_clk_n}] ;# ENET_SGMII_CLK_N Bank  67 VCCO - VCC1V8   - IO_L12N_T1U_N11_GC_67
set_property IOSTANDARD  LVDS     [get_ports {phy_sgmii_clk_n}] ;# ENET_SGMII_CLK_N Bank  67 VCCO - VCC1V8   - IO_L12N_T1U_N11_GC_67
set_property PACKAGE_PIN BH27     [get_ports {phy_sgmii_clk_p}] ;# ENET_SGMII_CLK_P Bank  67 VCCO - VCC1V8   - IO_L12P_T1U_N10_GC_67
set_property IOSTANDARD  LVDS     [get_ports {phy_sgmii_clk_p}] ;# ENET_SGMII_CLK_P Bank  67 VCCO - VCC1V8   - IO_L12P_T1U_N10_GC_67
set_property PACKAGE_PIN BF22     [get_ports {phy_int_n}] ;# ENET_PDWN_B_I_INT_B_O Bank  67 VCCO - VCC1V8   - IO_L24P_T3U_N10_67
set_property IOSTANDARD  LVCMOS18 [get_ports {phy_int_n}] ;# ENET_PDWN_B_I_INT_B_O Bank  67 VCCO - VCC1V8   - IO_L24P_T3U_N10_67
set_property PACKAGE_PIN BG23     [get_ports {phy_mdio}] ;# ENET_MDIO Bank  67 VCCO - VCC1V8   - IO_T3U_N12_67
set_property IOSTANDARD  LVCMOS18 [get_ports {phy_mdio}] ;# ENET_MDIO Bank  67 VCCO - VCC1V8   - IO_T3U_N12_67
set_property PACKAGE_PIN BN27     [get_ports {phy_mdc}] ;# ENET_MDC Bank  67 VCCO - VCC1V8   - IO_T1U_N12_67
set_property IOSTANDARD  LVCMOS18 [get_ports {phy_mdc}] ;# ENET_MDC Bank  67 VCCO - VCC1V8   - IO_T1U_N12_67
set_property PACKAGE_PIN BL23     [get_ports dummy_port_in] ;# Bank  67 VCCO - VCC1V8   - IO_L19P_T3L_N0_DBC_AD9P_67
set_property IOSTANDARD  LVCMOS18 [get_ports dummy_port_in] ;# Bank  67 VCCO - VCC1V8   - IO_L19P_T3L_N0_DBC_AD9P_67
#set_property PACKAGE_PIN BJ23     [get_ports "ENET_CLKOUT"] ;# Bank  67 VCCO - VCC1V8   - IO_L14N_T2L_N3_GC_67
#set_property IOSTANDARD  LVCMOS18 [get_ports "ENET_CLKOUT"] ;# Bank  67 VCCO - VCC1V8   - IO_L14N_T2L_N3_GC_67
#set_property PACKAGE_PIN BP27     [get_ports "ENET_COL_GPIO"] ;# Bank  67 VCCO - VCC1V8   - IO_T0U_N12_VRP_67
#set_property IOSTANDARD  LVCMOS18 [get_ports "ENET_COL_GPIO"] ;# Bank  67 VCCO - VCC1V8   - IO_T0U_N12_VRP_67

set_false_path -to [get_ports {phy_reset_n phy_mdio phy_mdc}]
set_output_delay 0 [get_ports {phy_reset_n phy_mdio phy_mdc}]
set_false_path -from [get_ports {phy_int_n phy_mdio}]
set_input_delay 0 [get_ports {phy_int_n phy_mdio}]

# Reset button

set_property PACKAGE_PIN BM29      [get_ports {clk_rst}] ;# Bank  64 VCCO - DDR4_VDDQ_1V2 - IO_L1N_T0L_N1_DBC_64
set_property IOSTANDARD  LVCMOS12  [get_ports {clk_rst}] ;# Bank  64 VCCO - DDR4_VDDQ_1V2 - IO_L1N_T0L_N1_DBC_64

##################################################################################################
# 2. DRAM
##################################################################################################

set_property PACKAGE_PIN BG52   [get_ports "c0_ddr4_act_n"]

set_property PACKAGE_PIN BF50   [get_ports "c0_ddr4_adr[0]"]
set_property PACKAGE_PIN BD51   [get_ports "c0_ddr4_adr[1]"]
set_property PACKAGE_PIN BG48   [get_ports "c0_ddr4_adr[2]"]
set_property PACKAGE_PIN BE50   [get_ports "c0_ddr4_adr[3]"]
set_property PACKAGE_PIN BE49   [get_ports "c0_ddr4_adr[4]"]
set_property PACKAGE_PIN BE51   [get_ports "c0_ddr4_adr[5]"]
set_property PACKAGE_PIN BF53   [get_ports "c0_ddr4_adr[6]"]
set_property PACKAGE_PIN BG50   [get_ports "c0_ddr4_adr[7]"]
set_property PACKAGE_PIN BF51   [get_ports "c0_ddr4_adr[8]"]
set_property PACKAGE_PIN BG47   [get_ports "c0_ddr4_adr[9]"]
set_property PACKAGE_PIN BF47   [get_ports "c0_ddr4_adr[10]"]
set_property PACKAGE_PIN BG49   [get_ports "c0_ddr4_adr[11]"]
set_property PACKAGE_PIN BF48   [get_ports "c0_ddr4_adr[12]"]
set_property PACKAGE_PIN BF52   [get_ports "c0_ddr4_adr[13]"]
set_property PACKAGE_PIN BG53   [get_ports "c0_ddr4_adr[14]"]
set_property PACKAGE_PIN BH54   [get_ports "c0_ddr4_adr[15]"]
set_property PACKAGE_PIN BJ54   [get_ports "c0_ddr4_adr[16]"]
set_property PACKAGE_PIN BE54   [get_ports "c0_ddr4_ba[0]"]
set_property PACKAGE_PIN BE53   [get_ports "c0_ddr4_ba[1]"]
set_property PACKAGE_PIN BG54   [get_ports "c0_ddr4_bg"]
set_property PACKAGE_PIN BK54   [get_ports "c0_ddr4_ck_c"]
set_property PACKAGE_PIN BK53   [get_ports "c0_ddr4_ck_t"]
set_property PACKAGE_PIN BH52   [get_ports "c0_ddr4_cke"]
set_property PACKAGE_PIN BP49   [get_ports "c0_ddr4_cs_n[0]"]
set_property PACKAGE_PIN BK48   [get_ports "c0_ddr4_cs_n[1]"]
set_property PACKAGE_PIN BN42   [get_ports "c0_ddr4_dm_dbi_n[0]"]
set_property PACKAGE_PIN BL47   [get_ports "c0_ddr4_dm_dbi_n[1]"]
set_property PACKAGE_PIN BH42   [get_ports "c0_ddr4_dm_dbi_n[2]"]
set_property PACKAGE_PIN BD41   [get_ports "c0_ddr4_dm_dbi_n[3]"]
set_property PACKAGE_PIN BM28   [get_ports "c0_ddr4_dm_dbi_n[4]"]
set_property PACKAGE_PIN BM34   [get_ports "c0_ddr4_dm_dbi_n[5]"]
set_property PACKAGE_PIN BH32   [get_ports "c0_ddr4_dm_dbi_n[6]"]
set_property PACKAGE_PIN BG29   [get_ports "c0_ddr4_dm_dbi_n[7]"]

set_property PACKAGE_PIN BM45   [get_ports "c0_ddr4_dq[0]"]
set_property PACKAGE_PIN BP44   [get_ports "c0_ddr4_dq[1]"]
set_property PACKAGE_PIN BP47   [get_ports "c0_ddr4_dq[2]"]
set_property PACKAGE_PIN BN45   [get_ports "c0_ddr4_dq[3]"]
set_property PACKAGE_PIN BM44   [get_ports "c0_ddr4_dq[4]"]
set_property PACKAGE_PIN BN44   [get_ports "c0_ddr4_dq[5]"]
set_property PACKAGE_PIN BN47   [get_ports "c0_ddr4_dq[6]"]
set_property PACKAGE_PIN BP43   [get_ports "c0_ddr4_dq[7]"]
set_property PACKAGE_PIN BL45   [get_ports "c0_ddr4_dq[8]"]
set_property PACKAGE_PIN BK44   [get_ports "c0_ddr4_dq[9]"]
set_property PACKAGE_PIN BL46   [get_ports "c0_ddr4_dq[10]"]
set_property PACKAGE_PIN BK43   [get_ports "c0_ddr4_dq[11]"]
set_property PACKAGE_PIN BL43   [get_ports "c0_ddr4_dq[12]"]
set_property PACKAGE_PIN BJ44   [get_ports "c0_ddr4_dq[13]"]
set_property PACKAGE_PIN BL42   [get_ports "c0_ddr4_dq[14]"]
set_property PACKAGE_PIN BJ43   [get_ports "c0_ddr4_dq[15]"]
set_property PACKAGE_PIN BK41   [get_ports "c0_ddr4_dq[16]"]
set_property PACKAGE_PIN BG44   [get_ports "c0_ddr4_dq[17]"]
set_property PACKAGE_PIN BG42   [get_ports "c0_ddr4_dq[18]"]
set_property PACKAGE_PIN BH44   [get_ports "c0_ddr4_dq[19]"]
set_property PACKAGE_PIN BH45   [get_ports "c0_ddr4_dq[20]"]
set_property PACKAGE_PIN BG45   [get_ports "c0_ddr4_dq[21]"]
set_property PACKAGE_PIN BG43   [get_ports "c0_ddr4_dq[22]"]
set_property PACKAGE_PIN BJ41   [get_ports "c0_ddr4_dq[23]"]
set_property PACKAGE_PIN BE43   [get_ports "c0_ddr4_dq[24]"]
set_property PACKAGE_PIN BF42   [get_ports "c0_ddr4_dq[25]"]
set_property PACKAGE_PIN BC42   [get_ports "c0_ddr4_dq[26]"]
set_property PACKAGE_PIN BF43   [get_ports "c0_ddr4_dq[27]"]
set_property PACKAGE_PIN BD42   [get_ports "c0_ddr4_dq[28]"]
set_property PACKAGE_PIN BF45   [get_ports "c0_ddr4_dq[29]"]
set_property PACKAGE_PIN BE44   [get_ports "c0_ddr4_dq[30]"]
set_property PACKAGE_PIN BF46   [get_ports "c0_ddr4_dq[31]"]
set_property PACKAGE_PIN BP32   [get_ports "c0_ddr4_dq[32]"]
set_property PACKAGE_PIN BP29   [get_ports "c0_ddr4_dq[33]"]
set_property PACKAGE_PIN BP31   [get_ports "c0_ddr4_dq[34]"]
set_property PACKAGE_PIN BP28   [get_ports "c0_ddr4_dq[35]"]
set_property PACKAGE_PIN BN32   [get_ports "c0_ddr4_dq[36]"]
set_property PACKAGE_PIN BM30   [get_ports "c0_ddr4_dq[37]"]
set_property PACKAGE_PIN BN31   [get_ports "c0_ddr4_dq[38]"]
set_property PACKAGE_PIN BL30   [get_ports "c0_ddr4_dq[39]"]
set_property PACKAGE_PIN BL32   [get_ports "c0_ddr4_dq[40]"]
set_property PACKAGE_PIN BP34   [get_ports "c0_ddr4_dq[41]"]
set_property PACKAGE_PIN BN34   [get_ports "c0_ddr4_dq[42]"]
set_property PACKAGE_PIN BK33   [get_ports "c0_ddr4_dq[43]"]
set_property PACKAGE_PIN BL31   [get_ports "c0_ddr4_dq[44]"]
set_property PACKAGE_PIN BL33   [get_ports "c0_ddr4_dq[45]"]
set_property PACKAGE_PIN BM33   [get_ports "c0_ddr4_dq[46]"]
set_property PACKAGE_PIN BK31   [get_ports "c0_ddr4_dq[47]"]
set_property PACKAGE_PIN BJ34   [get_ports "c0_ddr4_dq[48]"]
set_property PACKAGE_PIN BG35   [get_ports "c0_ddr4_dq[49]"]
set_property PACKAGE_PIN BH34   [get_ports "c0_ddr4_dq[50]"]
set_property PACKAGE_PIN BH35   [get_ports "c0_ddr4_dq[51]"]
set_property PACKAGE_PIN BJ33   [get_ports "c0_ddr4_dq[52]"]
set_property PACKAGE_PIN BF35   [get_ports "c0_ddr4_dq[53]"]
set_property PACKAGE_PIN BG34   [get_ports "c0_ddr4_dq[54]"]
set_property PACKAGE_PIN BF36   [get_ports "c0_ddr4_dq[55]"]
set_property PACKAGE_PIN BF31   [get_ports "c0_ddr4_dq[56]"]
set_property PACKAGE_PIN BH30   [get_ports "c0_ddr4_dq[57]"]
set_property PACKAGE_PIN BJ31   [get_ports "c0_ddr4_dq[58]"]
set_property PACKAGE_PIN BG32   [get_ports "c0_ddr4_dq[59]"]
set_property PACKAGE_PIN BH31   [get_ports "c0_ddr4_dq[60]"]
set_property PACKAGE_PIN BF32   [get_ports "c0_ddr4_dq[61]"]
set_property PACKAGE_PIN BH29   [get_ports "c0_ddr4_dq[62]"]
set_property PACKAGE_PIN BF33   [get_ports "c0_ddr4_dq[63]"]

set_property PACKAGE_PIN BP46   [get_ports "c0_ddr4_dqs_c[0]"]
set_property PACKAGE_PIN BK46   [get_ports "c0_ddr4_dqs_c[1]"]
set_property PACKAGE_PIN BJ46   [get_ports "c0_ddr4_dqs_c[2]"]
set_property PACKAGE_PIN BE46   [get_ports "c0_ddr4_dqs_c[3]"]
set_property PACKAGE_PIN BN30   [get_ports "c0_ddr4_dqs_c[4]"]
set_property PACKAGE_PIN BM35   [get_ports "c0_ddr4_dqs_c[5]"]
set_property PACKAGE_PIN BK35   [get_ports "c0_ddr4_dqs_c[6]"]
set_property PACKAGE_PIN BK30   [get_ports "c0_ddr4_dqs_c[7]"]

set_property PACKAGE_PIN BN46   [get_ports "c0_ddr4_dqs_t[0]"]
set_property PACKAGE_PIN BK45   [get_ports "c0_ddr4_dqs_t[1]"]
set_property PACKAGE_PIN BH46   [get_ports "c0_ddr4_dqs_t[2]"]
set_property PACKAGE_PIN BE45   [get_ports "c0_ddr4_dqs_t[3]"]
set_property PACKAGE_PIN BN29   [get_ports "c0_ddr4_dqs_t[4]"]
set_property PACKAGE_PIN BL35   [get_ports "c0_ddr4_dqs_t[5]"]
set_property PACKAGE_PIN BK34   [get_ports "c0_ddr4_dqs_t[6]"]
set_property PACKAGE_PIN BJ29   [get_ports "c0_ddr4_dqs_t[7]"]

set_property PACKAGE_PIN BH49   [get_ports "c0_ddr4_odt"]
set_property PACKAGE_PIN BH50   [get_ports "c0_ddr4_reset_n"]


# IOSTANDARD
set_property -quiet IOSTANDARD POD12_DCI [get_ports {c0_ddr4_dq[*]}]
set_property -quiet IOSTANDARD SSTL12_DCI [get_ports {c0_ddr4_adr[*]}]
set_property -quiet IOSTANDARD SSTL12_DCI [get_ports {c0_ddr4_ba[*]}]
set_property -quiet IOSTANDARD SSTL12_DCI [get_ports {c0_ddr4_bg}]
set_property -quiet IOSTANDARD LVCMOS12 [get_ports {c0_ddr4_reset_n}]
set_property -quiet IOSTANDARD SSTL12_DCI [get_ports {c0_ddr4_act_n}]
set_property -quiet IOSTANDARD SSTL12_DCI [get_ports {c0_ddr4_cke}]
set_property -quiet IOSTANDARD SSTL12_DCI [get_ports {c0_ddr4_cs_n[*]}]
set_property -quiet IOSTANDARD SSTL12_DCI [get_ports {c0_ddr4_odt}]
set_property -quiet IOSTANDARD POD12_DCI [get_ports {c0_ddr4_dm_dbi_n[*]}]
set_property -quiet IOSTANDARD DIFF_POD12_DCI [get_ports {c0_ddr4_dqs_c[*]}]
set_property -quiet IOSTANDARD DIFF_POD12_DCI [get_ports {c0_ddr4_dqs_t[*]}]
set_property -quiet IOSTANDARD DIFF_SSTL12_DCI [get_ports {c0_ddr4_ck_c}]
set_property -quiet IOSTANDARD DIFF_SSTL12_DCI [get_ports {c0_ddr4_ck_t}]

##################################################################################################
# 3.   Clock domain crossing paths are marked false (TODO)
##################################################################################################

##
#  TODO: Set false paths between all distinct clocks.
## set false paths
                                                                                    
#set_false_path -from [get_clocks -include_generated_clocks clk_125mhz_mmcm_out] -to [get_clocks -include_generated_clocks mmcm_clkout0]
#set_false_path -from [get_clocks -include_generated_clocks mmcm_clkout0] -to [get_clocks -include_generated_clocks clk_125mhz_mmcm_out]

set_false_path -from [get_clocks -include_generated_clocks clk_125_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_80_clk_wiz_0]
set_false_path -from [get_clocks -include_generated_clocks clk_80_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_125_clk_wiz_0]


#
set_false_path -from [get_clocks -include_generated_clocks clk_80_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_200_clk_wiz_0]
set_false_path -from [get_clocks -include_generated_clocks clk_200_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_80_clk_wiz_0]

set_false_path -from [get_clocks -include_generated_clocks clk_125_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_200_clk_wiz_0]
set_false_path -from [get_clocks -include_generated_clocks clk_200_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_125_clk_wiz_0]

set_false_path -from [get_clocks -include_generated_clocks mmcm_clkout0] -to [get_clocks -include_generated_clocks mmcm_clkout0]
set_false_path -from [get_clocks -include_generated_clocks clk_125_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_125_clk_wiz_0]

set_false_path -from [get_clocks -include_generated_clocks clk_80_clk_wiz_0] -to [get_clocks -include_generated_clocks mmcm_clkout0]
set_false_path -from [get_clocks -include_generated_clocks mmcm_clkout0] -to [get_clocks -include_generated_clocks clk_80_clk_wiz_0]

set_false_path -from [get_clocks -include_generated_clocks clk_125mhz_mmcm_out] -to [get_clocks -include_generated_clocks clk_125_clk_wiz_0]
set_false_path -from [get_clocks -include_generated_clocks clk_125_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_125mhz_mmcm_out]

set_false_path -from [get_clocks -include_generated_clocks clk_125_clk_wiz_0] -to [get_clocks -include_generated_clocks mmcm_clkout0]




#
#
###################################################################################################
## 4.   Max delay on clock domain crossing paths.
###################################################################################################
#
###TODO (DONE!): set max delay of 10ns between all clock pairs.
#
#set_max_delay 15 -from [get_clocks -include_generated_clocks clk_125mhz_mmcm_out] -to [get_clocks -include_generated_clocks mmcm_clkout0]
#set_max_delay 15 -from [get_clocks -include_generated_clocks mmcm_clkout0] -to [get_clocks -include_generated_clocks clk_125mhz_mmcm_out]
#

set_max_delay 15 -from [get_clocks -include_generated_clocks clk_80_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_125_clk_wiz_0]
set_max_delay 15 -from [get_clocks -include_generated_clocks clk_125_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_80_clk_wiz_0]


set_max_delay 15 -from [get_clocks -include_generated_clocks clk_80_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_200_clk_wiz_0]
set_max_delay 15 -from [get_clocks -include_generated_clocks clk_200_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_80_clk_wiz_0]


set_max_delay 15 -from [get_clocks -include_generated_clocks clk_125_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_200_clk_wiz_0]
set_max_delay 15 -from [get_clocks -include_generated_clocks clk_200_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_125_clk_wiz_0]

set_max_delay 15 -from [get_clocks -include_generated_clocks clk_80_clk_wiz_0] -to [get_clocks -include_generated_clocks mmcm_clkout0]
set_max_delay 15 -from [get_clocks -include_generated_clocks mmcm_clkout0] -to [get_clocks -include_generated_clocks clk_80_clk_wiz_0]

set_max_delay 15 -from [get_clocks -include_generated_clocks clk_125_clk_wiz_0] -to [get_clocks -include_generated_clocks clk_125mhz_mmcm_out]
set_max_delay 15 -from [get_clocks -include_generated_clocks clk_125mhz_mmcm_out] -to [get_clocks -include_generated_clocks clk_125_clk_wiz_0]

set_max_delay 15 -from [get_clocks -include_generated_clocks clk_125_clk_wiz_0] -to [get_clocks -include_generated_clocks mmcm_clkout0]


#LEDs - Check for available LEDs
#set_property PACKAGE_PIN E18 [get_ports {CPU_MODE[1]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {CPU_MODE[1]}]
#set_property PACKAGE_PIN F16 [get_ports {CPU_MODE[0]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {CPU_MODE[0]}]



##################################################################################################
# 5.  SPI flash connections
##################################################################################################
## P24 - DQ0 in KC705 Check for IOSTANDARD in VCU 128 constraint file
#set_property PACKAGE_PIN AW15 [get_ports {SPI_FLASH_MOSI[0]}]
#set_property IOSTANDARD CONFIG [get_ports {SPI_FLASH_MOSI[0]}]
## R25 - DQ1 in KC705 
#set_property PACKAGE_PIN AY15 [get_ports {SPI_FLASH_MISO[0]}]
#set_property IOSTANDARD CONFIG [get_ports {SPI_FLASH_MISO[0]}]
## U19 - CS_B in KC705 
#set_property PACKAGE_PIN BC15 [get_ports {SPI_FLASH_CS_TOP[0]}]
#set_property IOSTANDARD CONFIG [get_ports {SPI_FLASH_CS_TOP[0]}]
## G19 - GPIO LED 5 in KC705 (check B10)
#set_property PACKAGE_PIN BD14 [get_ports {SPI_FLASH_CLK[0]}]
#set_property IOSTANDARD CONFIG [get_ports {SPI_FLASH_CLK[0]}]
