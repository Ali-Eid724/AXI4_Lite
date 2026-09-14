`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module axi4_lite_top_tb();

    logic           ACLK_tb;
    logic           ARESETN_tb;
    logic           read_start_tb;
    logic           write_start_tb;
    logic [31:0]    address_tb;
    logic [31:0]    W_data_tb;
    
    axi4_lite_top u_axi4_lite_top0(
        .ACLK(ACLK_tb),
        .ARESETN(ARESETN_tb),
        .read_start(read_start_tb),
        .write_start(write_start_tb),
        .address(address_tb),
        .W_data(W_data_tb)
    );

    initial begin
        #5;
        ACLK_tb=0;
        ARESETN_tb=0;
        read_start_tb=0;  
        write_start_tb=0;                           
        #5;
        ACLK_tb=1;
        ARESETN_tb=1;
        write_start_tb=0;
        #15;
        write_start_tb=1;
        address_tb = 5;
        W_data_tb = 4;
        
        //read_start_tb=1;
        #10;
        write_start_tb=0;
        #20;
        write_start_tb=0;
        read_start_tb=0;
        #30;
        read_start_tb=1;
        address_tb = 5;
        #10;
        read_start_tb=0;
        #50;
        $finish;            
    end
    
    always begin
        #5 ACLK_tb = ~ACLK_tb;
    end
endmodule
