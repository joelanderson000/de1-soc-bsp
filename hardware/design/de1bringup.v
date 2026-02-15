module de1bringup (
	CLOCK_50,
	SW,
	LEDR,
	HPS_CONV_USB_N,
	HPS_DDR3_ADDR,
	HPS_DDR3_BA,
	HPS_DDR3_CAS_N,
	HPS_DDR3_CKE,
	HPS_DDR3_CK_N,
	HPS_DDR3_CK_P,
	HPS_DDR3_CS_N,
	HPS_DDR3_DM,
	HPS_DDR3_DQ,
	HPS_DDR3_DQS_N,
	HPS_DDR3_DQS_P,
	HPS_DDR3_ODT,
	HPS_DDR3_RAS_N,
	HPS_DDR3_RESET_N,
	HPS_DDR3_RZQ,
	HPS_DDR3_WE_N,
	HPS_ENET_GTX_CLK,
	HPS_ENET_INT_N,
	HPS_ENET_MDC,
	HPS_ENET_MDIO,
	HPS_ENET_RX_CLK,
	HPS_ENET_RX_DATA,
	HPS_ENET_RX_DV,
	HPS_ENET_TX_DATA,
	HPS_ENET_TX_EN,
	HPS_KEY,
	HPS_SD_CLK,
	HPS_SD_CMD,
	HPS_SD_DATA,
	HPS_UART_RX,
	HPS_UART_TX,
	HPS_USB_CLKOUT,
	HPS_USB_DATA,
	HPS_USB_DIR,
	HPS_USB_NXT,
	HPS_USB_STP,
);
	// FPGA I/O
	input CLOCK_50;
	input [9:0] SW;
	output [9:0] LEDR;
	
	// HPS I/O
	inout HPS_CONV_USB_N;
	output [14:0] HPS_DDR3_ADDR;
	output [2:0] HPS_DDR3_BA;
	output HPS_DDR3_CAS_N;
	output HPS_DDR3_CKE;
	output HPS_DDR3_CK_N;
	output HPS_DDR3_CK_P;
	output HPS_DDR3_CS_N;
	output [3:0] HPS_DDR3_DM;
	inout [31:0] HPS_DDR3_DQ;
	inout [3:0] HPS_DDR3_DQS_N;
	inout [3:0] HPS_DDR3_DQS_P;
	output HPS_DDR3_ODT;
	output HPS_DDR3_RAS_N;
	output HPS_DDR3_RESET_N;
	input HPS_DDR3_RZQ;
	output HPS_DDR3_WE_N;
	output HPS_ENET_GTX_CLK;
	inout HPS_ENET_INT_N;
	output HPS_ENET_MDC;
	inout HPS_ENET_MDIO;
	input HPS_ENET_RX_CLK;
	input [3:0] HPS_ENET_RX_DATA;
	input HPS_ENET_RX_DV;
	output [3:0] HPS_ENET_TX_DATA;
	output HPS_ENET_TX_EN;
	inout [3:0] HPS_KEY;
	output HPS_SD_CLK;
	inout HPS_SD_CMD;
	inout [3:0] HPS_SD_DATA;
	input HPS_UART_RX;
	output HPS_UART_TX;
	input HPS_USB_CLKOUT;
	inout [7:0] HPS_USB_DATA;
	input HPS_USB_DIR;
	input HPS_USB_NXT;
	inout HPS_USB_STP;
	
	hps_fpga hps_conn (
		.clk_clk                         (CLOCK_50),                         //                     clk.clk
		.reset_reset_n                   ( 1 ),                   //                   reset.reset_n
		.memory_mem_a                    (HPS_DDR3_ADDR),                    //                  memory.mem_a
		.memory_mem_ba                   (HPS_DDR3_BA),                   //                        .mem_ba
		.memory_mem_ck                   (HPS_DDR3_CK_P),                   //                        .mem_ck
		.memory_mem_ck_n                 (HPS_DDR3_CK_N),                 //                        .mem_ck_n
		.memory_mem_cke                  (HPS_DDR3_CKE),                  //                        .mem_cke
		.memory_mem_cs_n                 (HPS_DDR3_CS_N),                 //                        .mem_cs_n
		.memory_mem_ras_n                (HPS_DDR3_RAS_N),                //                        .mem_ras_n
		.memory_mem_cas_n                (HPS_DDR3_CAS_N),                //                        .mem_cas_n
		.memory_mem_we_n                 (HPS_DDR3_WE_N),                 //                        .mem_we_n
		.memory_mem_reset_n              (HPS_DDR3_RESET_N),              //                        .mem_reset_n
		.memory_mem_dq                   (HPS_DDR3_DQ),                   //                        .mem_dq
		.memory_mem_dqs                  (HPS_DDR3_DQS_P),                  //                        .mem_dqs
		.memory_mem_dqs_n                (HPS_DDR3_DQS_N),                //                        .mem_dqs_n
		.memory_mem_odt                  (HPS_DDR3_ODT),                  //                        .mem_odt
		.memory_mem_dm                   (HPS_DDR3_DM),                   //                        .mem_dm
		.memory_oct_rzqin                (HPS_DDR3_RZQ),                //                        .oct_rzqin
		.hps_0_h2f_reset_reset_n         (HPS_H2F_RST),          //         hps_0_h2f_reset.reset_n
		.led_external_connection_export  (LEDR),  // led_external_connection.export
		.sw_external_connection_export   (SW),   //  sw_external_connection.export
		.hps_io_hps_io_emac1_inst_TX_CLK (HPS_ENET_GTX_CLK), //                  hps_io.hps_io_emac1_inst_TX_CLK
		.hps_io_hps_io_emac1_inst_TXD0   (HPS_ENET_TX_DATA[0]),   //                        .hps_io_emac1_inst_TXD0
		.hps_io_hps_io_emac1_inst_TXD1   (HPS_ENET_TX_DATA[1]),   //                        .hps_io_emac1_inst_TXD1
		.hps_io_hps_io_emac1_inst_TXD2   (HPS_ENET_TX_DATA[2]),   //                        .hps_io_emac1_inst_TXD2
		.hps_io_hps_io_emac1_inst_TXD3   (HPS_ENET_TX_DATA[3]),   //                        .hps_io_emac1_inst_TXD3
		.hps_io_hps_io_emac1_inst_RXD0   (HPS_ENET_RX_DATA[0]),   //                        .hps_io_emac1_inst_RXD0
		.hps_io_hps_io_emac1_inst_MDIO   (HPS_ENET_MDIO),   //                        .hps_io_emac1_inst_MDIO
		.hps_io_hps_io_emac1_inst_MDC    (HPS_ENET_MDC),    //                        .hps_io_emac1_inst_MDC
		.hps_io_hps_io_emac1_inst_RX_CTL (HPS_ENET_RX_DV), //                        .hps_io_emac1_inst_RX_CTL
		.hps_io_hps_io_emac1_inst_TX_CTL (HPS_ENET_TX_EN), //                        .hps_io_emac1_inst_TX_CTL
		.hps_io_hps_io_emac1_inst_RX_CLK (HPS_ENET_RX_CLK), //                        .hps_io_emac1_inst_RX_CLK
		.hps_io_hps_io_emac1_inst_RXD1   (HPS_ENET_RX_DATA[1]),   //                        .hps_io_emac1_inst_RXD1
		.hps_io_hps_io_emac1_inst_RXD2   (HPS_ENET_RX_DATA[2]),   //                        .hps_io_emac1_inst_RXD2
		.hps_io_hps_io_emac1_inst_RXD3   (HPS_ENET_RX_DATA[3]),   //                        .hps_io_emac1_inst_RXD3
		.hps_io_hps_io_sdio_inst_CMD     (HPS_SD_CMD),     //                        .hps_io_sdio_inst_CMD
		.hps_io_hps_io_sdio_inst_D0      (HPS_SD_DATA[0]),      //                        .hps_io_sdio_inst_D0
		.hps_io_hps_io_sdio_inst_D1      (HPS_SD_DATA[1]),      //                        .hps_io_sdio_inst_D1
		.hps_io_hps_io_sdio_inst_D2      (HPS_SD_DATA[2]),      //                        .hps_io_sdio_inst_D2
		.hps_io_hps_io_sdio_inst_D3      (HPS_SD_DATA[3]),      //                        .hps_io_sdio_inst_D3
		.hps_io_hps_io_sdio_inst_CLK     (HPS_SD_CLK),     //                        .hps_io_sdio_inst_CLK
		.hps_io_hps_io_usb1_inst_D0      (HPS_USB_DATA[0]),      //                        .hps_io_usb1_inst_D0
		.hps_io_hps_io_usb1_inst_D1      (HPS_USB_DATA[1]),      //                        .hps_io_usb1_inst_D1
		.hps_io_hps_io_usb1_inst_D2      (HPS_USB_DATA[2]),      //                        .hps_io_usb1_inst_D2
		.hps_io_hps_io_usb1_inst_D3      (HPS_USB_DATA[3]),      //                        .hps_io_usb1_inst_D3
		.hps_io_hps_io_usb1_inst_D4      (HPS_USB_DATA[4]),      //                        .hps_io_usb1_inst_D4
		.hps_io_hps_io_usb1_inst_D5      (HPS_USB_DATA[5]),      //                        .hps_io_usb1_inst_D5
		.hps_io_hps_io_usb1_inst_D6      (HPS_USB_DATA[6]),      //                        .hps_io_usb1_inst_D6
		.hps_io_hps_io_usb1_inst_D7      (HPS_USB_DATA[7]),      //                        .hps_io_usb1_inst_D7
		.hps_io_hps_io_usb1_inst_CLK     (HPS_USB_CLKOUT),     //                        .hps_io_usb1_inst_CLK
		.hps_io_hps_io_usb1_inst_STP     (HPS_USB_STP),     //                        .hps_io_usb1_inst_STP
		.hps_io_hps_io_usb1_inst_DIR     (HPS_USB_DIR),     //                        .hps_io_usb1_inst_DIR
		.hps_io_hps_io_usb1_inst_NXT     (HPS_USB_NXT),     //                        .hps_io_usb1_inst_NXT
		.hps_io_hps_io_uart0_inst_RX     (HPS_UART_RX),     //                        .hps_io_uart0_inst_RX
		.hps_io_hps_io_uart0_inst_TX     (HPS_UART_TX),      //                        .hps_io_uart0_inst_TX
	);
	
endmodule