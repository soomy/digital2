architecture dataFlow of FullAdder is
	
begin
	
	SumxDO	<=	(not Ope1xDI and (Ope2xDI xor CIxDI)) or (Ope1xDI and (Ope2xDI xnor CIxDI));
	COxDO	<=	(CIxDI and (Ope1xDI or Ope2xDI)) or (Ope1xDI and Ope2xDI);
  
end dataFlow;
