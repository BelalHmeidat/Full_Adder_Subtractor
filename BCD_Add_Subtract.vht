-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "01/03/2022 01:31:20"
                                                                        
-- Vhdl Self-Checking Test Bench (with test vectors) for design :       BCD_adder
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

LIBRARY STD;                                                            
USE STD.textio.ALL;                                                     

PACKAGE BCD_adder_vhd_tb_types IS
-- input port types                                                       
-- output port names                                                     
CONSTANT final_sum_name : STRING (1 TO 9) := "final_sum";
-- n(outputs)                                                            
CONSTANT o_num : INTEGER := 1;
-- mismatches vector type                                                
TYPE mmvec IS ARRAY (0 to (o_num - 1)) OF INTEGER;
-- exp o/ first change track vector type                                     
TYPE trackvec IS ARRAY (1 to o_num) OF BIT;
-- sampler type                                                            
SUBTYPE sample_type IS STD_LOGIC;                                          
-- utility functions                                                     
FUNCTION std_logic_to_char (a: STD_LOGIC) RETURN CHARACTER;              
FUNCTION std_logic_vector_to_string (a: STD_LOGIC_VECTOR) RETURN STRING; 
PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC; justified: IN SIDE:= RIGHT; field:IN WIDTH:=0);                                               
PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC_VECTOR; justified: IN SIDE:= RIGHT; field:IN WIDTH:=0);                                        
PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC; real_value : IN STD_LOGIC);                                   
PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC_VECTOR; real_value : IN STD_LOGIC_VECTOR);                     

END BCD_adder_vhd_tb_types;

PACKAGE BODY BCD_adder_vhd_tb_types IS
        FUNCTION std_logic_to_char (a: STD_LOGIC)  
                RETURN CHARACTER IS                
        BEGIN                                      
        CASE a IS                                  
         WHEN 'U' =>                               
          RETURN 'U';                              
         WHEN 'X' =>                               
          RETURN 'X';                              
         WHEN '0' =>                               
          RETURN '0';                              
         WHEN '1' =>                               
          RETURN '1';                              
         WHEN 'Z' =>                               
          RETURN 'Z';                              
         WHEN 'W' =>                               
          RETURN 'W';                              
         WHEN 'L' =>                               
          RETURN 'L';                              
         WHEN 'H' =>                               
          RETURN 'H';                              
         WHEN '-' =>                               
          RETURN 'D';                              
        END CASE;                                  
        END;                                       

        FUNCTION std_logic_vector_to_string (a: STD_LOGIC_VECTOR)       
                RETURN STRING IS                                        
        VARIABLE result : STRING(1 TO a'LENGTH);                        
        VARIABLE j : NATURAL := 1;                                      
        BEGIN                                                           
                FOR i IN a'RANGE LOOP                                   
                        result(j) := std_logic_to_char(a(i));           
                        j := j + 1;                                     
                END LOOP;                                               
                RETURN result;                                          
        END;                                                            

        PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC; justified: IN SIDE:=RIGHT; field:IN WIDTH:=0) IS 
        BEGIN                                                           
                write(L,std_logic_to_char(VALUE),JUSTIFIED,field);      
        END;                                                            
                                                                        
        PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC_VECTOR; justified: IN SIDE:= RIGHT; field:IN WIDTH:=0) IS                           
        BEGIN                                                               
                write(L,std_logic_vector_to_string(VALUE),JUSTIFIED,field); 
        END;                                                                

        PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC; real_value : IN STD_LOGIC) IS                               
        VARIABLE txt : LINE;                                              
        BEGIN                                                             
        write(txt,string'("ERROR! Vector Mismatch for output port "));  
        write(txt,output_port_name);                                      
        write(txt,string'(" :: @time = "));                             
        write(txt,NOW);                                                   
		writeline(output,txt);                                            
        write(txt,string'("     Expected value = "));                   
        write(txt,expected_value);                                        
		writeline(output,txt);                                            
        write(txt,string'("     Real value = "));                       
        write(txt,real_value);                                            
        writeline(output,txt);                                            
        END;                                                              

        PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC_VECTOR; real_value : IN STD_LOGIC_VECTOR) IS                 
        VARIABLE txt : LINE;                                              
        BEGIN                                                             
        write(txt,string'("ERROR! Vector Mismatch for output port "));  
        write(txt,output_port_name);                                      
        write(txt,string'(" :: @time = "));                             
        write(txt,NOW);                                                   
		writeline(output,txt);                                            
        write(txt,string'("     Expected value = "));                   
        write(txt,expected_value);                                        
		writeline(output,txt);                                            
        write(txt,string'("     Real value = "));                       
        write(txt,real_value);                                            
        writeline(output,txt);                                            
        END;                                                              

END BCD_adder_vhd_tb_types;

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

USE WORK.BCD_adder_vhd_tb_types.ALL;                                         

ENTITY BCD_adder_vhd_sample_tst IS
PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	sampler : OUT sample_type
	);
END BCD_adder_vhd_sample_tst;

ARCHITECTURE sample_arch OF BCD_adder_vhd_sample_tst IS
SIGNAL tbo_int_sample_clk : sample_type := '-';
SIGNAL current_time : TIME := 0 ps;
BEGIN
t_prcs_sample : PROCESS ( A , B )
BEGIN
	IF (NOW > 0 ps) THEN
		IF (NOW > 0 ps) AND (NOW /= current_time) THEN
			IF (tbo_int_sample_clk = '-') THEN
				tbo_int_sample_clk <= '0';
			ELSE
				tbo_int_sample_clk <= NOT tbo_int_sample_clk ;
			END IF;
		END IF;
		current_time <= NOW;
	END IF;
END PROCESS t_prcs_sample;
sampler <= tbo_int_sample_clk;
END sample_arch;

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

LIBRARY STD;                                                            
USE STD.textio.ALL;                                                     

USE WORK.BCD_adder_vhd_tb_types.ALL;                                         

ENTITY BCD_adder_vhd_check_tst IS 
GENERIC (
	debug_tbench : BIT := '0'
);
PORT ( 
	final_sum : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	sampler : IN sample_type
);
END BCD_adder_vhd_check_tst;
ARCHITECTURE ovec_arch OF BCD_adder_vhd_check_tst IS
SIGNAL final_sum_expected,final_sum_expected_prev,final_sum_prev : STD_LOGIC_VECTOR(3 DOWNTO 0);

SIGNAL trigger : BIT := '0';
SIGNAL trigger_e : BIT := '0';
SIGNAL trigger_r : BIT := '0';
SIGNAL trigger_i : BIT := '0';
SIGNAL num_mismatches : mmvec := (OTHERS => 0);

BEGIN

-- Update history buffers  expected /o
t_prcs_update_o_expected_hist : PROCESS (trigger) 
BEGIN
	final_sum_expected_prev <= final_sum_expected;
END PROCESS t_prcs_update_o_expected_hist;


-- Update history buffers  real /o
t_prcs_update_o_real_hist : PROCESS (trigger) 
BEGIN
	final_sum_prev <= final_sum;
END PROCESS t_prcs_update_o_real_hist;


-- expected final_sum[3]
t_prcs_final_sum_3: PROCESS
BEGIN
	final_sum_expected(3) <= '0';
	WAIT FOR 16000 ps;
	FOR i IN 1 TO 3
	LOOP
		final_sum_expected(3) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(3) <= '0';
		WAIT FOR 26000 ps;
	END LOOP;
	final_sum_expected(3) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 16000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 2000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 16000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 6000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 16000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 6000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 4000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 16000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 2000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 3
	LOOP
		final_sum_expected(3) <= '0';
		WAIT FOR 16000 ps;
		final_sum_expected(3) <= '1';
		WAIT FOR 14000 ps;
	END LOOP;
	final_sum_expected(3) <= '0';
	WAIT FOR 16000 ps;
	FOR i IN 1 TO 5
	LOOP
		final_sum_expected(3) <= '1';
		WAIT FOR 16000 ps;
		final_sum_expected(3) <= '0';
		WAIT FOR 14000 ps;
	END LOOP;
	final_sum_expected(3) <= '1';
	WAIT FOR 16000 ps;
	FOR i IN 1 TO 4
	LOOP
		final_sum_expected(3) <= '0';
		WAIT FOR 26000 ps;
		final_sum_expected(3) <= '1';
		WAIT FOR 4000 ps;
	END LOOP;
	final_sum_expected(3) <= '0';
	WAIT FOR 16000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 2000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 16000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 6000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 16000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 6000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 4000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 16000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(3) <= '0';
	WAIT FOR 2000 ps;
	final_sum_expected(3) <= '1';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 3
	LOOP
		final_sum_expected(3) <= '0';
		WAIT FOR 16000 ps;
		final_sum_expected(3) <= '1';
		WAIT FOR 14000 ps;
	END LOOP;
	final_sum_expected(3) <= '0';
	WAIT FOR 16000 ps;
	FOR i IN 1 TO 5
	LOOP
		final_sum_expected(3) <= '1';
		WAIT FOR 16000 ps;
		final_sum_expected(3) <= '0';
		WAIT FOR 14000 ps;
	END LOOP;
	final_sum_expected(3) <= '1';
WAIT;
END PROCESS t_prcs_final_sum_3;
-- expected final_sum[2]
t_prcs_final_sum_2: PROCESS
BEGIN
	final_sum_expected(2) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 12000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 6000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 12000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 6000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '0';
		WAIT FOR 12000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '0';
		WAIT FOR 2000 ps;
	END LOOP;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 12000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 4000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 6000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 12000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 6000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(2) <= '0';
		WAIT FOR 12000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '0';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 2000 ps;
	END LOOP;
	final_sum_expected(2) <= '0';
	WAIT FOR 12000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 10000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 6000 ps;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(2) <= '0';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
	END LOOP;
	FOR i IN 1 TO 4
	LOOP
		final_sum_expected(2) <= '0';
		WAIT FOR 6000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '0';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
	END LOOP;
	final_sum_expected(2) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 6000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 2000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 12000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 6000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 12000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 6000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '0';
		WAIT FOR 12000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '0';
		WAIT FOR 2000 ps;
	END LOOP;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 12000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 4000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 6000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 12000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 6000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(2) <= '0';
		WAIT FOR 12000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '0';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 2000 ps;
	END LOOP;
	final_sum_expected(2) <= '0';
	WAIT FOR 12000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 10000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 6000 ps;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(2) <= '0';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
	END LOOP;
	FOR i IN 1 TO 4
	LOOP
		final_sum_expected(2) <= '0';
		WAIT FOR 6000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '0';
		WAIT FOR 8000 ps;
		final_sum_expected(2) <= '1';
		WAIT FOR 8000 ps;
	END LOOP;
	final_sum_expected(2) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(2) <= '1';
	WAIT FOR 6000 ps;
	final_sum_expected(2) <= '0';
WAIT;
END PROCESS t_prcs_final_sum_2;
-- expected final_sum[1]
t_prcs_final_sum_1: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
	END LOOP;
	final_sum_expected(1) <= '0';
	WAIT FOR 8000 ps;
	final_sum_expected(1) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(1) <= '0';
	WAIT FOR 6000 ps;
	final_sum_expected(1) <= '1';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 8000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 6000 ps;
	END LOOP;
	final_sum_expected(1) <= '0';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 8000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 6000 ps;
	END LOOP;
	final_sum_expected(1) <= '1';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '0';
		WAIT FOR 8000 ps;
		FOR i IN 1 TO 2
		LOOP
			final_sum_expected(1) <= '1';
			WAIT FOR 4000 ps;
			final_sum_expected(1) <= '0';
			WAIT FOR 4000 ps;
		END LOOP;
		final_sum_expected(1) <= '1';
		WAIT FOR 6000 ps;
	END LOOP;
	final_sum_expected(1) <= '0';
	WAIT FOR 8000 ps;
	FOR i IN 1 TO 2
	LOOP
		FOR i IN 1 TO 2
		LOOP
			final_sum_expected(1) <= '1';
			WAIT FOR 4000 ps;
			final_sum_expected(1) <= '0';
			WAIT FOR 4000 ps;
		END LOOP;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 10000 ps;
	END LOOP;
	FOR i IN 1 TO 3
	LOOP
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
	END LOOP;
	final_sum_expected(1) <= '1';
	WAIT FOR 2000 ps;
	FOR i IN 1 TO 4
	LOOP
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
	END LOOP;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '0';
		WAIT FOR 2000 ps;
		FOR i IN 1 TO 3
		LOOP
			final_sum_expected(1) <= '1';
			WAIT FOR 4000 ps;
			final_sum_expected(1) <= '0';
			WAIT FOR 4000 ps;
		END LOOP;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
	END LOOP;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 2000 ps;
		FOR i IN 1 TO 3
		LOOP
			final_sum_expected(1) <= '0';
			WAIT FOR 4000 ps;
			final_sum_expected(1) <= '1';
			WAIT FOR 4000 ps;
		END LOOP;
	END LOOP;
	final_sum_expected(1) <= '0';
	WAIT FOR 4000 ps;
	final_sum_expected(1) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(1) <= '0';
	WAIT FOR 2000 ps;
	FOR i IN 1 TO 3
	LOOP
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
	END LOOP;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 6000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 8000 ps;
	END LOOP;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 6000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 8000 ps;
	END LOOP;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 6000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 8000 ps;
	END LOOP;
	FOR i IN 1 TO 2
	LOOP
		FOR i IN 1 TO 2
		LOOP
			final_sum_expected(1) <= '1';
			WAIT FOR 4000 ps;
			final_sum_expected(1) <= '0';
			WAIT FOR 4000 ps;
		END LOOP;
		final_sum_expected(1) <= '1';
		WAIT FOR 6000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 8000 ps;
	END LOOP;
	FOR i IN 1 TO 2
	LOOP
		FOR i IN 1 TO 2
		LOOP
			final_sum_expected(1) <= '1';
			WAIT FOR 4000 ps;
			final_sum_expected(1) <= '0';
			WAIT FOR 4000 ps;
		END LOOP;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 10000 ps;
	END LOOP;
	FOR i IN 1 TO 3
	LOOP
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
	END LOOP;
	final_sum_expected(1) <= '1';
	WAIT FOR 2000 ps;
	FOR i IN 1 TO 4
	LOOP
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
	END LOOP;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '0';
		WAIT FOR 2000 ps;
		FOR i IN 1 TO 3
		LOOP
			final_sum_expected(1) <= '1';
			WAIT FOR 4000 ps;
			final_sum_expected(1) <= '0';
			WAIT FOR 4000 ps;
		END LOOP;
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
	END LOOP;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '0';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '1';
		WAIT FOR 2000 ps;
		FOR i IN 1 TO 3
		LOOP
			final_sum_expected(1) <= '0';
			WAIT FOR 4000 ps;
			final_sum_expected(1) <= '1';
			WAIT FOR 4000 ps;
		END LOOP;
	END LOOP;
	final_sum_expected(1) <= '0';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 2
	LOOP
		final_sum_expected(1) <= '1';
		WAIT FOR 4000 ps;
		final_sum_expected(1) <= '0';
		WAIT FOR 2000 ps;
	END LOOP;
WAIT;
END PROCESS t_prcs_final_sum_1;
-- expected final_sum[0]
t_prcs_final_sum_0: PROCESS
BEGIN
	FOR i IN 1 TO 7
	LOOP
		final_sum_expected(0) <= '0';
		WAIT FOR 2000 ps;
		final_sum_expected(0) <= '1';
		WAIT FOR 2000 ps;
	END LOOP;
	final_sum_expected(0) <= '0';
	WAIT FOR 2000 ps;
	FOR i IN 1 TO 14
	LOOP
		final_sum_expected(0) <= '1';
		WAIT FOR 4000 ps;
		FOR i IN 1 TO 7
		LOOP
			final_sum_expected(0) <= '0';
			WAIT FOR 2000 ps;
			final_sum_expected(0) <= '1';
			WAIT FOR 2000 ps;
		END LOOP;
		final_sum_expected(0) <= '0';
		WAIT FOR 4000 ps;
		FOR i IN 1 TO 7
		LOOP
			final_sum_expected(0) <= '1';
			WAIT FOR 2000 ps;
			final_sum_expected(0) <= '0';
			WAIT FOR 2000 ps;
		END LOOP;
	END LOOP;
	final_sum_expected(0) <= '1';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 7
	LOOP
		final_sum_expected(0) <= '0';
		WAIT FOR 2000 ps;
		final_sum_expected(0) <= '1';
		WAIT FOR 2000 ps;
	END LOOP;
	final_sum_expected(0) <= '0';
	WAIT FOR 4000 ps;
	FOR i IN 1 TO 7
	LOOP
		final_sum_expected(0) <= '1';
		WAIT FOR 2000 ps;
		final_sum_expected(0) <= '0';
		WAIT FOR 2000 ps;
	END LOOP;
	final_sum_expected(0) <= '1';
	WAIT FOR 4000 ps;
	final_sum_expected(0) <= '0';
	WAIT FOR 2000 ps;
	final_sum_expected(0) <= '1';
	WAIT FOR 2000 ps;
	final_sum_expected(0) <= '0';
WAIT;
END PROCESS t_prcs_final_sum_0;

-- Set trigger on real/expected o/ pattern changes                        

t_prcs_trigger_e : PROCESS(final_sum_expected)
BEGIN
	trigger_e <= NOT trigger_e;
END PROCESS t_prcs_trigger_e;

t_prcs_trigger_r : PROCESS(final_sum)
BEGIN
	trigger_r <= NOT trigger_r;
END PROCESS t_prcs_trigger_r;


t_prcs_selfcheck : PROCESS
VARIABLE i : INTEGER := 1;
VARIABLE txt : LINE;

VARIABLE last_final_sum_exp : STD_LOGIC_VECTOR(3 DOWNTO 0) := "UUUU";

VARIABLE on_first_change : trackvec := "1";
BEGIN

WAIT UNTIL (sampler'LAST_VALUE = '1'OR sampler'LAST_VALUE = '0')
	AND sampler'EVENT;
IF (debug_tbench = '1') THEN
	write(txt,string'("Scanning pattern "));
	write(txt,i);
	writeline(output,txt);
	write(txt,string'("| expected "));write(txt,final_sum_name);write(txt,string'(" = "));write(txt,final_sum_expected_prev);
	writeline(output,txt);
	write(txt,string'("| real "));write(txt,final_sum_name);write(txt,string'(" = "));write(txt,final_sum_prev);
	writeline(output,txt);
	i := i + 1;
END IF;
IF ( final_sum_expected_prev /= "XXXX" ) AND (final_sum_expected_prev /= "UUUU" ) AND (final_sum_prev /= final_sum_expected_prev) AND (
	(final_sum_expected_prev /= last_final_sum_exp) OR
	(on_first_change(1) = '1')
		) THEN
	throw_error("final_sum",final_sum_expected_prev,final_sum_prev);
	num_mismatches(0) <= num_mismatches(0) + 1;
	on_first_change(1) := '0';
	last_final_sum_exp := final_sum_expected_prev;
END IF;
    trigger_i <= NOT trigger_i;
END PROCESS t_prcs_selfcheck;


t_prcs_trigger_res : PROCESS(trigger_e,trigger_i,trigger_r)
BEGIN
	trigger <= trigger_i XOR trigger_e XOR trigger_r;
END PROCESS t_prcs_trigger_res;

t_prcs_endsim : PROCESS
VARIABLE txt : LINE;
VARIABLE total_mismatches : INTEGER := 0;
BEGIN
WAIT FOR 1000000 ps;
total_mismatches := num_mismatches(0);
IF (total_mismatches = 0) THEN                                              
        write(txt,string'("Simulation passed !"));                        
        writeline(output,txt);                                              
ELSE                                                                        
        write(txt,total_mismatches);                                        
        write(txt,string'(" mismatched vectors : Simulation failed !"));  
        writeline(output,txt);                                              
END IF;                                                                     
WAIT;
END PROCESS t_prcs_endsim;

END ovec_arch;

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

LIBRARY STD;                                                            
USE STD.textio.ALL;                                                     

USE WORK.BCD_adder_vhd_tb_types.ALL;                                         

ENTITY BCD_adder_vhd_vec_tst IS
END BCD_adder_vhd_vec_tst;
ARCHITECTURE BCD_adder_arch OF BCD_adder_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL final_sum : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL sampler : sample_type;

COMPONENT BCD_adder
	PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	final_sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
COMPONENT BCD_adder_vhd_check_tst
PORT ( 
	final_sum : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	sampler : IN sample_type
);
END COMPONENT;
COMPONENT BCD_adder_vhd_sample_tst
PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	sampler : OUT sample_type
	);
END COMPONENT;
BEGIN
	i1 : BCD_adder
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	final_sum => final_sum
	);
-- A[3]
t_prcs_A_3: PROCESS
BEGIN
	A(3) <= '0';
	WAIT FOR 256000 ps;
	A(3) <= '1';
	WAIT FOR 256000 ps;
	A(3) <= '0';
	WAIT FOR 256000 ps;
	A(3) <= '1';
WAIT;
END PROCESS t_prcs_A_3;
-- A[2]
t_prcs_A_2: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		A(2) <= '0';
		WAIT FOR 128000 ps;
		A(2) <= '1';
		WAIT FOR 128000 ps;
	END LOOP;
	A(2) <= '0';
	WAIT FOR 128000 ps;
	A(2) <= '1';
WAIT;
END PROCESS t_prcs_A_2;
-- A[1]
t_prcs_A_1: PROCESS
BEGIN
	FOR i IN 1 TO 7
	LOOP
		A(1) <= '0';
		WAIT FOR 64000 ps;
		A(1) <= '1';
		WAIT FOR 64000 ps;
	END LOOP;
	A(1) <= '0';
	WAIT FOR 64000 ps;
	A(1) <= '1';
WAIT;
END PROCESS t_prcs_A_1;
-- A[0]
t_prcs_A_0: PROCESS
BEGIN
	FOR i IN 1 TO 15
	LOOP
		A(0) <= '0';
		WAIT FOR 32000 ps;
		A(0) <= '1';
		WAIT FOR 32000 ps;
	END LOOP;
	A(0) <= '0';
	WAIT FOR 32000 ps;
	A(0) <= '1';
WAIT;
END PROCESS t_prcs_A_0;
-- B[3]
t_prcs_B_3: PROCESS
BEGIN
	FOR i IN 1 TO 31
	LOOP
		B(3) <= '0';
		WAIT FOR 16000 ps;
		B(3) <= '1';
		WAIT FOR 16000 ps;
	END LOOP;
	B(3) <= '0';
WAIT;
END PROCESS t_prcs_B_3;
-- B[2]
t_prcs_B_2: PROCESS
BEGIN
	FOR i IN 1 TO 62
	LOOP
		B(2) <= '0';
		WAIT FOR 8000 ps;
		B(2) <= '1';
		WAIT FOR 8000 ps;
	END LOOP;
	B(2) <= '0';
WAIT;
END PROCESS t_prcs_B_2;
-- B[1]
t_prcs_B_1: PROCESS
BEGIN
LOOP
	B(1) <= '0';
	WAIT FOR 4000 ps;
	B(1) <= '1';
	WAIT FOR 4000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_B_1;
-- B[0]
t_prcs_B_0: PROCESS
BEGIN
LOOP
	B(0) <= '0';
	WAIT FOR 2000 ps;
	B(0) <= '1';
	WAIT FOR 2000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_B_0;
tb_sample : BCD_adder_vhd_sample_tst
PORT MAP (
	A => A,
	B => B,
	sampler => sampler
	);

tb_out : BCD_adder_vhd_check_tst
PORT MAP (
	final_sum => final_sum,
	sampler => sampler
	);
END BCD_adder_arch;
