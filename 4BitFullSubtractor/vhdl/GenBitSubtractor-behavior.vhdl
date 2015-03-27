architecture structural of GenBitSubtractor is
	
	component FullSubtractor is
		port(
			MinxDI, SubxDI, BIxDI	: in std_logic;
			DifxDO, BOxDO			: out std_logic
		);
	end component FullSubtractor;
	
	signal BCxD	: std_logic_vector(VECTOR_WIDTH - 1 downto 0);
	
begin
	
	SubtractorGen : for stage in 0 to VECTOR_WIDTH - 1 generate
		LSB: if stage = 0 generate
			Subtractor : FullSubtractor port map (
				MinxDI(stage), SubxDI(stage), '0', DifxDO(stage), BCxD(stage)			
			);
		end generate LSB;
		UPR: if stage > 0 generate
			Subtractor : FullSubtractor port map (
				MinxDI(stage), SubxDI(stage), BCxD(stage - 1), DifxDO(stage), BCxD(stage)	
			);
		end generate UPR;
	end generate SubtractorGen;
	
	BOxDO	<=	BCxD(VECTOR_WIDTH - 1);
	
end structural;
