ARCHITECTURE noPlatformSpecific OF trafficLight IS

   TYPE STATE_TYPE IS (UNDEFINED, RED, ORANGE, GREEN, RED_ORANGE);

   SIGNAL lightStatexP : STATE_TYPE;
   SIGNAL lightStatexN : STATE_TYPE;

BEGIN

   updateLogic : PROCESS(lightStatexP , BtnxDI)
   BEGIN
      CASE (lightStatexP) IS
         WHEN GREEN => IF (BtnxDI = '1') THEN lightStatexN <= ORANGE;
                                         ELSE lightStatexN <= GREEN;
                       END IF;
         WHEN ORANGE     => lightStatexN <= RED;
         WHEN RED        => lightStatexN <= RED_ORANGE;
         WHEN RED_ORANGE => lightStatexN <= GREEN;
         WHEN OTHERS     => lightStatexN <= UNDEFINED;
      END CASE;
   END PROCESS updateLogic;

   stateFlipFlops : PROCESS(ClkxCI , RstxRI , lightStatexN)
   BEGIN
      IF rising_edge(ClkxCI) THEN
         IF (RstxRI = '1') THEN lightStatexP <= GREEN;
                           ELSE lightStatexP <= lightStatexN;
         END IF;
      END IF;
   END PROCESS stateFlipFlops;

   -- Here the output logic is defined in implicit processes
   MainRedxDO <= '1'    WHEN lightStatexP = RED OR
                             lightStatexP = RED_ORANGE ELSE '0';

   MainGreenxDO <= '1'  WHEN lightStatexP = GREEN ELSE '0';

   MainOrangexDO <= '1' WHEN lightStatexP = ORANGE OR
                             lightStatexP = RED_ORANGE ELSE '0';

END noPlatformSpecific;
