architecture structural of GenBitAdder is
	
	component FullAdder is
		port(
			Ope1xDI, Ope2xDI, CIxDI	: in std_logic;
			SumxDO, COxDO			: out std_logic
		);
	end component FullAdder;
	
	signal CCxD	: std_logic_vector(VECTOR_WIDTH - 1 downto 0);
	
begin
	
	AdderGen : for stage in 0 to VECTOR_WIDTH - 1 generate
		LSB: if stage = 0 generate
			Adder : FullAdder port map (
				Ope1xDI(stage), Ope2xDI(stage), '0', SumxDO(stage), CCxD(stage)			
			);
		end generate LSB;
		UPR: if stage > 0 generate
			Adder : FullAdder port map (
				Ope1xDI(stage), Ope2xDI(stage), CCxD(stage - 1), SumxDO(stage), CCxD(stage)	
			);
		end generate UPR;
	end generate AdderGen;
	
	COxDO	<=	CCxD(VECTOR_WIDTH - 1);
	
end structural;
