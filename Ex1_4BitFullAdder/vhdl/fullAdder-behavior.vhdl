architecture dataFlow of fullAdder is

  
  
begin

  SumxDO        <=      Ope1xDI and (Ope2xDI xor CIxDX) or
                        Ope1xDI and (Ope2xDI nor CIxDX);
  COxDO         <=      CIxDX   and (Ope1xDI or Ope2xDI) or
                        Ope1xDI and Ope2xDI;
  
end dataFlow;
