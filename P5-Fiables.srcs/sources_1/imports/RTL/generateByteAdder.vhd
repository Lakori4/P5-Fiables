library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity genbyteAdder is
	port ( 	A		: in 	std_logic_vector (7 downto 0);
			B		: in 	std_logic_vector (7 downto 0);
			S		: out 	std_logic_vector (7 downto 0);
			C_out	: out 	std_logic
	);
end genbyteAdder;

architecture Behavioural of genbyteAdder is
	signal C : std_logic_vector (7 downto 0);
	component halfAdder is
		port ( 	A		: in 	std_logic;
				B		: in    std_logic;
				S		: out   std_logic;
				C_out	: out	std_logic
			);
	end component;
	component fullAdder is 
		port( 	A		: in 	std_logic;
				B		: in    std_logic;
				C_in 	: in 	std_logic;	
				S		: out   std_logic;
				C_out	: out	std_logic
		);
	end component;
	
begin
	GEN_ADD: for I in 0 to 7 generate

    LOWER_BIT: if I=0 generate
      U0: halfAdder port map
         (A(I),B(I),S(I),C(I));
    end generate LOWER_BIT;

    UPPER_BITS: if I>0 generate
      UX: fullAdder port map
         (A(I),B(I),C(I-1),S(I),C(I));
    end generate UPPER_BITS;

  end generate GEN_ADD;

  C_out <= C(7);
end	Behavioural;
	