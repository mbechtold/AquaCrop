unit interface_simul;

interface

uses Global, interface_global, TempProcessing, interface_tempprocessing;

function GetCDCadjustedNoStressNew(
            constref CCx, CDC, CCxAdjusted): double;
     external 'aquacrop' name '__ac_simul_MOD_getcdcadjustednostressnew';

procedure AdjustpLeafToETo(
            constref EToMean : double;
            VAR pLeafULAct : double ;
            VAR pLeafLLAct : double);
     external 'aquacrop' name '__ac_simul_MOD_adjustpleaftoeto';


procedure DeterminePotentialBiomass(
            constref VirtualTimeCC : integer;
            constref cumGDDadjCC : double;
            constref CO2i : double;
            constref GDDayi : double;
            VAR CCxWitheredTpotNoS : double;
            VAR BiomassUnlim : double);
     external 'aquacrop' name '__ac_simul_MOD_determinepotentialbiomass';


procedure AdjustpSenescenceToETo(
           constref EToMean : double;
           constref TimeSenescence : double;
           constref WithBeta : BOOLEAN;
           VAR pSenAct : double);
    external 'aquacrop' name '__ac_interface_simul_MOD_adjustpsenescencetoeto_wrap';

procedure CheckGermination();
    external 'aquacrop' name '__ac_simul_MOD_checkgermination'; 

procedure calculate_transpiration(
            constref Tpot : double;
            VAR Tact : double;
            constref Coeffb0Salt : double;
            constref Coeffb1Salt : double; 
            constref Coeffb2Salt : double);
    external 'aquacrop' name '__ac_simul_MOD_calculate_transpiration';

procedure surface_transpiration(
            constref Coeffb0Salt : double;
            constref Coeffb1Salt: double; 
            constref Coeffb2Salt: double);
    external 'aquacrop' name '__ac_simul_MOD_surface_transpiration';


//-----------------------------------------------------------------------------
// BUDGET_module
//-----------------------------------------------------------------------------


function calculate_delta_theta(
             constref theta, thetaAdjFC : double;
             constref NrLayer : integer): double;
     external 'aquacrop' name '__ac_simul_MOD_calculate_delta_theta';

function calculate_theta(
             constref delta_theta, thetaAdjFC : double;
             constref NrLayer : integer): double;
     external 'aquacrop' name '__ac_simul_MOD_calculate_theta';

procedure calculate_drainage();
     external 'aquacrop' name '__ac_simul_MOD_calculate_drainage';

procedure calculate_runoff(constref MaxDepth : double );
     external 'aquacrop' name '__ac_simul_MOD_calculate_runoff';

procedure Calculate_irrigation(var SubDrain : double;
                               var TargetTimeVal, TargetDepthVal : integer);
    external 'aquacrop' name '__ac_simul_MOD_calculate_irrigation'; 

procedure CalculateEffectiveRainfall(var SubDrain : double);
    external 'aquacrop' name '__ac_simul_MOD_calculateeffectiverainfall';

procedure calculate_CapillaryRise(VAR CRwater,CRsalt : double);
    external 'aquacrop' name '__ac_simul_MOD_calculate_capillaryrise';

procedure calculate_saltcontent(
                constref InfiltratedRain, InfiltratedIrrigation : double;
                constref InfiltratedStorage, SubDrain : double;
                constref dayi : integer);
    external 'aquacrop' name '__ac_simul_MOD_calculate_saltcontent';

procedure calculate_infiltration(
                VAR InfiltratedRain,InfiltratedIrrigation : double;
                VAR InfiltratedStorage, SubDrain : double);
    external 'aquacrop' name '__ac_simul_MOD_calculate_infiltration';

procedure calculate_Extra_runoff(VAR InfiltratedRain, InfiltratedIrrigation: double;
                                 VAR InfiltratedStorage, SubDrain : double);
    external 'aquacrop' name '__ac_simul_MOD_calculate_extra_runoff';

procedure calculate_surfacestorage(VAR InfiltratedRain,InfiltratedIrrigation: double;
                                   VAR InfiltratedStorage,ECinfilt : double;
                                   constref SubDrain : double;
                                   constref dayi : integer);
    external 'aquacrop' name '__ac_simul_MOD_calculate_surfacestorage';

procedure EffectSoilFertilitySalinityStress(
                        VAR StressSFadjNew : Shortint;
                        constref Coeffb0Salt, Coeffb1Salt, Coeffb2Salt : double;
                        constref NrDayGrow : integer;
                        constref StressTotSaltPrev : double;
                        constref VirtualTimeCC : integer);
    external 'aquacrop' name '__ac_simul_MOD_effectsoilfertilitysalinitystress';

procedure PrepareStage1();
    external 'aquacrop' name '__ac_simul_MOD_preparestage1';

procedure AdjustEpotMulchWettedSurface(
                        constref dayi: integer;
                        constref EpotTot: double;
                        VAR Epot : double;
                        VAR EvapWCsurface : double);
    external 'aquacrop' name '__ac_simul_MOD_adjustepotmulchwettedsurface';

//-----------------------------------------------------------------------------
// end BUDGET_module
//-----------------------------------------------------------------------------


implementation


initialization


end.

