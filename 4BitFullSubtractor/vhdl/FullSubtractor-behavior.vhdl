architecture dataFlow of FullSubtractor is
	
begin
	
	DifxDO	<=	(MinxDI xor SubxDI) xor BIxDI;
	BOxDO	<=	not MinxDI and (SubxDI xor BIxDI) or (SubxDI and BIxDI);
  
end dataFlow;
