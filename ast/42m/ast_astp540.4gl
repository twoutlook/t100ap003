#該程式未解開Section, 採用最新樣板產出!
{<section id="astp540.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0004(2016-04-19 13:50:24), PR版次:0004(2016-11-16 10:42:01)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000057
#+ Filename...: astp540
#+ Description: 專櫃結算單批次產生作業
#+ Creator....: 05818(2015-07-22 15:25:06)
#+ Modifier...: 06815 -SD/PR- 02481
 
{</section>}
 
{<section id="astp540.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#161111-00028#3   2016/11/16   by 02481   标准程式定义采用宣告模式,弃用.*写法
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
   
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       stfasite LIKE type_t.chr10, 
   stfa038 LIKE type_t.chr10, 
   stfa005 LIKE type_t.chr20, 
   stfa036 LIKE type_t.chr10, 
   stfa051 LIKE type_t.chr10, 
   stfa010 LIKE type_t.chr10, 
   stfa003 LIKE type_t.chr10, 
   stfa045 LIKE type_t.chr10, 
   stfa046 LIKE type_t.chr10, 
   l_bdate LIKE type_t.chr500, 
   choice LIKE type_t.chr500, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"

#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astp540.main" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
   DEFINE l_success LIKE type_t.num5 
   #end add-point 
  
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:初始化前定義 name="main.before_ap_init"
   
   #end add-point
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js name="main.background"
   
   #end add-point
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
      CALL astp540_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp540 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp540_init()
 
      #進入選單 Menu (="N")
      CALL astp540_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp540
   END IF
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success 
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp540.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp540_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   DEFINE l_success LIKE type_t.num5 
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
   CALL cl_set_combo_scc("choice","6832")    #add by geza 20150624 150616-00035#14 
#   CALL cl_set_combo_scc('stfa003','6014')             #add by dengdd 15/9/16  
   CALL cl_set_combo_scc_part('stfa003',"6013","4,5")        #add by geza  15/10/26  
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   #是否启用交款汇总单为N,只能生成结算单
   IF cl_get_para(g_enterprise,g_site,"S-CIR-2012") = 'N' THEN
      CALL cl_set_comp_entry("choice", FALSE)
   END IF 
   #add by geza 20150812(E)
   CALL cl_set_combo_scc_part('stfa046','6201','2') #151214-00017#25  add by dengdd 160201
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp540.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp540_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"

   DEFINE       l_ooef017  LIKE ooef_t.ooef017
   DEFINE       l_glaa003  LIKE glaa_t.glaa003
   DEFINE       l_flag      LIKE    type_t.chr1
   DEFINE       l_errno      LIKE    type_t.chr100 
   DEFINE       l_glav005    LIKE  glav_t.glav005
   DEFINE       l_sdate_s    LIKE  type_t.chr500
   DEFINE        l_sdate_e   LIKE   type_t.chr500
   DEFINE       l_pdate_s    LIKE   type_t.chr500
   DEFINE       l_pdate_e    LIKE    type_t.chr500
   DEFINE       l_glav007    LIKE  glav_t.glav007
   DEFINE       l_wdate_s    LIKE type_t.chr500
   DEFINE       l_wdate_e    LIKE  type_t.chr500
   DEFINE       l_glav002_1  LIKE  glav_t.glav002
   DEFINE       l_glav002    LIKE  glav_t.glav002
   DEFINE       l_glav006_1  LIKE  glav_t.glav006
   DEFINE       l_glav006   LIKE   glav_t.glav006
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   #查询資料  ---会计期别
   #抓取法人對應會計週期參照表
#   LET l_ooef017 = NULL
#   LET l_glaa003 = NULL     
#   
#   #法人     
#   SELECT ooef017 INTO l_ooef017           
#     FROM ooef_t
#    WHERE ooefent = g_enterprise
#      AND ooef001 = g_site
#      
#   #依据法人+运营组织+主账套--------会计周期参照表号
#   SELECT glaa003 INTO l_glaa003
#     FROM glaa_t
#    WHERE glaaent = g_enterprise
#      AND glaacomp = l_ooef017
#      AND glaa014 = 'Y'
#      
#   #取得會計週期資料
#   CALL s_get_accdate(l_glaa003,g_today,'','')
#      RETURNING l_flag,l_errno,l_glav002,l_glav005,l_sdate_s,l_sdate_e,
#                l_glav006,l_pdate_s,l_pdate_e,l_glav007,l_wdate_s,l_wdate_e
#   IF l_flag = 'Y' THEN
#      LET l_glav002_1 = l_glav002           #年度glav002,会计期glav006
#      LET l_glav006_1 = l_glav006 - 1       #取上一会计期       
#      IF l_glav006_1 = 0 THEN               #若为第一个会计期，则去上一年会计期别最大的（即上一年最后一期）
#         LET l_glav002_1 = l_glav002 - 1
#         SELECT DISTINCT MAX(glav006) INTO l_glav006_1
#           FROM glav_t
#          WHERE glavent = g_enterprise
#            AND glav001 = l_glaa003
#            AND glav002 = l_glav002_1
#      END IF        
#      #抓取当前日期上一会计期的起讫日期l_pdate_s和l_pdate_e
#      CALL s_get_accdate(l_glaa003,'',l_glav002_1,l_glav006_1)
#         RETURNING l_flag,l_errno,l_glav002,l_glav005,l_sdate_s,l_sdate_e,
#                   l_glav006,l_pdate_s,l_pdate_e,l_glav007,l_wdate_s,l_wdate_e                      
#      LET g_master.l_bdate = l_pdate_s
#      LET g_master.l_edate= l_pdate_e
#   END IF 
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.l_bdate,g_master.choice 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_bdate
            #add-point:BEFORE FIELD l_bdate name="input.b.l_bdate"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_bdate
            
            #add-point:AFTER FIELD l_bdate name="input.a.l_bdate"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_bdate
            #add-point:ON CHANGE l_bdate name="input.g.l_bdate"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD choice
            #add-point:BEFORE FIELD choice name="input.b.choice"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD choice
            
            #add-point:AFTER FIELD choice name="input.a.choice"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE choice
            #add-point:ON CHANGE choice name="input.g.choice"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.l_bdate
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_bdate
            #add-point:ON ACTION controlp INFIELD l_bdate name="input.c.l_bdate"
            
            #END add-point
 
 
         #Ctrlp:input.c.choice
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD choice
            #add-point:ON ACTION controlp INFIELD choice name="input.c.choice"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON stfasite,stfa038,stfa005,stfa036,stfa051,stfa010,stfa003,stfa045, 
             stfa046,stagenow
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.stfasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfasite
            #add-point:ON ACTION controlp INFIELD stfasite name="construct.c.stfasite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stfasite',g_site,'c')
            CALL q_ooef001_24()                            #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfasite  #顯示到畫面上
            NEXT FIELD stfasite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfasite
            #add-point:BEFORE FIELD stfasite name="construct.b.stfasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfasite
            
            #add-point:AFTER FIELD stfasite name="construct.a.stfasite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfa038
            #add-point:BEFORE FIELD stfa038 name="construct.b.stfa038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfa038
            
            #add-point:AFTER FIELD stfa038 name="construct.a.stfa038"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfa038
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfa038
            #add-point:ON ACTION controlp INFIELD stfa038 name="construct.c.stfa038"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            IF s_aooi500_setpoint(g_prog,'stfa038') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stfa038',g_site,'c')   
               CALL q_ooef001_24() 
            ELSE
               LET g_qryparam.where="ooefstus='Y'"
               CALL q_ooef001_23()  
            END IF
            DISPLAY g_qryparam.return1 TO stfa038  #顯示到畫面上
            NEXT FIELD stfa038                     #返回原欄位
            #END add-point
 
 
         #Ctrlp:construct.c.stfa005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfa005
            #add-point:ON ACTION controlp INFIELD stfa005 name="construct.c.stfa005"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa005  #顯示到畫面上
            NEXT FIELD stfa005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfa005
            #add-point:BEFORE FIELD stfa005 name="construct.b.stfa005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfa005
            
            #add-point:AFTER FIELD stfa005 name="construct.a.stfa005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfa036
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfa036
            #add-point:ON ACTION controlp INFIELD stfa036 name="construct.c.stfa036"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa036  #顯示到畫面上
            NEXT FIELD stfa036                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfa036
            #add-point:BEFORE FIELD stfa036 name="construct.b.stfa036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfa036
            
            #add-point:AFTER FIELD stfa036 name="construct.a.stfa036"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfa051
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfa051
            #add-point:ON ACTION controlp INFIELD stfa051 name="construct.c.stfa051"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_rtax001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa051  #顯示到畫面上
            NEXT FIELD stfa051                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfa051
            #add-point:BEFORE FIELD stfa051 name="construct.b.stfa051"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfa051
            
            #add-point:AFTER FIELD stfa051 name="construct.a.stfa051"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfa010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfa010
            #add-point:ON ACTION controlp INFIELD stfa010 name="construct.c.stfa010"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "('1','3')"
            CALL q_pmaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa010  #顯示到畫面上
            NEXT FIELD stfa010                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfa010
            #add-point:BEFORE FIELD stfa010 name="construct.b.stfa010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfa010
            
            #add-point:AFTER FIELD stfa010 name="construct.a.stfa010"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfa003
            #add-point:BEFORE FIELD stfa003 name="construct.b.stfa003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfa003
            
            #add-point:AFTER FIELD stfa003 name="construct.a.stfa003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfa003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfa003
            #add-point:ON ACTION controlp INFIELD stfa003 name="construct.c.stfa003"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stfa045
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfa045
            #add-point:ON ACTION controlp INFIELD stfa045 name="construct.c.stfa045"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002_2127()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa045  #顯示到畫面上
            NEXT FIELD stfa045                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfa045
            #add-point:BEFORE FIELD stfa045 name="construct.b.stfa045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfa045
            
            #add-point:AFTER FIELD stfa045 name="construct.a.stfa045"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfa046
            #add-point:BEFORE FIELD stfa046 name="construct.b.stfa046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfa046
            
            #add-point:AFTER FIELD stfa046 name="construct.a.stfa046"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfa046
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfa046
            #add-point:ON ACTION controlp INFIELD stfa046 name="construct.c.stfa046"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagenow
            #add-point:BEFORE FIELD stagenow name="construct.b.stagenow"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagenow
            
            #add-point:AFTER FIELD stagenow name="construct.a.stagenow"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stagenow
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagenow
            #add-point:ON ACTION controlp INFIELD stagenow name="construct.c.stagenow"
            
            #END add-point
 
 
 
            
            #add-point:其他管控 name="cs.other"
            
            #end add-point
            
         END CONSTRUCT
 
 
 
      
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
         
         #end add-point
         #add-point:ui_dialog段input name="ui_dialog.more_input"
         
         #end add-point
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
 
         SUBDIALOG lib_cl_schedule.cl_schedule_setting
         SUBDIALOG lib_cl_schedule.cl_schedule_setting_exec_call
         SUBDIALOG lib_cl_schedule.cl_schedule_select_show_history
         SUBDIALOG lib_cl_schedule.cl_schedule_show_history
 
         BEFORE DIALOG
            LET l_dialog = ui.DIALOG.getCurrent()
            CALL astp540_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            LET g_master.l_bdate = g_today #add by geza 20150903
            LET g_master.choice = '1'   #add by geza 20150625   
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
         CALL astp540_init()
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
                 CALL astp540_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp540_transfer_argv(ls_js)
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
 
{<section id="astp540.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp540_transfer_argv(ls_js)
 
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
 
{<section id="astp540.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp540_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_string     STRING 
   DEFINE l_string1    STRING
   DEFINE l_string2    STRING  #add by geza 20151228
   DEFINE l_msg       LIKE type_t.chr100   #160225-00040#18 2016/04/13 s983961--add
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   IF NOT cl_ask_confirm("lib-012") THEN
      RETURN
   END IF
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      IF g_master.choice = '0' THEN 
         CALL cl_progress_bar_no_window(5)   #160225-00040#18 2016/04/13 s983961--add   
      END IF 
      
      IF g_master.choice = '1' THEN 
         CALL cl_progress_bar_no_window(4)   #160225-00040#18 2016/04/13 s983961--add   
      END IF
      
      IF g_master.choice = '2' THEN 
         CALL cl_progress_bar_no_window(4)   #160225-00040#18 2016/04/13 s983961--add   
      END IF
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp540_process_cs CURSOR FROM ls_sql
#  FOREACH astp540_process_cs INTO
   #add-point:process段process name="process.process"
   CALL cl_err_collect_init()
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('ade-00114',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)
   CALL s_transaction_begin()
  
   #call astp540_insert(g_master.wc,g_master.l_bdate,g_master.l_edate)  RETURNING l_success,l_string
   IF g_master.choice = '0' OR g_master.choice = '1' THEN 
      CALL s_astp540_asti541_insert(g_master.wc,g_master.l_bdate,g_master.choice)  RETURNING l_success,l_string2  #add by geza 20151228
      #160225-00040#18 2016/04/13 s983961--add(s)
      LET l_msg = cl_getmsg('ast-00330',g_lang)   
      CALL cl_progress_no_window_ing(l_msg)
      #160225-00040#18 2016/04/13 s983961--add(e)
      CALL s_astp540_insert(g_master.wc,g_master.l_bdate,g_master.choice)  RETURNING l_success,l_string
   END IF
   IF g_master.choice = '0' OR g_master.choice = '2' THEN 
      #160225-00040#18 2016/04/13 s983961--add(s)
      LET l_msg = cl_getmsg('ast-00330',g_lang)   
      CALL cl_progress_no_window_ing(l_msg)
      #160225-00040#18 2016/04/13 s983961--add(e)
      CALL s_astp540_astt550_insert(g_master.wc,g_master.l_bdate,g_master.choice) RETURNING l_success,l_string1
   END IF     

   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('ast-00329',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)
   IF NOT l_success THEN
      CALL s_transaction_end('N','0')
   ELSE
      CALL s_transaction_end('Y','0')
   END IF
  
   #IF g_master.choice = '0' AND cl_null(l_string) AND cl_null(l_string1)  THEN #mark by geza 20151229
   #add by geza 20151229(S)
   #沒有滿足條件的資料，無結算單生成！
   IF l_success AND cl_null(l_string) AND cl_null(l_string2) AND g_master.choice = '1' THEN   
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = 'ast-00120'
      LET g_errparam.popup = TRUE
      CALL cl_err()   
   END IF    
   #add by geza 20151229(E)
   IF g_master.choice = '0' AND cl_null(l_string) AND cl_null(l_string1) AND cl_null(l_string2)  THEN #add by geza 20151229
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = 'ast-00356'
      LET g_errparam.popup = TRUE
      CALL cl_err()   
   END IF 
   CALL cl_err_collect_show()
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg)  
   #160225-00040#18 2016/04/13 s983961--add(e)   
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
      IF l_success THEN        
         #CALL s_astp540_insert_show(l_string,l_string1)     #add by geza 20150624  #mark by geza 20151228
         CALL s_astp540_insert_show(l_string,l_string1,l_string2)  #add by geza 20151228
      END IF
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
      
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL astp540_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp540.get_buffer" >}
PRIVATE FUNCTION astp540_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.l_bdate = p_dialog.getFieldBuffer('l_bdate')
   LET g_master.choice = p_dialog.getFieldBuffer('choice')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp540.msgcentre_notify" >}
PRIVATE FUNCTION astp540_msgcentre_notify()
 
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
 
{<section id="astp540.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astp540_insert1(p_wc,p_bdate,p_edate)

DEFINE p_wc           STRING
DEFINE p_bdate        DATE 
DEFINE p_edate        DATE 
DEFINE l_success      LIKE type_t.num5
DEFINE l_sql          STRING
define l_stfa005      like stfa_t.stfa005  
define l_stfjseq      like stbc_t.stbc006
define l_stfa038      like stfa_t.stfa038
define r_string       string
define r_success      LIKE type_t.num5
DEFINE l_stbddocno    LIKE stbd_t.stbddocno
#
#  WHENEVER ERROR CALL cl_err_msg_log
#
#   LET r_success = TRUE
#   LET r_string=''
#
#
#  ####################### #########客制  
#  LET l_sql=" select * from (select  stfa005,stfjseq,stfa038,rank()over(partition by stfa005,stfjseq,stfa038 order by stfj004 )mm from stfa_t,stfj_t ",
##            "  where stfaent=stbcent and stfa001=stbc030 and stfa005=stbc033 ",
#            " where  stfaent=stfjent and stfa001 =stfj001 ",
#            " and stfj004 between to_date('",p_bdate,"','yy/mm/dd') and to_date('",p_edate,"')", 
#            " and stfj005='N' and ",p_wc CLIPPED,") where mm=1 "
#  ################################客制
#   PREPARE s_astp540_stfa_pre FROM l_sql
#   DECLARE s_astp540_stfa_cur CURSOR FOR s_astp540_stfa_pre
#
#
#   FOREACH s_astp540_stfa_cur INTO l_stfa005,l_stfjseq,l_stfa038  
#      #結算單單頭
#      CALL s_astp540_insert_stbd(l_stfa005,l_stfjseq,l_stfa038,p_bdate,p_edate) RETURNING l_success,l_stbddocno
#      IF NOT l_success THEN
#         CONTINUE FOREACH                  
#      END IF    
#      
#      #結算單單身
#      CALL s_astp540_insert_stbe(l_stbddocno) RETURNING l_success
#      IF NOT l_success THEN
#      
#      delete from stbd_t where stbddocno=l_stbddocno
#         CONTINUE FOREACH                  
#      END IF
#      
#     #單頭金額更新
#      CALL s_astp540_stbe_summary(l_stbddocno) RETURNING l_success
#      IF NOT l_success THEN
#
#         CONTINUE FOREACH    
#      END IF 
#      
#
#    
#      IF cl_null(r_string) THEN
#         LET r_string=" stbddocno IN (","'",l_stbddocno,"'"
#      ELSE
#         LET r_string=r_string CLIPPED,",'",l_stbddocno,"'"  
#      END IF         
#   END FOREACH      
#    
#   IF NOT cl_null(r_string) THEN
#      LET r_string=r_string CLIPPED,")"
#   END IF
#
#   #沒有滿足條件的資料，無結算單生成！
#   #IF r_success AND cl_null(r_string) THEN                      
#   IF r_success AND cl_null(r_string)  THEN    
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = ""
#      LET g_errparam.code = 'ast-00120'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()   
#   END IF    
#
#   RETURN r_success,r_string

END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION s_astp540_insert_stbd1(p_stfa005,p_stfjseq,p_stfa038,p_bdate,p_edate)

DEFINE p_stfa005      LIKE stfa_t.stfa005
DEFINE p_stfjseq      LIKE stbc_t.stbc006
define p_stfa038      like stfa_t.stfa038
DEFINE r_success      LIKE type_t.num5
DEFINE r_stbddocno    LIKE stbd_t.stbddocno
DEFINE l_success      LIKE type_t.num5
#161111-00028#3--mark---begin---------
#DEFINE l_stfa  RECORD  LIKE stfa_t.*
#DEFINE l_stbd  RECORD  LIKE stbd_t.*
#define l_stfj  record  like stfj_t.*
#161111-00028#3--mark---end---------
DEFINE r_doctype      LIKE type_t.chr10
DEFINE l_cnt          LIKE type_t.num10
DEFINE l_stbdcrtdt    DATETIME YEAR TO SECOND
define p_bdate       date 
define p_edate       date 
#DEFINE l_stan009        LIKE stan_t.stan009
#DEFINE l_staa006        LIKE staa_t.staa006
#   LET r_success = TRUE
#   LET r_stbddocno=''
#
#   IF cl_null(p_stfa005) or cl_null(p_stfjseq) or cl_null(p_stfa038) THEN
#      LET r_success=FALSE
#      RETURN r_success,r_stbddocno
#   END IF
#   
#   INITIALIZE l_stfa.* TO NULL
#   
#   SELECT * INTO l_stfa.*
#     FROM stfa_t
#    WHERE stfaent=g_enterprise
#      AND stfa005=p_stfa005
#      and stfa038=p_stfa038
#     
#
#   select * into l_stfj.* 
#     from  stfj_t
#    where  stfjent=g_enterprise
#      and  stfj001=l_stfa.stfa001
#      and  stfjseq=p_stfjseq
#     
# 
# 
#   INITIALIZE l_stbd.* TO NULL
#   #檢查結算單，此結算中心的單筆設定
#  #檢查結算單會計期設定（g_today）
##   IF NOT s_astp540_insert_check(l_stfa.stfa038,g_today) THEN
##      LET r_success=FALSE
##      RETURN r_success,r_stbddocno
##   END IF
#  
#   #檢查結算單合同的时候判断结算方式是现结,不通过批处理产生  #客制  
##   LET l_cnt = 0
##   SELECT COUNT(*) INTO l_cnt
##     FROM staa_t
##    WHERE staaent = g_enterprise
##      AND staa001 = l_stan.stan009
##      AND staa002 = 0
##      AND staa003 = 1
##   IF l_cnt > 0 THEN
##      LET r_success=FALSE
##      RETURN r_success,r_stbddocno
##   END IF
##add by geza 20150712(E)
#   
#  #抓取默認單別arti200的設定
#  
#   CALL s_arti200_get_def_doc_type(l_stfa.stfa038,'astt340','2') RETURNING l_success,r_doctype
#   IF NOT l_success THEN
#      LET r_success=FALSE
#      RETURN r_success,r_stbddocno  
#  
#   END IF
#
#   #自動編號
#   CALL s_aooi200_gen_docno(l_stfa.stfa038,r_doctype,g_today,'astt340') RETURNING l_success,l_stbd.stbddocno
#   IF NOT l_success THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'apm-00003'
#      LET g_errparam.extend = r_doctype
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success=FALSE
#      RETURN r_success,r_stbddocno   
#      
#   END IF  
#   let l_stbd.stbd000='2'  #单据类型
#   LET l_stbd.stbdent=l_stfa.stfaent
#   LET l_stbd.stbdunit=l_stfa.stfa038              #結算中心  #By shi 20150709
#   LET l_stbd.stbdsite=l_stfa.stfa038              #結算门店  #By shi 20150709
#   LET l_stbd.stbddocno=l_stbd.stbddocno
#   LET l_stbd.stbddocdt=g_today
#   LET l_stbd.stbd001=l_stfa.stfa001                #合同編號
#   LET l_stbd.stbd037=l_stfa.stfa005                #专柜编号
#   LET l_stbd.stbd002=l_stfa.stfa010                #供應商
#   LET l_stbd.stbd003=l_stfa.stfa003                #经营方式
#   let l_stbd.stbd004=p_stfjseq
##   SELECT MIN(staxseq) INTO l_stbd.stbd004          #結算賬期
##     FROM stax_t
##    WHERE staxent=g_enterprise
##      AND stax001=l_stbd.stbd001
##      AND stax005='N'
#      
#   let  l_stbd.stbd005 = l_stfj.stfj002
#   let  l_stbd.stbd006 = l_stfj.stfj003  #起始日期 #截止日期
#   
#   LET l_stbd.stbd009=0                             #本期進貨金額
#   LET l_stbd.stbd010=0                             #本期退貨金額
#   LET l_stbd.stbd011=0                             #本期折讓金額
#   LET l_stbd.stbd014=0                             #本期預付金額
#
#   LET l_stbd.stbd016='N'                           #貨款扣費用否
#   LET l_stbd.stbd020='0'                           #結算標識
#   let l_stbd.stbd018=0
#   let l_stbd.stbd019=0
#   
#   LET l_stbd.stbd021=g_user                       #人員
#   LET l_stbd.stbd022=g_dept                        #部門          
#   LET l_stbd.stbdstus='N'                         #狀態碼  
#   
#   LET l_stbd.stbdownid = g_user
#   LET l_stbd.stbdowndp = g_dept
#   LET l_stbd.stbdcrtid = g_user
#   LET l_stbd.stbdcrtdp = g_dept
#   let l_stbd.stbd023   = p_stfa038
#   LET l_stbdcrtdt=cl_get_current()
#   LET l_stbd.stbdcrtdt=l_stbdcrtdt
##   LET l_stbd.stbd000= '1'  #add by geza 20150610
##   LET l_stbd.stbd039= '2'  #add by geza 20150707
##   
#   #查出预付款加天     #add by geza    #20150713(S)
##   SELECT stan009 INTO l_stan009 
##     FROM stan_t
##    WHERE stanent = g_enterprise
##      AND stan001 = l_stan.stan001   
##   
##   SELECT staa006 INTO l_staa006 
##     FROM staa_t
##    WHERE staaent = g_enterprise    
##      AND staa001 = l_stan009
##   
##   IF cl_null(l_staa006) THEN
##      LET l_staa006= '0'
##   END IF
##   LET l_stbd.stbd038 =  l_stbd.stbd006 + l_staa006  #20150709 By shi
#   
#   
#   INSERT INTO stbd_t VALUES (l_stbd.*)    
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = "ins stbd_t"
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success=FALSE
#      RETURN r_success,r_stbddocno 
#    
#   END IF  
#   
#   LET r_stbddocno=l_stbd.stbddocno
#   RETURN r_success,r_stbddocno

END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION s_astp540_insert_stbe1(p_stbddocno)
DEFINE p_stbddocno   LIKE stbd_t.stbddocno
DEFINE r_success     LIKE type_t.num5
DEFINE l_stbdunit    LIKE stbd_t.stbdunit
define l_stbdsite    like stbd_t.stbdsite
DEFINE l_stbd001     LIKE stbd_t.stbd001
DEFINE l_stbd037     LIKE stbd_t.stbd037
DEFINE l_stbd004     LIKE stbd_t.stbd004
DEFINE l_stfj004     LIKE stfj_t.stfj004
define l_stbd005    like stbd_t.stbd005
define l_stbd006   like stbd_t.stbd006 
#DEFINE l_stbc        RECORD LIKE stbc_t.*  #161111-00028#3--mark
#DEFINE l_stbe        RECORD LIKE stbe_t.*  #161111-00028#3--mark
DEFINE l_sql         STRING
DEFINE l_cnt         LIKE type_t.num10
DEFINE l_rtdxcrtdt   DATETIME YEAR TO SECOND  
define l_count     integer
#DEFINE l_stan030     LIKE stan_t.stan030
#   LET r_success=TRUE
#   
#   IF cl_null(p_stbddocno) THEN
#      LET r_success=FALSE
#      RETURN r_success   
#   END IF
#
#   SELECT stbdunit,stbdsite,stbd001,stbd037,stbd004,stbd005,stbd006           
#     INTO l_stbdunit,l_stbdsite,l_stbd001,l_stbd037,l_stbd004,l_stbd005,l_stbd006 
#     FROM stbd_t
#    WHERE stbdent=g_enterprise
#      AND stbddocno=p_stbddocno
#   select stfj004 into l_stfj004 from stfj_t where stfj001=l_stbd001 and stfjseq=l_stbd004 and stfjent=g_enterprise
#   
##  #add by geza 20150624 150616-00035#14(S)
##  #查询旧的合同编号
##  INITIALIZE l_stan030 TO NULL
##  SELECT stan030 INTO l_stan030
##    FROM stan_t  
##   WHERE stanent = g_enterprise  
##     AND stan001 = l_stbd001
##  #astp340产生结算单时，如果单身没有资料，自动审核（客制）#add by geza 20150707    mark by geza 20150716
##  #astp340产生结算单时，如果单身没有资料，自动删除单头（客制）#add by geza 20150707
##   LET l_cnt = 0  
###   SELECT COUNT(*) INTO l_cnt 
###     FROM stbc_t 
###    WHERE stbcent=g_enterprise
###      AND stbc001=l_stbdsite
###      AND stbc008=l_stbd002
###      AND stbc009=l_stbd003
###      AND (stbcstus='1' OR stbcstus='3')
###      AND stbc002<=l_stbd006
###      AND stbc030 =l_stbd001        
###      AND (stbc003='1' OR stbc003='2' OR (stbc003='3' AND stbc037 = 'Y' ) OR stbc003 = '8' OR stbc003 = '9' OR stbc003 = '10' )
###      AND stbcua001 = p_stbcua001 
##   IF cl_null(l_stan030) THEN    
##      SELECT COUNT(*) INTO l_cnt 
##        FROM stbc_t 
##       WHERE stbcent=g_enterprise
##         AND stbc001=l_stbdsite
##         AND stbc008=l_stbd002
##         AND stbc009=l_stbd003
##         AND (stbcstus='1' OR stbcstus='3')
##         AND stbc002<=l_stbd006
##         AND stbc030 =l_stbd001  
##        # AND (stbc003='1' OR stbc003='2' OR (stbc003='3' AND stbc037 = 'Y' ) OR stbc003 = '8' OR stbc003 = '9' OR stbc003 = '10' )   #mark by geza 20150706       
##        # AND (stbc003='1' OR stbc003='2' OR (stbc003='3' AND stbc037 = 'Y' ) OR stbc003 = '8' OR stbc003 = '9' OR stbc003 = '10' OR stbc003 = 'A' OR stbc003 = 'B' OR stbc003 = '11'  )   #客制 add by geza 20150706 加类型A联营（扣率代销），B租赁（扣率代销） add by geza 20150714 加类型11 供应商往来调整
##         AND (stbc003='1' OR stbc003='2' OR stbc003='3' OR stbc003 = '8' OR stbc003 = '9' OR stbc003 = '10' OR stbc003 = 'A' OR stbc003 = 'B' OR stbc003 = '11'  OR stbc003 = '12' )   #add by geza 20150714 加类型11 供应商往来调整    加类型12 供应商领用单
##   ELSE
##      SELECT COUNT(*) INTO l_cnt 
##        FROM stbc_t 
##       WHERE stbcent=g_enterprise
##         AND stbc001=l_stbdsite
##         AND stbc008=l_stbd002
##         AND stbc009=l_stbd003
##         AND (stbcstus='1' OR stbcstus='3')
##         AND stbc002<=l_stbd006
##         AND (stbc030 =l_stbd001  OR stbc030 =l_stan030  )
##         #AND (stbc003='1' OR stbc003='2' OR (stbc003='3' AND stbc037 = 'Y' ) OR stbc003 = '8' OR stbc003 = '9' OR stbc003 = '10' )  #mark by geza 20150706   
##         #AND (stbc003='1' OR stbc003='2' OR (stbc003='3' AND stbc037 = 'Y' ) OR stbc003 = '8' OR stbc003 = '9' OR stbc003 = '10' OR stbc003 = 'A' OR stbc003 = 'B' OR stbc003 = '11'  )  #客制 add by geza 20150706 加类型A联营（扣率代销），B租赁（扣率代销）add by geza 20150714 加类型11 供应商往来调整
##         AND (stbc003='1' OR stbc003='2' OR stbc003='3' OR stbc003 = '8' OR stbc003 = '9' OR stbc003 = '10' OR stbc003 = 'A' OR stbc003 = 'B' OR stbc003 = '11'  OR stbc003 = '12'  )   #add by geza 20150714 加类型11 供应商往来调整  加类型12 供应商领用单
##   END IF
##   IF l_cnt = 0  THEN                  
##      DELETE FROM stbd_t
##       WHERE stbdent=g_enterprise
##         AND stbddocno=p_stbddocno 
##      
##      LET r_success=FALSE
##      RETURN r_success       
###     UPDATE stbd_t 
###        SET stbdstus = 'Y'  
###      WHERE stbdent = g_enterprise AND stbddocno = p_stbddocno   
##         
##      IF SQLCA.sqlcode THEN
##         INITIALIZE g_errparam TO NULL
##         LET g_errparam.code = SQLCA.sqlcode
##         LET g_errparam.extend = "DELETE stbd_t"
##         LET g_errparam.popup = TRUE
##         CALL cl_err()
##      
##         LET r_success=FALSE
##         RETURN r_success    
##      END IF
##    
##   END IF 
##   #add by geza 20150624 150616-00035#14(E)
#
##   LET l_sql = "SELECT * FROM stbc_t",
##               " WHERE stbcent='",g_enterprise,"'",
##               "   AND stbc001='",l_stbdsite,"'",
##               "   AND stbc008='",l_stbd002,"'",
##               "   AND stbc009='",l_stbd003,"'",
##               "   AND (stbcstus='1' OR stbcstus='3')",
##               "   AND stbc002<='",l_stbd006,"'",
##             #  "   AND (stbc003='1' OR stbc003='2' OR stbc003='3')", #mark by geza 20150610
##               "   AND stbc030 ='",l_stbd001,"'",        #add by geza 20150608
##               "   AND (stbc003='1' OR stbc003='2' OR stbc003='3' OR stbc003 = '8' OR stbc003 = '9' OR stbc003 = '10')",  #add by geza 20150610  
##               "   AND stbcua001 = '",p_stbcua001,"'",
##               "   ORDER BY stbc003 ASC,stbc015 DESC"
#    LET l_sql = "select * from stbc_t where stbc027 ='3' and stbc037='Y' and stbcstus in (1,3) ",
#                " and stbc030 =",l_stbd001," and stbc001= '",l_stbdunit,"'  and stbc033 = ",l_stbd037," and stbc040=to_date('",l_stfj004,"','yy/mm/dd') "
#   
#   PREPARE astp540_insert_stbc_pb FROM l_sql
#   DECLARE astp540_insert_stbc_cur CURSOR FOR astp540_insert_stbc_pb
#       
#
#   INITIALIZE l_stbc.* TO NULL
#   
#   FOREACH astp540_insert_stbc_cur INTO l_stbc.*
#
#      INITIALIZE l_stbe.* TO NULL
#      LET l_stbe.stbeent=g_enterprise
#      LET l_stbe.stbesite=l_stbdsite
#      SELECT ooef017 INTO l_stbe.stbecomp
#        FROM ooef_t
#       WHERE ooefent = g_enterprise
#         AND ooef001 = l_stbdsite
#
#      LET l_stbe.stbedocno=p_stbddocno
#            
#      SELECT MAX(stbeseq)+1 INTO l_stbe.stbeseq
#        FROM stbe_t
#       WHERE stbeent=g_enterprise
#         AND stbedocno=p_stbddocno
#         
#      IF cl_null(l_stbe.stbeseq) THEN
#         LET l_stbe.stbeseq=1
#      END IF               
## 07/22
#      LET l_stbe.stbe001=l_stbc.stbc003
#      LET l_stbe.stbe002=l_stbc.stbc004
#      LET l_stbe.stbe003=l_stbc.stbc005
#      LET l_stbe.stbe004=l_stbc.stbc002
#      LET l_stbe.stbe005=l_stbc.stbc012
#      
#      LET l_stbe.stbe006=l_stbd005
#      LET l_stbe.stbe007=l_stbd006
#      LET l_stbe.stbe008=l_stbc.stbc013
#      LET l_stbe.stbe009=l_stbc.stbc014
#      
#      LET l_stbe.stbe010=l_stbc.stbc015
#      LET l_stbe.stbe011=l_stbc.stbc016
#      LET l_stbe.stbe012=l_stbc.stbc017
#      LET l_stbe.stbe013=l_stbc.stbc018
#      
#      LET l_stbe.stbe014=l_stbc.stbc019
#      LET l_stbe.stbe015=l_stbc.stbc020
#      
#      LET l_stbe.stbe016=l_stbc.stbc017
#      LET l_stbe.stbe017=l_stbc.stbc010
#      LET l_stbe.stbe018=l_stbc.stbc011
#      
#      LET l_stbe.stbe019=l_stbc.stbc025
#      LET l_stbe.stbe020=l_stbc.stbc026
##      LET l_stbe.stbe021='0' #add  by geza 20150604
##      LET l_stbe.stbe022='0' #add  by geza 20150604
##      LET l_stbe.stbe023='0' #add  by geza 20150604
#      #本次結算數量=底稿中的數量-已立帳數量，單價=底稿中單價---huangrh add 20150604---
##      LET l_stbe.stbe026=l_stbc.stbc034-l_stbc.stbc035
##      LET l_stbe.stbe027=l_stbc.stbc036 
#      #本次纳入结算单否，票扣否---geza add 20150610---
#      LET l_stbe.stbe024=l_stbc.stbc037
#      LET l_stbe.stbe025=l_stbc.stbc038        
##      LET l_stbe.stbe031=l_stbc.stbc039  #结算扣率---geza add 20150706---
#       INSERT INTO stbe_t VALUES (l_stbe.*)    
#       IF SQLCA.sqlcode THEN
#          INITIALIZE g_errparam TO NULL
#          LET g_errparam.code = SQLCA.sqlcode
#          LET g_errparam.extend = "into stbe_t"
#          LET g_errparam.popup = TRUE
#          CALL cl_err()
#
#          LET r_success=FALSE
#          RETURN r_success    
#       END IF
#       #mark by geza 20150629(S)
##       UPDATE stbc_t SET stbcstus='2'
##        WHERE stbcent=g_enterprise
##          AND stbc001=l_stbc.stbc001
##          AND stbc004=l_stbc.stbc004
##          AND stbc005=l_stbc.stbc005
#       #mark by geza 20150629(E)          
#       ########################客制  
#
#       LET l_rtdxcrtdt = cl_get_current()
#       UPDATE stbc_t SET stbcstus='2',
#                         stbcud021 = l_rtdxcrtdt
#        WHERE stbcent=g_enterprise
#          AND stbc001=l_stbc.stbc001
#          AND stbc004=l_stbc.stbc004
#          AND stbc005=l_stbc.stbc005
#
#       ########################客制             
#       IF SQLCA.sqlcode THEN
#          INITIALIZE g_errparam TO NULL
#          LET g_errparam.code = SQLCA.sqlcode
#          LET g_errparam.extend = "update stbc_t"
#          LET g_errparam.popup = TRUE
#          CALL cl_err()
#
#          LET r_success=FALSE
#          RETURN r_success    
#       END IF
#   END FOREACH
#   
#   
#   FREE astp540_insert_stbc_pb
#  select count(*)  into l_count from stbe_t where stbedocno=p_stbddocno
#  if l_count>0 then 
#   RETURN r_success
#  else 
#  LET r_success=FALSE
#  RETURN r_success  
#end if 
#
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION s_astp540_insert_check1(p_stfa038,p_date)

DEFINE p_stfa038         LIKE stfa_t.stfa038
DEFINE p_date           LIKE stax_t.stax004
DEFINE r_success      LIKE type_t.num5
DEFINE r_doctype      LIKE rtai_t.rtai004
DEFINE l_errno        LIKE type_t.chr100
#
#   LET r_success = TRUE
#   
#   #檢查默認單別arti200的設定
#   CALL s_arti200_get_def_doc_type(p_stfa038,'astt340','2') RETURNING r_success,r_doctype
#   IF NOT r_success THEN
#      LET r_success=FALSE
#      RETURN r_success
#   END IF  
#   
#   
#   #檢查有關零售結算單的會計期asti206的設定，
#   CALL s_asti206_check(p_stfa038,p_date,'astt340') RETURNING r_success,l_errno
#   IF NOT r_success THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = l_errno
#      LET g_errparam.extend = p_stfa038
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success=FALSE
#      RETURN r_success
#   END IF  
#
#   RETURN r_success
#   
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION s_astp540_stbe_summary1(p_stbddocno)

DEFINE p_stbddocno   LIKE stbd_t.stbddocno
#DEFINE l_stbd        RECORD LIKE stbd_t.*  #161111-00028#3--mark
DEFINE  l_stbd012      LIKE stbd_t.stbd012
DEFINE  l_stbd012_1    LIKE stbd_t.stbd012
DEFINE  l_ooef016      LIKE ooef_t.ooef016
DEFINE  l_ooef019      LIKE ooef_t.ooef019
#
#
#   WHENEVER ERROR CALL cl_err_msg_log
#   
#   IF cl_null(p_stbddocno) THEN
#      RETURN FALSE
#   END IF
#
#   SELECT * INTO l_stbd.* FROM stbd_t
#    WHERE stbdent = g_enterprise AND stbddocno = p_stbddocno
#   #币种 
#   SELECT ooef016 INTO l_ooef016 FROM ooef_t
#   WHERE ooefent=g_enterprise AND ooef001=l_stbd.stbdsite  
#
#   #上期結存金額
#   SELECT stbd019 INTO l_stbd.stbd007
#     FROM stbd_t
#    WHERE stbdent=g_enterprise
#      AND stbd037=l_stbd.stbd037
#      and stbdsite=l_stbd.stbdsite
#      AND stbe004=l_stbd.stbd004-1
#
#   IF cl_null(l_stbd.stbd007) THEN 
#      LET l_stbd.stbd007=0
#   END IF 
#   CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd007,'2') RETURNING l_stbd.stbd007
#   
##   #本期銷貨成本
##   IF cl_null(l_stbd.stbd008) THEN 
##      LET l_stbd.stbd008=0
##   END IF             
##   CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd008,'2') RETURNING l_stbd.stbd008
##   
##   #本期進貨金額            
##   SELECT SUM(stbe013) INTO l_stbd.stbd009
##     FROM stbe_t
##    WHERE stbeent=g_enterprise
##      AND stbedocno=p_stbddocno
##     # AND stbe001='1' #mark by geza 20150610
##     # AND (stbe001='1' OR stbe001='8')  #add by geza 20150610  #mark by geza 20150706 
##      AND (stbe001='1' OR stbe001='8' OR stbe001='A' OR stbe001='B' OR stbe001='11' )   #客制 add by geza 20150706 加类型A联营（扣率代销），B租赁（扣率代销） add by geza 20150714 加类型11 供应商往来调整
##      AND stbe004>=l_stbd.stbd005
##      AND stbe004<=l_stbd.stbd006
##   IF cl_null(l_stbd.stbd009) THEN 
##      LET l_stbd.stbd009=0
##   END IF 
##   CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd009,'2') RETURNING l_stbd.stbd009
##
##   #本期退貨金額            
##   SELECT SUM(stbe013) INTO l_stbd.stbd010
##     FROM stbe_t
##    WHERE stbeent=g_enterprise
##      AND stbedocno=p_stbddocno
##      AND stbe001='2'
##      #AND (stbe001<>'3' OR stbe010<>'1')
##      AND stbe004>=l_stbd.stbd005
##      AND stbe004<=l_stbd.stbd006
##   IF cl_null(l_stbd.stbd010) THEN 
##      LET l_stbd.stbd010=0
##   END IF  
##   CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd010,'2') RETURNING l_stbd.stbd010
##
##   #本期折讓金額            
###   SELECT SUM(stbe013) INTO l_stbd.stbd011  #150601-00005#27 By geza
##   SELECT SUM(stbe013*stbe011) INTO l_stbd.stbd011   #150601-00005#27 By geza
##     FROM stbe_t
##    WHERE stbeent=g_enterprise
##      AND stbedocno=p_stbddocno
##     #AND NOT (stbe001='3' AND stbe010 = '2')   #150204-00001#27 By shi
##     #AND (stbe001='3' AND stbe010 = '2')       #150204-00001#27 By shi #mark by geza 20150610
##      AND stbe001='3'    #add by geza 20150610
##      AND stbe024 = 'Y'  #add by geza 20150713
##      AND stbe004>=l_stbd.stbd005
##      AND stbe004<=l_stbd.stbd006               
##   IF cl_null(l_stbd.stbd011) THEN 
##      LET l_stbd.stbd011=0
##   END IF
##    CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd011,'2') RETURNING l_stbd.stbd011 
##    
##   #本期折讓金額    #20150717 By geza        
##   SELECT SUM(stbe013*stbe011) INTO l_stbd.stbdud012   #150601-00005#27 By geza
##     FROM stbe_t
##    WHERE stbeent=g_enterprise
##      AND stbedocno=p_stbddocno
##      AND stbe001='12' 
##      AND stbe024 = 'Y'      
##      AND stbe004>=l_stbd.stbd005
##      AND stbe004<=l_stbd.stbd006               
##   IF cl_null(l_stbd.stbdud012) THEN 
##      LET l_stbd.stbdud012=0
##   END IF
##   CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbdud012,'2') RETURNING l_stbd.stbdud012 
##   #20150717 By geza   
##   
##   #稅額合計
###   SELECT SUM(stbe013-stbe012) INTO l_stbd012  #mark by geza 20150602
##    SELECT SUM((stbe013-stbe012)*(CASE stbe001 WHEN '3' THEN (-1*stbe011) ELSE stbe011 END)) INTO l_stbd012  #mark by geza 20150602
##     FROM stbe_t
##    WHERE stbeent=g_enterprise
##      AND stbedocno=p_stbddocno
##     #AND NOT (stbe001 = '3' AND stbe010 = '2')   #150204-00001#27 By shi
##     #AND NOT (stbe001 = '3' AND stbe010 = '1')   #150204-00001#27 By shi
##      AND stbe004>=l_stbd.stbd005
##      AND stbe004<=l_stbd.stbd006 
##      
##   IF cl_null(l_stbd012) THEN 
##      LET l_stbd012=0
##   END IF 
##   
##   SELECT ooef019 INTO l_ooef019
##     FROM ooef_t
##    WHERE ooefent=g_enterprise
##      AND ooef001=l_stbd.stbdsite
##      
##   SELECT SUM((stbe014-stbe014/(1+oodb006/100))) INTO l_stbd012_1
##     FROM stbu_t,oodb_t
##    WHERE stbuent = g_enterprise
##      AND stbuent=oodbent
##      AND oodb001 = l_ooef019
##      AND oodb002 = stbe009
##      AND stbedocno=p_stbddocno
##      AND stbe004<l_stbd.stbd005
##
##   IF cl_null(l_stbd012_1) THEN 
##      LET l_stbd012_1=0
##   END IF
##   
##   LET l_stbd.stbd012 =  l_stbd012 + l_stbd012_1 
##   CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd012,'2') RETURNING l_stbd.stbd012    
#   
#   #價稅合計
#   select sum(stbe012) into l_stbd.stbd013 from stbe_t 
#    where stbedocno=l_stbd.stbddocno
#      and stbe001='4'
#
#   IF cl_null(l_stbd.stbd013) THEN 
#      LET l_stbd.stbd013=0
#   END IF 
#   CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd013,'2') RETURNING l_stbd.stbd013  
#  
##   #本期預付金額
##   IF cl_null(l_stbd.stbd014) THEN 
##      LET l_stbd.stbd014=0
##   END IF            
##    CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd014,'2') RETURNING l_stbd.stbd014  
#    
# #税额合计
# select sum(stbe013-stbe012) into l_stbd.stbd012 from  stbe_t
#  where stbedocno=l_stbd.stbddocno
#    and stbe001='4'
#   IF cl_null(l_stbd.stbd012) THEN 
#      LET l_stbd.stbd012=0
#   END IF 
#   CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd012,'2') RETURNING l_stbd.stbd012  
#  
#    
##本期销货成本
#    select sum(stbe012) into l_stbd.stbd008 from stbe_t 
#    where stbedocno=l_stbd.stbddocno
#      and stbe001='4'
#
#   IF cl_null(l_stbd.stbd008) THEN 
#      LET l_stbd.stbd008=0
#   END IF 
#   CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd008,'2') RETURNING l_stbd.stbd008 
#
#
##本期价外扣款
#    select sum(stbe012) into l_stbd.stbd015 from stbe_t 
#    where stbedocno=l_stbd.stbddocno
#      and stbe001='3'
#
#   IF cl_null(l_stbd.stbd015) THEN 
#      LET l_stbd.stbd015=0
#   END IF 
#   CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd015,'2') RETURNING l_stbd.stbd015 
#
##应结算金额
# 
# let l_stbd.stbd017=l_stbd.stbd013 - l_stbd.stbd012 - l_stbd.stbd015 
# 
#  CALL s_curr_round(l_stbd.stbdsite,l_ooef016,l_stbd.stbd017,'2') RETURNING l_stbd.stbd017 
#      
#      
#   UPDATE stbd_t SET stbd007=l_stbd.stbd007,
#                     stbd008=l_stbd.stbd008,
#                     stbd012=l_stbd.stbd012,
#                     stbd013=l_stbd.stbd013,
#                     stbd015=l_stbd.stbd015,
#                     stbd017=l_stbd.stbd017                   
#    WHERE stbdent=g_enterprise
#      AND stbddocno=p_stbddocno
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = "update stbd_t"
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      RETURN FALSE
#   END IF
#
#   RETURN TRUE


END FUNCTION

#end add-point
 
{</section>}
 
