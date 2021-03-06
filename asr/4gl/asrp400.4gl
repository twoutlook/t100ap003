#該程式未解開Section, 採用最新樣板產出!
{<section id="asrp400.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0006(2014-06-30 16:30:27), PR版次:0006(2016-12-15 14:25:34)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000125
#+ Filename...: asrp400
#+ Description: 重覆性生產委外批次作業
#+ Creator....: 00378(2014-04-30 00:00:00)
#+ Modifier...: 00378 -SD/PR- 01996
 
{</section>}
 
{<section id="asrp400.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#Modify.........: No.160330-00012#1 16/04/01 By catmoon 將CALL cl_progress_no_window_ing(參數)參數有中文的情形改由變數帶入
#160318-00025#52 2016/04/27 By 07673   將重複內容的錯誤訊息置換為公用錯誤訊息
#160613-00007#1  2016/06/13 By lixiang 修正调用s_asrp400_def_cursor没有正确接受回传值的问题
#161124-00048#10  2016/12/13 By xujing     整批调整系统RECORD LIKE xxxx_t.* 星号写法
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_schedule
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS "../../cfg/top_schedule.inc"
GLOBALS
   DEFINE gwin_curr2  ui.Window
   DEFINE gfrm_curr2  ui.Form
   DEFINE gi_hiden_asign       LIKE type_t.num5
   DEFINE gi_hiden_exec        LIKE type_t.num5
   DEFINE gi_hiden_spec        LIKE type_t.num5
   DEFINE gi_hiden_exec_end    LIKE type_t.num5
   DEFINE g_chk_jobid          LIKE type_t.num5
END GLOBALS
 
PRIVATE TYPE type_parameter RECORD
   #add-point:自定背景執行須傳遞的參數(Module Variable) name="global.parameter"
        doctype          LIKE ooba_t.ooba002,
        docdate          LIKE pmdl_t.pmdldocdt,
        sraa001          LIKE sraa_t.sraa001,
        combine          LIKE type_t.chr1,
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       doctype LIKE type_t.chr5, 
   docdate LIKE type_t.dat, 
   sraa001 LIKE type_t.chr10, 
   combine LIKE type_t.chr1, 
   srab004 LIKE type_t.chr500, 
   srab005 LIKE type_t.chr30, 
   srab006 LIKE type_t.chr500, 
   srab009 LIKE type_t.dat,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
TYPE type_g_srab_d     RECORD
                       sel            LIKE type_t.chr1, 
                       srab0041       LIKE srab_t.srab004, 
                       srab0041_desc1 LIKE type_t.chr500, 
                       srab0041_desc2 LIKE type_t.chr500,   
                       srab0051       LIKE srab_t.srab005, 
                       srab0061       LIKE srab_t.srab006, 
                       srac008        LIKE srac_t.srac008,
                       srac008_desc   LIKE type_t.chr500,                        
                       srac009        LIKE srac_t.srac009,
                       srab0091       LIKE srab_t.srab009,
                       srac027        LIKE srac_t.srac027,
                       qty1           LIKE srab_t.srab010,
                       qty2           LIKE srab_t.srab010,
                       carry_qty      LIKE srab_t.srab010,
                       pmdl004        LIKE pmdl_t.pmdl004,
                       pmdl004_desc   LIKE type_t.chr500,
                       pmdl017        LIKE pmdl_t.pmdl017,
                       pmdl017_desc   LIKE type_t.chr500,
                       pmdl015        LIKE pmdl_t.pmdl015,
                       pmdl015_desc   LIKE type_t.chr500,
                       pmdl011        LIKE pmdl_t.pmdl011,
                       pmdl011_desc   LIKE type_t.chr500,
                       price          LIKE pmdn_t.pmdn015,
                       srab000        LIKE srab_t.srab000
                       END RECORD
DEFINE g_srab_d        DYNAMIC ARRAY OF type_g_srab_d
DEFINE g_srab_d_t      type_g_srab_d
DEFINE g_arr1          DYNAMIC ARRAY OF type_g_srab_d    
DEFINE g_param         type_parameter
DEFINE g_rec_b1        LIKE type_t.num5
DEFINE l_ac            LIKE type_t.num5
DEFINE g_press         LIKE type_t.num5
DEFINE g_pmal          DYNAMIC ARRAY OF RECORD
                       pmdl004       LIKE pmdl_t.pmdl004,
                       pmal002       LIKE pmal_t.pmal002
                       END RECORD
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="asrp400.main" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
   DEFINE l_success  LIKE type_t.num5  #160613-00007#1
   #end add-point 
  
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:初始化前定義 name="main.before_ap_init"
   
   #end add-point
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("asr","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js name="main.background"
   LET g_param.doctype  = g_argv[1]
   LET g_param.docdate  = g_argv[2]
   LET g_param.sraa001  = g_argv[3]
   LET g_param.combine  = g_argv[4]
   LET g_param.wc       = g_argv[5]
   LET g_bgjob          = g_argv[6]
   IF cl_null(g_bgjob) THEN LET g_bgjob = 'N' END IF
   LET g_press = FALSE
   
   #CALL s_asrp400_def_cursor()  #160613-00007#1
   CALL s_asrp400_def_cursor() RETURNING l_success  #160613-00007#1
   #end add-point
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
      CALL asrp400_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_asrp400 WITH FORM cl_ap_formpath("asr",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL asrp400_init()
 
      #進入選單 Menu (="N")
      CALL asrp400_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_asrp400
   END IF
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="asrp400.init" >}
#+ 初始化作業
PRIVATE FUNCTION asrp400_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   DEFINE lwin_curr      ui.Window
   DEFINE lfrm_curr      ui.Form
   DEFINE ls_path        STRING

   #end add-point
 
   LET g_error_show = 1
   LET gwin_curr2 = ui.Window.getCurrent()
   LET gfrm_curr2 = gwin_curr2.getForm()
   CALL cl_schedule_import_4fd()
   CALL cl_set_combo_scc("gzpa003","75")
   IF cl_get_para(g_enterprise,"","E-SYS-0005") = "N" THEN
       CALL cl_set_comp_visible("scheduling_page,history_page",FALSE)
   END IF 
   #add-point:畫面資料初始化 name="init.init"

#   LET lwin_curr = ui.Window.getCurrent()
#   LET lfrm_curr = lwin_curr.getForm()
#   LET ls_path = os.Path.join(os.Path.join(FGL_GETENV("ERP"),"cfg"),"4tb")
#   LET ls_path = os.Path.join(ls_path,"toolbar_q.4tb")
#   CALL lfrm_curr.loadToolBar(ls_path)

   LET g_master.docdate  = cl_get_today()
   LET g_master.combine  = 'Y'
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asrp400.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION asrp400_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"
   DEFINE l_srab_t     type_g_srab_d
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_sql        STRING
   DEFINE l_sql1       STRING
   DEFINE l_ooef004    LIKE ooef_t.ooef004
   DEFINE l_i          LIKE type_t.num10
   DEFINE lc_master    type_master   
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.doctype,g_master.docdate,g_master.sraa001,g_master.combine 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               LET lc_master.* = g_master.*
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD doctype
            #add-point:BEFORE FIELD doctype name="input.b.doctype"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD doctype
            
            #add-point:AFTER FIELD doctype name="input.a.doctype"
               IF cl_null(g_master.doctype) THEN
                  NEXT FIELD doctype
               END IF
               CALL asrp400_chk_doc_type(g_master.doctype)
                    RETURNING l_success
               IF NOT l_success THEN
                  LET g_master.doctype = lc_master.doctype      
                  NEXT FIELD doctype
               END IF
               LET lc_master.doctype = g_master.doctype
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE doctype
            #add-point:ON CHANGE doctype name="input.g.doctype"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD docdate
            #add-point:BEFORE FIELD docdate name="input.b.docdate"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD docdate
            
            #add-point:AFTER FIELD docdate name="input.a.docdate"
               IF cl_null(g_master.docdate) THEN
                  LET g_master.docdate = lc_master.docdate
                  NEXT FIELD docdate
               END IF
               LET lc_master.docdate = g_master.docdate
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE docdate
            #add-point:ON CHANGE docdate name="input.g.docdate"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraa001
            
            #add-point:AFTER FIELD sraa001 name="input.a.sraa001"
               IF cl_null(g_master.sraa001) THEN
                  NEXT FIELD sraa001
               END IF
               CALL asrp400_chk_sraa001()
                    RETURNING l_success
               IF NOT l_success THEN
                  LET g_master.sraa001 = lc_master.sraa001 
                  NEXT FIELD sraa001
               END IF
               LET lc_master.sraa001 = g_master.sraa001  


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraa001
            #add-point:BEFORE FIELD sraa001 name="input.b.sraa001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sraa001
            #add-point:ON CHANGE sraa001 name="input.g.sraa001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD combine
            #add-point:BEFORE FIELD combine name="input.b.combine"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD combine
            
            #add-point:AFTER FIELD combine name="input.a.combine"
               IF g_master.combine NOT MATCHES '[YN]' THEN
                  NEXT FIELD combine
               END IF    
               LET lc_master.combine = g_master.combine  
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE combine
            #add-point:ON CHANGE combine name="input.g.combine"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.doctype
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD doctype
            #add-point:ON ACTION controlp INFIELD doctype name="input.c.doctype"
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_master.doctype          
               #給予arg
               SELECT ooef004 INTO l_ooef004
                 FROM ooef_t
                WHERE ooefent = g_enterprise
                  AND ooef001 = g_site
               LET g_qryparam.arg1 = l_ooef004
               LET g_qryparam.arg2 = "apmt500"
               CALL q_ooba002_1()                               
               LET g_master.doctype = g_qryparam.return1      
               DISPLAY g_master.doctype TO doctype           
               NEXT FIELD doctype
            #END add-point
 
 
         #Ctrlp:input.c.docdate
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD docdate
            #add-point:ON ACTION controlp INFIELD docdate name="input.c.docdate"
            
            #END add-point
 
 
         #Ctrlp:input.c.sraa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraa001
            #add-point:ON ACTION controlp INFIELD sraa001 name="input.c.sraa001"
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_master.sraa001
               CALL q_srza001()
               LET g_master.sraa001 = g_qryparam.return1
               DISPLAY g_master.sraa001 TO sraa001
               NEXT FIELD sraa001

            #END add-point
 
 
         #Ctrlp:input.c.combine
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD combine
            #add-point:ON ACTION controlp INFIELD combine name="input.c.combine"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON srab004,srab005,srab006,srab009
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.srab004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab004
            #add-point:ON ACTION controlp INFIELD srab004 name="construct.c.srab004"
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_bmaa001_1()                     
               DISPLAY g_qryparam.return1 TO srab004  
               NEXT FIELD srab004    
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab004
            #add-point:BEFORE FIELD srab004 name="construct.b.srab004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab004
            
            #add-point:AFTER FIELD srab004 name="construct.a.srab004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.srab005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab005
            #add-point:ON ACTION controlp INFIELD srab005 name="construct.c.srab005"
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_bmaa002()                    
               DISPLAY g_qryparam.return1 TO srab005  
               NEXT FIELD srab005  


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab005
            #add-point:BEFORE FIELD srab005 name="construct.b.srab005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab005
            
            #add-point:AFTER FIELD srab005 name="construct.a.srab005"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab006
            #add-point:BEFORE FIELD srab006 name="construct.b.srab006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab006
            
            #add-point:AFTER FIELD srab006 name="construct.a.srab006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.srab006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab006
            #add-point:ON ACTION controlp INFIELD srab006 name="construct.c.srab006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab009
            #add-point:BEFORE FIELD srab009 name="construct.b.srab009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab009
            
            #add-point:AFTER FIELD srab009 name="construct.a.srab009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.srab009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab009
            #add-point:ON ACTION controlp INFIELD srab009 name="construct.c.srab009"
            
            #END add-point
 
 
 
            
            #add-point:其他管控 name="cs.other"
 
            #end add-point
            
         END CONSTRUCT
 
 
 
      
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
         
         #end add-point
         #add-point:ui_dialog段input name="ui_dialog.more_input"
      
         INPUT ARRAY g_srab_d FROM s_detail1.*
             ATTRIBUTE(COUNT = g_rec_b1,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                     INSERT ROW = FALSE,
                     DELETE ROW = FALSE,
                     APPEND ROW = FALSE)

            BEFORE ROW
               LET l_ac = ARR_CURR()
               IF g_srab_d[l_ac].sel = 'Y' THEN
                  CALL cl_set_comp_entry('carry_qty,pmdl004,pmdl017,pmdl015,pmdl011',TRUE)
               ELSE
                  CALL cl_set_comp_entry('carry_qty,pmdl004,pmdl017,pmdl015,pmdl011',FALSE)
               END IF
               LET l_srab_t.* = g_srab_d[l_ac].*               

            BEFORE FIELD sel
               CALL cl_set_comp_entry('carry_qty,pmdl004,pmdl017,pmdl015,pmdl011',TRUE)
               CALL cl_set_comp_required('carry_qty,pmdl004,pmdl017,pmdl015,pmdl011',FALSE)

            AFTER FIELD sel
               IF g_srab_d[l_ac].sel NOT MATCHES '[YN]' THEN
                  NEXT FIELD sel
               END IF
               IF g_srab_d[l_ac].sel = 'Y' THEN
                  CALL cl_set_comp_required('carry_qty,pmdl004,pmdl017,pmdl015,pmdl011',TRUE)
                  #本次委外数
                  IF cl_null(g_srab_d[l_ac].carry_qty) OR g_srab_d[l_ac].carry_qty = 0 THEN
                     LET g_srab_d[l_ac].carry_qty = l_srab_t.carry_qty
                  END IF
                  #委外厂商
                  IF cl_null(g_srab_d[l_ac].pmdl004) THEN
                     LET g_srab_d[l_ac].pmdl004 = l_srab_t.pmdl004
                     CALL s_desc_get_trading_partner_abbr_desc(g_srab_d[l_ac].pmdl004)
                          RETURNING g_srab_d[l_ac].pmdl004_desc
                  END IF
                  #取价方式
                  IF cl_null(g_srab_d[l_ac].pmdl017) THEN
                     LET g_srab_d[l_ac].pmdl017 = l_srab_t.pmdl017
                     CALL s_desc_get_price_type_desc(g_srab_d[l_ac].pmdl017)
                          RETURNING g_srab_d[l_ac].pmdl017_desc
                  END IF
                  #币种
                  IF cl_null(g_srab_d[l_ac].pmdl015) THEN
                     LET g_srab_d[l_ac].pmdl015 = l_srab_t.pmdl015
                     CALL s_desc_get_currency_desc(g_srab_d[l_ac].pmdl015)
                          RETURNING g_srab_d[l_ac].pmdl015_desc
                  END IF                       
                  #税别
                  IF cl_null(g_srab_d[l_ac].pmdl011) THEN
                     LET g_srab_d[l_ac].pmdl011 = l_srab_t.pmdl011
                     CALL s_desc_get_tax_desc1(g_site,g_srab_d[l_ac].pmdl011)
                          RETURNING g_srab_d[l_ac].pmdl011_desc
                  END IF                                            
               ELSE
                  CALL cl_set_comp_entry('carry_qty,pmdl004,pmdl017,pmdl015,pmdl011',FALSE)
               END IF

            AFTER FIELD carry_qty
               IF NOT cl_null(g_srab_d[l_ac].carry_qty) THEN
                  CALL s_asrp400_chk_carry_qty(g_srab_d[l_ac].srab000,g_master.sraa001,
                                               g_srab_d[l_ac].srab0091,g_srab_d[l_ac].srab0041,
                                               g_srab_d[l_ac].srab0051,g_srab_d[l_ac].srab0061,
                                               g_srab_d[l_ac].srac008,g_srab_d[l_ac].srac009,
                                               g_srab_d[l_ac].srac027,g_srab_d[l_ac].carry_qty)
                       RETURNING l_success
                  IF NOT l_success THEN
                     LET g_srab_d[l_ac].carry_qty = l_srab_t.carry_qty
                     NEXT FIELD carry_qty
                  END IF
               END IF

            AFTER FIELD pmdl004
               IF NOT cl_null(g_srab_d[l_ac].pmdl004) THEN
                  IF cl_null(l_srab_t.pmdl004) OR l_srab_t.pmdl004 <> g_srab_d[l_ac].pmdl004 THEN
                     CALL s_asrp400_chk_pmdl004(g_srab_d[l_ac].srab0041,g_srab_d[l_ac].srab0091,
                                                g_srab_d[l_ac].pmdl004,g_master.doctype)
                          RETURNING l_success
                     IF NOT l_success THEN
                        LET g_srab_d[l_ac].pmdl004 = l_srab_t.pmdl004
                        CALL s_desc_get_trading_partner_abbr_desc(g_srab_d[l_ac].pmdl004)
                             RETURNING g_srab_d[l_ac].pmdl004_desc
                        NEXT FIELD pmdl004
                     END IF
                     CALL asrp400_pmdl004_reference(l_ac)
                  END IF
                  CALL s_desc_get_trading_partner_abbr_desc(g_srab_d[l_ac].pmdl004)
                       RETURNING g_srab_d[l_ac].pmdl004_desc
               ELSE
                  LET g_srab_d[l_ac].pmdl004_desc = NULL
               END IF

            AFTER FIELD pmdl017
               IF NOT cl_null(g_srab_d[l_ac].pmdl017) THEN
                  IF cl_null(l_srab_t.pmdl017) OR l_srab_t.pmdl017 <> g_srab_d[l_ac].pmdl017 THEN
                     CALL s_asrp400_chk_pmdl017(g_srab_d[l_ac].srab0041,g_srab_d[l_ac].srab0091,
                                                g_srab_d[l_ac].pmdl017)
                          RETURNING l_success
                     IF NOT l_success THEN
                        LET g_srab_d[l_ac].pmdl017 = l_srab_t.pmdl017
                        CALL s_desc_get_price_type_desc(g_srab_d[l_ac].pmdl017)
                             RETURNING g_srab_d[l_ac].pmdl017_desc
                        NEXT FIELD pmdl017
                     END IF
                  END IF
                  CALL s_desc_get_price_type_desc(g_srab_d[l_ac].pmdl017)
                       RETURNING g_srab_d[l_ac].pmdl017_desc
               ELSE
                  LET g_srab_d[l_ac].pmdl017_desc = NULL
               END IF

            AFTER FIELD pmdl015
               IF NOT cl_null(g_srab_d[l_ac].pmdl015) THEN
                  IF cl_null(l_srab_t.pmdl015) OR l_srab_t.pmdl015 <> g_srab_d[l_ac].pmdl015 THEN
                     CALL s_asrp400_chk_pmdl015(g_srab_d[l_ac].srab0041,g_srab_d[l_ac].srab0091,
                                                g_srab_d[l_ac].pmdl015)
                          RETURNING l_success
                     IF NOT l_success THEN
                        LET g_srab_d[l_ac].pmdl015 = l_srab_t.pmdl015
                        CALL s_desc_get_currency_desc(g_srab_d[l_ac].pmdl015)
                             RETURNING g_srab_d[l_ac].pmdl015_desc
                        NEXT FIELD pmdl015
                     END IF
                  END IF
                  CALL s_desc_get_currency_desc(g_srab_d[l_ac].pmdl015)
                       RETURNING g_srab_d[l_ac].pmdl015_desc
               ELSE
                  LET g_srab_d[l_ac].pmdl015_desc = NULL
               END IF

            AFTER FIELD pmdl011
               IF NOT cl_null(g_srab_d[l_ac].pmdl011) THEN
                  IF cl_null(l_srab_t.pmdl011) OR l_srab_t.pmdl011 <> g_srab_d[l_ac].pmdl011 THEN
                     CALL s_asrp400_chk_pmdl011(g_srab_d[l_ac].srab0041,g_srab_d[l_ac].srab0091,
                                                g_srab_d[l_ac].pmdl011)
                          RETURNING l_success
                     IF NOT l_success THEN
                        LET g_srab_d[l_ac].pmdl011 = l_srab_t.pmdl011
                        CALL s_desc_get_tax_desc1(g_site,g_srab_d[l_ac].pmdl011)
                             RETURNING g_srab_d[l_ac].pmdl011_desc
                        NEXT FIELD pmdl011
                     END IF
                  END IF
                  CALL s_desc_get_tax_desc1(g_site,g_srab_d[l_ac].pmdl011)
                       RETURNING g_srab_d[l_ac].pmdl011_desc
               ELSE
                  LET g_srab_d[l_ac].pmdl011_desc = NULL
               END IF


            ON ACTION controlp INFIELD pmdl004
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_srab_d[l_ac].pmdl004
               LET g_qryparam.where = "1=1 "
               LET l_sql = ''
               CALL s_control_get_sql("pmaa080",'3','4',g_user,g_dept) RETURNING l_success,l_sql
               IF l_success THEN
                  LET g_qryparam.where = g_qryparam.where ," AND ",l_sql
               END IF
               LET l_sql1 = ''
               CALL s_control_get_sql("pmaa001",'4','4',g_user,g_dept) RETURNING l_success,l_sql1
               IF l_success THEN
                  LET g_qryparam.where = g_qryparam.where ," AND ",l_sql1
               END IF
               CALL q_pmaa001_3()
               LET g_srab_d[l_ac].pmdl004 = g_qryparam.return1
               NEXT FIELD pmdl004

            ON ACTION controlp INFIELD pmdl017
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_srab_d[l_ac].pmdl017
               CALL q_pmam001()
               LET g_srab_d[l_ac].pmdl017 = g_qryparam.return1
               NEXT FIELD pmdl017

            ON ACTION controlp INFIELD pmdl015
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_srab_d[l_ac].pmdl015
               LET g_qryparam.arg1 = g_site
               CALL q_ooaj002_1()
               LET g_srab_d[l_ac].pmdl015 = g_qryparam.return1
               NEXT FIELD pmdl015

            ON ACTION controlp INFIELD pmdl011
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_srab_d[l_ac].pmdl011
               CALL q_oodb002_2()
               LET g_srab_d[l_ac].pmdl011 = g_qryparam.return1
               NEXT FIELD pmdl011

         END INPUT

         #end add-point
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
      
         #end add-point
 
         SUBDIALOG lib_cl_schedule.cl_schedule_setting
         SUBDIALOG lib_cl_schedule.cl_schedule_setting_exec_call
         SUBDIALOG lib_cl_schedule.cl_schedule_select_show_history
         SUBDIALOG lib_cl_schedule.cl_schedule_show_history
 
         BEFORE DIALOG
            LET l_dialog = ui.DIALOG.getCurrent()
            CALL asrp400_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            
            #end add-point
 
         ON ACTION batch_execute
            LET g_action_choice = "batch_execute"
            ACCEPT DIALOG
 
         #add-point:ui_dialog段before_qbeclear name="ui_dialog.before_qbeclear"
         
         #end add-point
 
         ON ACTION qbeclear         
            CLEAR FORM
            INITIALIZE g_master.* TO NULL   #畫面變數清空
            INITIALIZE lc_param.* TO NULL   #傳遞參數變數清空
            #add-point:ui_dialog段qbeclear name="ui_dialog.qbeclear"
            
            #end add-point
 
         ON ACTION history_fill
            CALL cl_schedule_history_fill()
 
         ON ACTION close
            LET INT_FLAG = TRUE
            EXIT DIALOG
         
         ON ACTION exit
            LET INT_FLAG = TRUE
            EXIT DIALOG
 
         #add-point:ui_dialog段action name="ui_dialog.more_action"
         ON ACTION filter
            CALL asrp400_filter()

         ON ACTION carry_po
            FOR l_i = 1 TO g_srab_d.getLength()
                IF g_srab_d[l_i].sel = 'Y' THEN
                   CALL s_asrp400_chk_before_carry(g_srab_d[l_i].*,g_master.sraa001,g_master.doctype,g_master.docdate)
                        RETURNING l_success
                   IF NOT l_success THEN
                      CONTINUE DIALOG
                   END IF   
                END IF
            END FOR         
            LET g_bgjob = 'N'
            LET g_press = TRUE
            CALL asrp400_process('')
            CALL asrp400_b1_fill()
            IF l_ac > 0 THEN
               CALL DIALOG.setCurrentRow("s_detail1",l_ac) 
               LET l_srab_t.* = g_srab_d[l_ac].*  
            END IF               
            LET g_press = FALSE

         ON ACTION selall
            CALL asrp400_sel_all("Y")

         ON ACTION selnone
            CALL asrp400_sel_all("N")
            
         ON ACTION accept
            IF NOT cl_null(g_master.sraa001) THEN
               CALL asrp400_b1_fill()
            END IF
         
         ON ACTION cancel
            LET INT_FLAG = 1
            EXIT DIALOG             

         #end add-point
 
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM   
         INITIALIZE g_master.* TO NULL
         LET g_wc  = ' 1=2'
         LET g_action_choice = ""
         CALL asrp400_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      
      #end add-point
 
      LET ls_js = util.JSON.stringify(lc_param)  #r類使用g_master/p類使用lc_param
 
      IF INT_FLAG THEN
         LET INT_FLAG = FALSE
         EXIT WHILE
      ELSE
         IF g_chk_jobid THEN 
            LET g_jobid = g_schedule.gzpa001
         ELSE 
            LET g_jobid = cl_schedule_get_jobid(g_prog)
         END IF 
 
         #依照指定模式執行報表列印
         CASE 
            WHEN g_schedule.gzpa003 = "0"
                 CALL asrp400_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = asrp400_transfer_argv(ls_js)
                 CALL cl_cmdrun(ls_js)
 
            WHEN g_schedule.gzpa003 = "2"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
 
            WHEN g_schedule.gzpa003 = "3"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
         END CASE  
 
         IF g_schedule.gzpa003 = "2" OR g_schedule.gzpa003 = "3" THEN 
            CALL cl_ask_confirm3("std-00014","") #設定完成
         END IF    
         LET g_schedule.gzpa003 = "0" #預設一開始 立即於前景執行
 
         #add-point:ui_dialog段after schedule name="process.after_schedule"
         
         #end add-point
 
         #欄位初始資訊 
         CALL cl_schedule_init_info("all",g_schedule.gzpa003) 
         LET gi_hiden_asign = FALSE 
         LET gi_hiden_exec = FALSE 
         LET gi_hiden_spec = FALSE 
         LET gi_hiden_exec_end = FALSE 
         CALL cl_schedule_hidden()
      END IF
   END WHILE
 
END FUNCTION
 
{</section>}
 
{<section id="asrp400.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION asrp400_transfer_argv(ls_js)
 
   #add-point:transfer_agrv段define (客製用) name="transfer_agrv.define_customerization"
   
   #end add-point
   DEFINE ls_js       STRING
   DEFINE la_cmdrun   RECORD
             prog       STRING,
             actionid   STRING,
             background LIKE type_t.chr1,
             param      DYNAMIC ARRAY OF STRING
                  END RECORD
   DEFINE la_param    type_parameter
   #add-point:transfer_agrv段define name="transfer_agrv.define"
   
   #end add-point
 
   LET la_cmdrun.prog = g_prog
   LET la_cmdrun.background = "Y"
   LET la_cmdrun.param[1] = ls_js
 
   #add-point:transfer.argv段程式內容 name="transfer.argv.define"
   
   #end add-point
 
   RETURN util.JSON.stringify( la_cmdrun )
END FUNCTION
 
{</section>}
 
{<section id="asrp400.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION asrp400_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   DEFINE r_success        LIKE type_t.num5     
   DEFINE l_begin_no       LIKE pmdl_t.pmdldocno   
   DEFINE l_end_no         LIKE pmdl_t.pmdldocno
   DEFINE l_success        LIKE type_t.num5
   DEFINE l_i              LIKE type_t.num10
   DEFINE l_j              LIKE type_t.num10
   DEFINE l_choice         LIKE type_t.chr1
   DEFINE la_param         RECORD
                           prog   STRING,
                           param  DYNAMIC ARRAY OF STRING
                           END RECORD
   DEFINE ls_info          STRING #160330-00012#1 add
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   IF g_bgjob = 'N' THEN
      IF NOT g_press THEN
         RETURN
      END IF
   END IF

   IF g_bgjob = 'Y' THEN
      FOR l_i = 1 TO g_srab_d.getLength()
          IF g_srab_d[l_i].sel = 'Y' THEN
             CALL s_asrp400_chk_before_carry(g_srab_d[l_i].*,g_master.sraa001,g_master.doctype,g_master.docdate)
                  RETURNING l_success
             IF NOT l_success THEN
                RETURN
             END IF   
          END IF
      END FOR
   END IF
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      LET li_count = g_rec_b1
      CALL cl_progress_bar_no_window(li_count)
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE asrp400_process_cs CURSOR FROM ls_sql
#  FOREACH asrp400_process_cs INTO
   #add-point:process段process name="process.process"
   
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
      CALL g_arr1.clear()
      LET l_j = 1 
      FOR l_i = 1 TO g_srab_d.getLength()
         #CALL cl_progress_no_window_ing("读取"||g_srab_d[l_i].srab0041||"基本资料")   #160330-00012#1 mark
          LET ls_info = cl_getmsg_parm("azz-01004",g_lang,g_srab_d[l_i].srab0041)     #160330-00012#1 add
          CALL cl_progress_no_window_ing(ls_info)                                     #160330-00012#1 add
          IF g_srab_d[l_i].sel = 'Y' THEN
             LET g_arr1[l_j].*   = g_srab_d[l_i].*  
             LET l_j = l_j + 1                     
          END IF
      END FOR
            
      CALL s_asrp400_cre_tmp_table(g_master.doctype,g_master.docdate,g_master.sraa001,g_arr1)
           RETURNING l_success
      IF NOT l_success THEN
         RETURN 
      END IF
      
      CALL s_transaction_begin()
      CALL s_asrp400_carry_po(g_master.doctype,g_master.docdate,g_master.combine)
           RETURNING l_success,l_begin_no,l_end_no
      IF l_success THEN
         CALL s_transaction_end('Y',0)
         #成功产生单据，单据范围：%1 ~ %2
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00251'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = l_begin_no 
         LET g_errparam.replace[2] =  l_end_no
         CALL cl_err()

      ELSE
         CALL s_transaction_end('N',1)
      END IF
   
      CALL s_asrp400_drop_tmp_table()
      
      IF l_success AND NOT cl_null(l_begin_no) THEN
         #是否要运行apmt500查看生成的采购单信息[Y/N]?
         LET l_choice = cl_ask_promp('asf-00261')         
         IF l_choice = 'Y' OR l_choice = 'y' THEN
             LET la_param.prog     = "apmt501"
             LET la_param.param[1] = l_begin_no
             LET ls_js = util.JSON.stringify( la_param )
             CALL cl_cmdrun(ls_js)
         END IF
      END IF
      RETURN
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
      CALL s_asrp400_cre_tmp_table(g_param.doctype,g_param.docdate,g_param.sraa001,g_arr1)
           RETURNING l_success
      IF NOT l_success THEN
         RETURN 
      END IF
      
      CALL s_transaction_begin()
      CALL s_asrp400_carry_po(g_param.doctype,g_param.docdate,g_param.combine)
           RETURNING l_success,l_begin_no,l_end_no
      IF l_success THEN
         CALL s_transaction_end('Y',0)
      ELSE
         CALL s_transaction_end('N',1)
      END IF
   
      CALL s_asrp400_drop_tmp_table()

      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL asrp400_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="asrp400.get_buffer" >}
PRIVATE FUNCTION asrp400_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.doctype = p_dialog.getFieldBuffer('doctype')
   LET g_master.docdate = p_dialog.getFieldBuffer('docdate')
   LET g_master.sraa001 = p_dialog.getFieldBuffer('sraa001')
   LET g_master.combine = p_dialog.getFieldBuffer('combine')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asrp400.msgcentre_notify" >}
PRIVATE FUNCTION asrp400_msgcentre_notify()
 
   #add-point:process段define (客製用) name="msgcentre_notify.define_customerization"
   
   #end add-point
   DEFINE lc_state LIKE type_t.chr5
   #add-point:process段define name="msgcentre_notify.define"
   
   #end add-point
 
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = "process"
 
   #add-point:msgcentre其他通知 name="msg_centre.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="asrp400.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"
################################################################################
# Descriptions...: 工单单身fill
# Memo...........:
# Usage..........: CALL asrp400_b1_fill()
#                  RETURNING NULL
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-03-24 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp400_b1_fill()
   DEFINE l_i            LIKE type_t.num5
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_cnt          LIKE type_t.num10
   DEFINE l_srab010      LIKE srab_t.srab010
   DEFINE l_srac028      LIKE srac_t.srac028
   DEFINE l_srac029      LIKE srac_t.srac029
   
   CALL g_srab_d.clear()
   
   IF cl_null(g_master.wc) THEN
      LET g_master.wc = ' 1 = 1'
   END IF
   
   LET g_sql = " SELECT 'N'    , srab004, ''     , '' , srab005, srab006, srac008, ''     , ",
               "        srac009, srab009, srac027, 0  , 0      , 0      , srac037, ''     , ",
               "        ''     , ''     , ''     , '' , ''     , ''     , 0      , srab000, ",
               "        srab010, srac028, srac029 ",
               "   FROM sraa_t,srab_t,srac_t",
               " WHERE srabent  = sraaent  AND srabent  = sracent  AND srabent  = ",g_enterprise,
               "   AND srabsite = sraasite AND srabsite = sracsite AND srabsite = '",g_site,"'",
               "   AND srab000  = sraa000 ",
               "   AND srab001  = sraa001  AND srab001  = srac001  AND srab001 = '",g_master.sraa001,"'",
               "   AND srab002  = sraa002 ",
               "   AND srab003  = sraa003 ",
               "   AND srab004  = srac004 ",
               "   AND srab005  = srac005 ",
               "   AND srab006  = srac006 ",
               "   AND srab008  = srac002 ",
               "   AND srac036  = 'Y' ",
               "   AND sraastus = 'Y' ",
               "   AND ",g_master.wc
               
#               "   AND srab000  = ( SELECT MAX(sraa000) FROM sraa_t ",
#               "                     WHERE sraaent  = srabent  AND sraasite = srabsite ",
#               "                       AND sraa001  = srab001  AND sraa002  = srab002  ",
#               "                       AND sraa003  = srab003  AND sraastus = 'Y' ) " 

   PREPARE asrp400_b1_fill_p1 FROM g_sql
   DECLARE asrp400_b1_fill_cs1 CURSOR FOR asrp400_b1_fill_p1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare asrp400_b1_fill_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF

   LET l_i = 1
   CALL g_pmal.clear()
   FOREACH asrp400_b1_fill_cs1 INTO g_srab_d[l_i].*,l_srab010,l_srac028,l_srac029
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF   
      
      #完工差異數diff_qty:生產數量sfaa012-入庫合格量sfaa050-入庫不合格量sfaa051-
      #                  下線量sfaa055-報廢量sfaa056
     
      LET g_srab_d[l_i].qty1 = l_srab010 * l_srac028 / l_srac029
      IF cl_null(g_srab_d[l_i].qty1) THEN LET g_srab_d[l_i].qty1 = 0 END IF
      
      #carrier 这里应该是少了一个"生产计划"的参数
      CALL s_asrp400_get_carried_qty(g_master.sraa001,g_srab_d[l_i].srab0041,g_srab_d[l_i].srab0061,
                                     g_srab_d[l_i].srac008,g_srab_d[l_i].srac009,g_srab_d[l_i].srab0051,
                                     g_srab_d[l_i].srab0091,g_srab_d[l_i].srac027)
           RETURNING g_srab_d[l_i].qty2
      LET g_srab_d[l_i].carry_qty = g_srab_d[l_i].qty1 - g_srab_d[l_i].qty2
      
      IF g_srab_d[l_i].carry_qty <=0 THEN
         CONTINUE FOREACH
      END IF
         
      CALL asrp400_pmdl004_reference(l_i)
      #取各字段说明
      CALL asrp400_set_desc(l_i)
        
      LET l_i = l_i + 1
   
   END FOREACH
   
   CALL g_srab_d.deleteElement(l_i)
   LET g_rec_b1 = l_i - 1
   
   IF g_rec_b1 > 0 THEN
      LET l_ac = 1
   END IF
   
   #选项清空
   CALL g_pmal.clear()    
END FUNCTION
################################################################################
# Descriptions...: 全选
# Memo...........:
# Usage..........: CALL asrp400_sel_all(p_flag)
#                       RETURNING NULL
# Input parameter: p_flag         Y/N
# Return code....: NULL
# Date & Author..: 2014-03-24 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp400_sel_all(p_flag)
   DEFINE p_flag         LIKE type_t.chr1
   DEFINE l_i            LIKE type_t.num5
   DEFINE l_date         LIKE type_t.dat
   
   FOR l_i = 1 TO g_srab_d.getLength()
       LET g_srab_d[l_i].sel = p_flag
   END FOR
END FUNCTION

################################################################################
# Descriptions...: 检查单别
# Memo...........:
# Usage..........: CALL asrp400_chk_doc_type(p_doc_type)
#                       RETURNING r_success
# Input parameter: p_doc_type  采购单别
# Return code....: r_success   检查通过否
# Date & Author..: 2014-04-30 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp400_chk_doc_type(p_doc_type)
   DEFINE p_doc_type     LIKE ooba_t.ooba002
   DEFINE l_i            LIKE type_t.num10
   DEFINE r_success      LIKE type_t.num5
   DEFINE l_success      LIKE type_t.num5

   LET r_success = FALSE

   CALL s_aooi200_chk_slip(g_site,'',g_master.doctype,'apmt500')
        RETURNING l_success
   IF NOT l_success THEN
      RETURN r_success
   END IF

   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 二次过滤
# Memo...........:
# Usage..........: CALL asrp400_filter()
#                  RETURNING NULL
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-04-10 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp400_filter()
   DEFINE l_filter_wc    STRING

   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      CONSTRUCT l_filter_wc ON srab004,srab005,srab006,srac008,srac009,srac027,srab009
           FROM s_detail1[1].srab004,s_detail1[1].srab005,s_detail1[1].srab006,s_detail1[1].srac008,
                s_detail1[1].srac009,s_detail1[1].srac027,s_detail1[1].srab009

            #料件
            ON ACTION controlp INFIELD srab004
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_bmaa001_1()                     
               DISPLAY g_qryparam.return1 TO srab004  
               NEXT FIELD srab004   

            #BOM特性
            ON ACTION controlp INFIELD srab005
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_bmaa002()                    
               DISPLAY g_qryparam.return1 TO srab005  
               NEXT FIELD srab005                 

            #作业编号
            ON ACTION controlp INFIELD srac008
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.arg1 = '221'
               CALL q_oocq002()
               DISPLAY g_qryparam.return1 TO srac008
               NEXT FIELD srac008

            #单位
            ON ACTION controlp INFIELD srac027
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_ooca001()
               DISPLAY g_qryparam.return1 TO srac027
               NEXT FIELD srac027

      END CONSTRUCT
 
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG      

   END DIALOG
   
   LET g_master.wc = g_master.wc CLIPPED,' AND ',l_filter_wc
   CALL asrp400_b1_fill()
     
END FUNCTION

################################################################################
# Descriptions...: 检查 重复性生产计划sraa001 值的合法性
# Memo...........:
# Usage..........: CALL asrp400_chk_sraa001()
#                       RETURNING r_success
# Input parameter: NULL
# Return code....: r_success 检查通过否标识位
# Date & Author..: 2014-04-30 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp400_chk_sraa001()
   DEFINE r_success      LIKE type_t.num5
   DEFINE l_cnt          LIKE type_t.num5

   LET r_success = FALSE

   #检查重复性生产版本档
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = g_master.sraa001
   LET g_errshow = TRUE   #160318-00025#52
   LET g_chkparam.err_str[1] = "asr-00014:sub-01302|asri001|",cl_get_progname("asri001",g_lang,"2"),"|:EXEPROGasri001"    #160318-00025#52
   IF NOT cl_chk_exist("v_srza001") THEN
      RETURN r_success
   END IF

   LET r_success = TRUE
   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 厂商相关字段的DEFAULT
# Memo...........:
# Usage..........: CALL asrp400_pmdl004_reference(p_i)
#                       RETURNING NULL
# Input parameter: p_i       行号
# Return code....: NULL
# Date & Author..: 2014-05-04 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp400_pmdl004_reference(p_i)
   DEFINE p_i            LIKE type_t.num10
#   DEFINE l_pmal         RECORD LIKE pmal_t.* #161124-00048#10 mark
#   DEFINE l_pmab         RECORD LIKE pmab_t.* #161124-00048#10 mark
   #161124-00048#10 add-s
   DEFINE l_pmal RECORD  #採購控制組供應商預設條件檔
       pmalent LIKE pmal_t.pmalent, #企业编号
       pmal001 LIKE pmal_t.pmal001, #交易对象编号
       pmal002 LIKE pmal_t.pmal002, #控制组编号
       pmal003 LIKE pmal_t.pmal003, #惯用交易币种
       pmal004 LIKE pmal_t.pmal004, #惯用税务规则
       pmal005 LIKE pmal_t.pmal005, #惯用发票开立方式
       pmal006 LIKE pmal_t.pmal006, #惯用付款条件
       pmal008 LIKE pmal_t.pmal008, #惯用采购渠道
       pmal009 LIKE pmal_t.pmal009, #惯用采购分类
       pmal010 LIKE pmal_t.pmal010, #惯用报表语言
       pmal011 LIKE pmal_t.pmal011, #惯用交运方式
       pmal012 LIKE pmal_t.pmal012, #惯用交运起点
       pmal013 LIKE pmal_t.pmal013, #惯用交运终点
       pmal014 LIKE pmal_t.pmal014, #惯用卸货港
       pmal015 LIKE pmal_t.pmal015, #惯用佣金率
       pmal016 LIKE pmal_t.pmal016, #折扣率
       pmal017 LIKE pmal_t.pmal017, #惯用ForWarder
       pmal018 LIKE pmal_t.pmal018, #惯用Notify
       pmal019 LIKE pmal_t.pmal019, #负责采购人员
       pmal020 LIKE pmal_t.pmal020, #惯用交易条件
       pmal021 LIKE pmal_t.pmal021, #惯用取价方式
       pmal022 LIKE pmal_t.pmal022, #惯用票类型
       pmal023 LIKE pmal_t.pmal023, #惯用内外购
       pmal024 LIKE pmal_t.pmal024, #惯用汇率计算基准
       pmalownid LIKE pmal_t.pmalownid, #资料所有者
       pmalowndp LIKE pmal_t.pmalowndp, #资料所有部门
       pmalcrtid LIKE pmal_t.pmalcrtid, #资料录入者
       pmalcrtdp LIKE pmal_t.pmalcrtdp, #资料录入部门
       pmalcrtdt LIKE pmal_t.pmalcrtdt, #资料创建日
       pmalmodid LIKE pmal_t.pmalmodid, #资料更改者
       pmalmoddt LIKE pmal_t.pmalmoddt, #最近更改日
       pmalstus LIKE pmal_t.pmalstus, #状态码
       pmal025 LIKE pmal_t.pmal025  #负责采购部门
   END RECORD
   DEFINE l_pmab RECORD  #交易對象據點檔
       pmabent LIKE pmab_t.pmabent, #企业编号
       pmabsite LIKE pmab_t.pmabsite, #营运据点
       pmab001 LIKE pmab_t.pmab001, #交易对象编号
       pmab002 LIKE pmab_t.pmab002, #信用额度检查
       pmab003 LIKE pmab_t.pmab003, #额度交易对象
       pmab004 LIKE pmab_t.pmab004, #信用评核等级
       pmab005 LIKE pmab_t.pmab005, #额度计算币种
       pmab006 LIKE pmab_t.pmab006, #企业额度
       pmab007 LIKE pmab_t.pmab007, #可超出率
       pmab008 LIKE pmab_t.pmab008, #有效期限
       pmab009 LIKE pmab_t.pmab009, #逾期账款宽限天数
       pmab010 LIKE pmab_t.pmab010, #允许除外额度
       pmab011 LIKE pmab_t.pmab011, #额度警示水准一
       pmab012 LIKE pmab_t.pmab012, #水准一通知层
       pmab013 LIKE pmab_t.pmab013, #额度警示水准二
       pmab014 LIKE pmab_t.pmab014, #水准二通知层
       pmab015 LIKE pmab_t.pmab015, #额度警示水准三
       pmab016 LIKE pmab_t.pmab016, #水准三通知层
       pmab017 LIKE pmab_t.pmab017, #启动预期应收通知
       pmab018 LIKE pmab_t.pmab018, #预期应收通知层
       pmab030 LIKE pmab_t.pmab030, #供应商ABC分类
       pmab031 LIKE pmab_t.pmab031, #负责采购人员
       pmab032 LIKE pmab_t.pmab032, #供应商惯用报表语言
       pmab033 LIKE pmab_t.pmab033, #供应商惯用交易币种
       pmab034 LIKE pmab_t.pmab034, #供应商惯用交易税种
       pmab035 LIKE pmab_t.pmab035, #供应商惯用发票开立方式
       pmab036 LIKE pmab_t.pmab036, #供应商惯用立账方式
       pmab037 LIKE pmab_t.pmab037, #供应商惯用付款条件
       pmab038 LIKE pmab_t.pmab038, #供应商惯用采购渠道
       pmab039 LIKE pmab_t.pmab039, #供应商惯用采购分类
       pmab040 LIKE pmab_t.pmab040, #供应商惯用交运方式
       pmab041 LIKE pmab_t.pmab041, #供应商惯用交运起点
       pmab042 LIKE pmab_t.pmab042, #供应商惯用交运终点
       pmab043 LIKE pmab_t.pmab043, #供应商惯用卸货港
       pmab044 LIKE pmab_t.pmab044, #供应商惯用其它条件
       pmab045 LIKE pmab_t.pmab045, #供应商惯用佣金率
       pmab046 LIKE pmab_t.pmab046, #供应商折扣率
       pmab047 LIKE pmab_t.pmab047, #供应商惯用Forwarder
       pmab048 LIKE pmab_t.pmab048, #供应商惯用 Notify
       pmab049 LIKE pmab_t.pmab049, #默认允许分批收货
       pmab050 LIKE pmab_t.pmab050, #最多可拆解批次
       pmab051 LIKE pmab_t.pmab051, #默认允许提前收货
       pmab052 LIKE pmab_t.pmab052, #可提前收货天数
       pmab053 LIKE pmab_t.pmab053, #惯用交易条件
       pmab054 LIKE pmab_t.pmab054, #惯用取价方式
       pmab055 LIKE pmab_t.pmab055, #应付账款类别
       pmab056 LIKE pmab_t.pmab056, #供应商惯用发票类型
       pmab057 LIKE pmab_t.pmab057, #供应商惯用内外购
       pmab058 LIKE pmab_t.pmab058, #供应商惯用汇率计算基准
       pmab060 LIKE pmab_t.pmab060, #供应商评鉴计算分类
       pmab061 LIKE pmab_t.pmab061, #价格评分
       pmab062 LIKE pmab_t.pmab062, #达交率评分
       pmab063 LIKE pmab_t.pmab063, #质量评分
       pmab064 LIKE pmab_t.pmab064, #配合度评分
       pmab065 LIKE pmab_t.pmab065, #调整加减分
       pmab066 LIKE pmab_t.pmab066, #定性评分一
       pmab067 LIKE pmab_t.pmab067, #定性评分二
       pmab068 LIKE pmab_t.pmab068, #定性评分三
       pmab069 LIKE pmab_t.pmab069, #定性评分四
       pmab070 LIKE pmab_t.pmab070, #定性评分五
       pmab071 LIKE pmab_t.pmab071, #检验程度
       pmab072 LIKE pmab_t.pmab072, #检验水准
       pmab073 LIKE pmab_t.pmab073, #检验级数
       pmab080 LIKE pmab_t.pmab080, #客户ABC分类
       pmab081 LIKE pmab_t.pmab081, #负责业务人员
       pmab082 LIKE pmab_t.pmab082, #客户惯用报表语言
       pmab083 LIKE pmab_t.pmab083, #客户惯用交易币种
       pmab084 LIKE pmab_t.pmab084, #客户惯用交易税种
       pmab085 LIKE pmab_t.pmab085, #客户惯用发票开立方式
       pmab086 LIKE pmab_t.pmab086, #客户惯用立账方式
       pmab087 LIKE pmab_t.pmab087, #客户惯用收款条件
       pmab088 LIKE pmab_t.pmab088, #客户惯用销售渠道
       pmab089 LIKE pmab_t.pmab089, #客户惯用销售分类
       pmab090 LIKE pmab_t.pmab090, #客户惯用交运方式
       pmab091 LIKE pmab_t.pmab091, #客户惯用交运起点
       pmab092 LIKE pmab_t.pmab092, #客户惯用交运终点
       pmab093 LIKE pmab_t.pmab093, #客户惯用卸货港
       pmab094 LIKE pmab_t.pmab094, #客户惯用其它条件
       pmab095 LIKE pmab_t.pmab095, #客户惯用佣金率
       pmab096 LIKE pmab_t.pmab096, #客户折扣率
       pmab097 LIKE pmab_t.pmab097, #客户惯用Forwarder
       pmab098 LIKE pmab_t.pmab098, #客户惯用 Notify
       pmab099 LIKE pmab_t.pmab099, #默认允许分批交货
       pmab100 LIKE pmab_t.pmab100, #最多可拆解批次
       pmab101 LIKE pmab_t.pmab101, #默认允许提前交货
       pmab102 LIKE pmab_t.pmab102, #可提前交货天数
       pmab103 LIKE pmab_t.pmab103, #惯用交易条件
       pmab104 LIKE pmab_t.pmab104, #惯用取价方式
       pmab105 LIKE pmab_t.pmab105, #应收账款类别
       pmab106 LIKE pmab_t.pmab106, #客户惯用发票类型
       pmab107 LIKE pmab_t.pmab107, #客户惯用内外销
       pmab108 LIKE pmab_t.pmab108, #客户惯用汇率计算基准
       pmabownid LIKE pmab_t.pmabownid, #资料所有者
       pmabowndp LIKE pmab_t.pmabowndp, #资料所有部门
       pmabcrtid LIKE pmab_t.pmabcrtid, #资料录入者
       pmabcrtdp LIKE pmab_t.pmabcrtdp, #资料录入部门
       pmabcrtdt LIKE pmab_t.pmabcrtdt, #资料创建日
       pmabmodid LIKE pmab_t.pmabmodid, #资料更改者
       pmabmoddt LIKE pmab_t.pmabmoddt, #最近更改日
       pmabcnfid LIKE pmab_t.pmabcnfid, #资料审核者
       pmabcnfdt LIKE pmab_t.pmabcnfdt, #数据审核日
       pmabstus LIKE pmab_t.pmabstus, #状态码
       pmab059 LIKE pmab_t.pmab059, #负责采购部门
       pmab109 LIKE pmab_t.pmab109, #负责业务部门
       pmab110 LIKE pmab_t.pmab110, #供应商条码包装数量
       pmab111 LIKE pmab_t.pmab111, #客户条码包装数量
       pmab019 LIKE pmab_t.pmab019, #逾期账款宽限额度
       pmab020 LIKE pmab_t.pmab020, #除外额有效日期
       pmab112 LIKE pmab_t.pmab112  #是否使用EC
   END RECORD
   #161124-00048#10 add-e
   DEFINE l_pmal002      LIKE pmal_t.pmal002   #控制组
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_i            LIKE type_t.num5

   IF p_i <= 0 THEN
      RETURN
   END IF

   IF cl_null(g_srab_d[p_i].pmdl004) THEN
      RETURN
   END IF
   
   #相同的供应商时,仅提供一次取pmal002的机会,否则可能同一个供应商,有几十笔资料时,跳几十次选择的情形
   LET l_pmal002 = ''
   FOR l_i = 1 TO g_pmal.getLength()
       IF g_pmal[l_i].pmdl004 = g_srab_d[p_i].pmdl004 AND NOT cl_null(g_pmal[l_i].pmal002) THEN
          LET l_pmal002 = g_pmal[l_i].pmal002
          EXIT FOR
       END IF
   END FOR

   IF cl_null(l_pmal002) THEN
      CALL s_control_get_pmal002('4',g_user,g_dept,g_srab_d[p_i].pmdl004)
           RETURNING l_success,l_pmal002
      IF NOT l_success THEN
         LET l_pmal002 = NULL
      END IF
      IF NOT cl_null(l_pmal002) THEN
         CALL g_pmal.insertElement(1)
         LET g_pmal[1].pmdl004 = g_srab_d[p_i].pmdl004
         LET g_pmal[1].pmal002 = l_pmal002
      END IF
   END IF

   #取供应商的控制组预设条件
#   SELECT * INTO l_pmal.* FROM pmal_t #161124-00048#10 mark
   #161124-00048#10 add-s
   SELECT pmalent,pmal001,pmal002,pmal003,pmal004,pmal005,pmal006,
          pmal008,pmal009,pmal010,pmal011,pmal012,pmal013,pmal014,
          pmal015,pmal016,pmal017,pmal018,pmal019,pmal020,pmal021,
          pmal022,pmal023,pmal024,pmalownid,pmalowndp,pmalcrtid,
          pmalcrtdp,pmalcrtdt,pmalmodid,pmalmoddt,pmalstus,pmal025 
     INTO l_pmal.* FROM pmal_t 
   #161124-00048#10 add-e
    WHERE pmalent = g_enterprise
      AND pmal001 = g_srab_d[p_i].pmdl004
      AND pmal002 = l_pmal002

#   SELECT * INTO l_pmab.* FROM pmab_t #161124-00048#10 mark
   #161124-00048#10 add-s
   SELECT pmabent,pmabsite,pmab001,pmab002,pmab003,pmab004,pmab005,
          pmab006,pmab007,pmab008,pmab009,pmab010,pmab011,pmab012,
          pmab013,pmab014,pmab015,pmab016,pmab017,pmab018,pmab030,
          pmab031,pmab032,pmab033,pmab034,pmab035,pmab036,pmab037,
          pmab038,pmab039,pmab040,pmab041,pmab042,pmab043,pmab044,
          pmab045,pmab046,pmab047,pmab048,pmab049,pmab050,pmab051,
          pmab052,pmab053,pmab054,pmab055,pmab056,pmab057,pmab058,
          pmab060,pmab061,pmab062,pmab063,pmab064,pmab065,pmab066,
          pmab067,pmab068,pmab069,pmab070,pmab071,pmab072,pmab073,
          pmab080,pmab081,pmab082,pmab083,pmab084,pmab085,pmab086,
          pmab087,pmab088,pmab089,pmab090,pmab091,pmab092,pmab093,
          pmab094,pmab095,pmab096,pmab097,pmab098,pmab099,pmab100,
          pmab101,pmab102,pmab103,pmab104,pmab105,pmab106,pmab107,
          pmab108,pmabownid,pmabowndp,pmabcrtid,pmabcrtdp,pmabcrtdt,
          pmabmodid,pmabmoddt,pmabcnfid,pmabcnfdt,pmabstus,pmab059,
          pmab109,pmab110,pmab111,pmab019,pmab020,pmab112 
     INTO l_pmab.* FROM pmab_t
   #161124-00048#10 add-e
    WHERE pmabent  = g_enterprise
      AND pmabsite = g_site
      AND pmab001  = g_srab_d[p_i].pmdl004

   #取价方式
   LET g_srab_d[p_i].pmdl017 = l_pmal.pmal021
   IF cl_null(g_srab_d[p_i].pmdl017) THEN
      LET g_srab_d[p_i].pmdl017 = l_pmab.pmab054
   END IF
   CALL s_desc_get_price_type_desc(g_srab_d[p_i].pmdl017)
        RETURNING g_srab_d[p_i].pmdl017_desc

   #币种
   LET g_srab_d[p_i].pmdl015 = l_pmal.pmal003
   IF cl_null(g_srab_d[p_i].pmdl015) THEN
      LET g_srab_d[p_i].pmdl015 = l_pmab.pmab033
   END IF
   CALL s_desc_get_currency_desc(g_srab_d[p_i].pmdl015)
        RETURNING g_srab_d[p_i].pmdl015_desc

   #税别
   LET g_srab_d[p_i].pmdl011 = l_pmal.pmal004
   IF cl_null(g_srab_d[p_i].pmdl011) THEN
      LET g_srab_d[p_i].pmdl011 = l_pmab.pmab034
   END IF
   CALL s_desc_get_tax_desc1(g_site,g_srab_d[p_i].pmdl011)
        RETURNING g_srab_d[p_i].pmdl011_desc

END FUNCTION

################################################################################
# Descriptions...: 各说明字段的FILL
# Memo...........:
# Usage..........: CALL asrp400_set_desc(p_i)
#                  RETURNING NULL
# Input parameter: p_i       当前行号
# Return code....: NULL
# Date & Author..: 2014-04-12 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp400_set_desc(p_i)
   DEFINE p_i            LIKE type_t.num10

   IF p_i <= 0 OR cl_null(p_i) THEN
      RETURN
   END IF

   #品名/规格
   IF NOT cl_null(g_srab_d[p_i].srab0041) THEN
      CALL s_desc_get_item_desc(g_srab_d[p_i].srab0041)
           RETURNING g_srab_d[p_i].srab0041_desc1,g_srab_d[p_i].srab0041_desc2
   END IF

   #作业编号
   IF NOT cl_null(g_srab_d[p_i].srac008) THEN
      CALL s_desc_get_acc_desc('221',g_srab_d[p_i].srac008)
           RETURNING g_srab_d[p_i].srac008_desc
   END IF

   #厂商说明
   IF NOT cl_null(g_srab_d[p_i].pmdl004) THEN
      CALL s_desc_get_trading_partner_abbr_desc(g_srab_d[p_i].pmdl004)
           RETURNING g_srab_d[p_i].pmdl004_desc
   END IF

   #取价说明
   IF NOT cl_null(g_srab_d[p_i].pmdl017) THEN
      CALL s_desc_get_price_type_desc(g_srab_d[p_i].pmdl017)
           RETURNING g_srab_d[p_i].pmdl017_desc
   END IF

   #币种
   IF NOT cl_null(g_srab_d[p_i].pmdl015) THEN
      CALL s_desc_get_currency_desc(g_srab_d[p_i].pmdl015)
           RETURNING g_srab_d[p_i].pmdl015_desc
   END IF

   #税种
   IF NOT cl_null(g_srab_d[p_i].pmdl011) THEN
      CALL s_desc_get_tax_desc1(g_site,g_srab_d[p_i].pmdl011)
           RETURNING g_srab_d[p_i].pmdl011_desc
   END IF


END FUNCTION

#end add-point
 
{</section>}
 
