#該程式未解開Section, 採用最新樣板產出!
{<section id="astp613.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0002(2014-12-16 11:27:37), PR版次:0002(2016-04-14 10:01:37)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000065
#+ Filename...: astp613
#+ Description: 經銷商返利費用批次處理作業
#+ Creator....: 03247(2014-11-20 16:57:02)
#+ Modifier...: 01726 -SD/PR- 06815
 
{</section>}
 
{<section id="astp613.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#Memos
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
       prdw007 LIKE prdw_t.prdw007, 
   prdw006 LIKE prdw_t.prdw006, 
   prdw001 LIKE prdw_t.prdw001, 
   pmaa001 LIKE pmaa_t.pmaa001, 
   prdd004 LIKE prdd_t.prdd004, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_pmaa001_wc     STRING
DEFINE g_settle_date    LIKE prdd_t.prdd004
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astp613.main" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
   
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
      CALL astp613_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp613 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp613_init()
 
      #進入選單 Menu (="N")
      CALL astp613_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp613
   END IF
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp613.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp613_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   
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
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp613.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp613_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"
   
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   INITIALIZE g_master.* TO NULL
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
 
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.prdd004 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               IF cl_null(g_master.prdd004) THEN
                 #LET g_settle_date = cl_get_para(g_enterprise,g_site,'S-CIR-0001')
                 #LET g_master.prdd004 = g_settle_date
                 #IF cl_null(g_master.prdd004) THEN 
                     LET g_master.prdd004 = g_today - 1 
                 #END IF
                  DISPLAY g_master.prdd004 TO prdd004
               END IF
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD prdd004
            #add-point:BEFORE FIELD prdd004 name="input.b.prdd004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD prdd004
            
            #add-point:AFTER FIELD prdd004 name="input.a.prdd004"
           #IF NOT cl_null(g_master.prdd004) THEN
           #   LET g_settle_date = cl_get_para(g_enterprise,g_site,'S-CIR-0001')
           #   IF g_settle_date < g_master.prdd004 THEN
           #      INITIALIZE g_errparam TO NULL
           #      LET g_errparam.code = '' #促销日期不可大于日结日期
           #      LET g_errparam.extend = ''
           #      LET g_errparam.popup = TRUE
           #      CALL cl_err()
           #      NEXT FIELD CURRENT
           #   END IF
           #END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE prdd004
            #add-point:ON CHANGE prdd004 name="input.g.prdd004"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.prdd004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD prdd004
            #add-point:ON ACTION controlp INFIELD prdd004 name="input.c.prdd004"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON prdw007,prdw006,prdw001
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               IF cl_null(g_master.prdd004) THEN
                 #LET g_settle_date = cl_get_para(g_enterprise,g_site,'S-CIR-0001')
                 #LET g_master.prdd004 = g_settle_date
                 #IF cl_null(g_master.prdd004) THEN 
                     LET g_master.prdd004 = g_today - 1 
                 #END IF
                  DISPLAY g_master.prdd004 TO prdd004
               END IF
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.prdw007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD prdw007
            #add-point:ON ACTION controlp INFIELD prdw007 name="construct.c.prdw007"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2'
            CALL q_prcd001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO prdw007  #顯示到畫面上
            NEXT FIELD prdw007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD prdw007
            #add-point:BEFORE FIELD prdw007 name="construct.b.prdw007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD prdw007
            
            #add-point:AFTER FIELD prdw007 name="construct.a.prdw007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.prdw006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD prdw006
            #add-point:ON ACTION controlp INFIELD prdw006 name="construct.c.prdw006"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2'
            CALL q_prcf001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO prdw006  #顯示到畫面上
            NEXT FIELD prdw006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD prdw006
            #add-point:BEFORE FIELD prdw006 name="construct.b.prdw006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD prdw006
            
            #add-point:AFTER FIELD prdw006 name="construct.a.prdw006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.prdw001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD prdw001
            #add-point:ON ACTION controlp INFIELD prdw001 name="construct.c.prdw001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '31'
            LET g_qryparam.arg2 = '2'
            CALL q_prdw001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO prdw001  #顯示到畫面上
            NEXT FIELD prdw001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD prdw001
            #add-point:BEFORE FIELD prdw001 name="construct.b.prdw001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD prdw001
            
            #add-point:AFTER FIELD prdw001 name="construct.a.prdw001"
            
            #END add-point
            
 
 
 
            
            #add-point:其他管控 name="cs.other"
            
            #end add-point
            
         END CONSTRUCT
 
 
 
      
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
         CONSTRUCT BY NAME g_pmaa001_wc ON pmaa001
         
            ON ACTION controlp INFIELD pmaa001
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c' 
               LET g_qryparam.reqry = FALSE
               CALL q_pmaa001_13()
               DISPLAY g_qryparam.return1 TO pmaa001 
               NEXT FIELD pmaa001
               
         END CONSTRUCT
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
            CALL astp613_get_buffer(l_dialog)
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
         CALL astp613_init()
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
                 CALL astp613_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp613_transfer_argv(ls_js)
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
 
{<section id="astp613.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp613_transfer_argv(ls_js)
 
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
   LET la_cmdrun.param[1] = g_master.wc
   LET la_cmdrun.param[2] = g_master.prdd004
   #end add-point
 
   RETURN util.JSON.stringify( la_cmdrun )
END FUNCTION
 
{</section>}
 
{<section id="astp613.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp613_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   DEFINE l_success   LIKE type_t.num5
   DEFINE l_doctype   LIKE rtai_t.rtai004  #缺省的单据别
   DEFINE l_sql       STRING
   DEFINE l_wc        STRING
   DEFINE l_stav002   LIKE stav_t.stav002
   DEFINE l_cnt       LIKE type_t.num5
   DEFINE l_prdadocno LIKE prda_t.prdadocno
   DEFINE l_prdw027   LIKE prdw_t.prdw027
   DEFINE l_msg       LIKE type_t.chr100   #160225-00040#18 2016/04/13 s983961--add
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      CALL cl_progress_bar_no_window(2)   #160225-00040#18 2016/04/13 s983961--add  
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp613_process_cs CURSOR FROM ls_sql
#  FOREACH astp613_process_cs INTO
   #add-point:process段process name="process.process"
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('ast-00330',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)
   #预设单据别
   LET l_success = TRUE
   CALL s_arti200_get_def_doc_type(g_site,'astt620','1') RETURNING l_success,l_doctype
   IF NOT l_success THEN
      CALL cl_cmdrun('arti200')
      #160225-00040#18 2016/04/13 s983961--add(s)
      LET l_msg = cl_getmsg('std-00012',g_lang)
      CALL cl_progress_no_window_ing(l_msg)  
      #160225-00040#18 2016/04/13 s983961--add(e)
      RETURN
   END IF
   
   #费用编号设定
   INITIALIZE l_stav002 TO NULL
   SELECT stav002 INTO l_stav002
     FROM stav_t
    WHERE stavent = g_enterprise AND stav001 = g_prog
   IF cl_null(l_stav002) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00213' #该作业未设定对应费用编号，请到asti207中设定费用编号
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CALL cl_cmdrun('asti207')
      #160225-00040#18 2016/04/13 s983961--add(s)
      LET l_msg = cl_getmsg('std-00012',g_lang)
      CALL cl_progress_no_window_ing(l_msg)  
      #160225-00040#18 2016/04/13 s983961--add(e)
      RETURN
   END IF
   
  ##关账日期检查
  #IF NOT cl_null(g_master.prdd004) THEN
  #   LET g_settle_date = cl_get_para(g_enterprise,g_site,'S-CIR-0001')
  #   IF g_settle_date < g_master.prdd004 THEN
  #      INITIALIZE g_errparam TO NULL
  #      LET g_errparam.code = '' #促销日期不可大于日结日期
  #      LET g_errparam.extend = ''
  #      LET g_errparam.popup = TRUE
  #      CALL cl_err()
  #      RETURN
  #   END IF
  #END IF

   #检查符合条件的资料笔数
   INITIALIZE l_prdadocno TO NULL
   LET l_cnt = 0
   LET l_sql = "SELECT DISTINCT prdadocno,prdw027 ",
               "  FROM prdw_t,prda_t,prdd_t,prdh_t ",
               " WHERE prdwent = prdaent AND prdwent = prddent ",
               "   AND prdw001 = prda001 AND prdw002 = prda002 ",
               "   AND prdadocno = prdddocno AND prdadocno = prdhdocno ",
               "   AND prdwent = ",g_enterprise," ",
              ##---促销单号不存在于来源类别为6.返利费用的费用单
              #"   AND NOT EXISTS (SELECT 1 ",
              #"                     FROM stci_t ",
              #"                    WHERE stcient = prdaent AND stci010 = '6' ",
              #"                      AND stci011 = prdadocno AND stci011 IS NOT NULL) ",
               "   AND prdwstus = 'Y' AND prdw099 = 'Y' AND prdw003 = '31' AND prdw098 = '2' ",
               #---折价方式为5.促销返利或6.任务量返利
               "   AND prdh009 IN ('5','6') ",
               "   AND prdd004 = '",g_master.prdd004,"' ",
               "   AND ",g_master.wc CLIPPED," ",
               " ORDER BY prdw027 DESC "
   PREPARE astp613_sel_prdw_pre FROM l_sql
   DECLARE astp613_sel_prdw_cs CURSOR FOR astp613_sel_prdw_pre
   FOREACH astp613_sel_prdw_cs INTO l_prdadocno,l_prdw027
   
      CALL s_astp613_chkcust(g_pmaa001_wc,l_prdadocno,'1') RETURNING l_success,l_wc
      IF NOT l_success THEN
         LET l_success = TRUE
         CONTINUE FOREACH
      END IF
      LET l_cnt = l_cnt + 1
   END FOREACH
   IF l_cnt <= 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00491'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      #160225-00040#18 2016/04/13 s983961--add(s)
      LET l_msg = cl_getmsg('std-00012',g_lang)
      CALL cl_progress_no_window_ing(l_msg)  
      #160225-00040#18 2016/04/13 s983961--add(e)
      RETURN
   END IF

   #返利费用批次产生
   #建临时表
   CALL s_get_price_B_tmp('1') RETURNING l_success
   CALL s_get_price_adb_tmp('1') RETURNING l_success
   
   #开启事务&初始化
   CALL s_transaction_begin()
   LET l_success = TRUE
   INITIALIZE l_prdadocno TO NULL
   
   LET l_sql = "SELECT DISTINCT prdadocno,prdw027 ",
               "  FROM prdw_t,prda_t,prdd_t,prdh_t ",
               " WHERE prdwent = prdaent AND prdwent = prddent ",
               "   AND prdw001 = prda001 AND prdw002 = prda002 ",
               "   AND prdadocno = prdddocno AND prdadocno = prdhdocno ",
               "   AND prdwent = ",g_enterprise," ",
              ##---促销单号不存在于来源类别为6.返利费用的费用单
              #"   AND NOT EXISTS (SELECT 1 ",
              #"                     FROM stci_t ",
              #"                    WHERE stcient = prdaent AND stci010 = '6' ",
              #"                      AND stci011 = prdadocno AND stci011 IS NOT NULL) ",
               "   AND prdwstus = 'Y' AND prdw099 = 'Y' AND prdw003 = '31' AND prdw098 = '2' ",
               #---折价方式为5.促销返利或6.任务量返利
               "   AND prdh009 IN ('5','6') ",
               "   AND prdd004 = '",g_master.prdd004,"' ",
               "   AND ",g_master.wc CLIPPED," ",
               " ORDER BY prdw027 DESC "
   PREPARE astp613_sel_prdw_pre2 FROM l_sql
   DECLARE astp613_sel_prdw_cs2 CURSOR FOR astp613_sel_prdw_pre2
   FOREACH astp613_sel_prdw_cs2 INTO l_prdadocno,l_prdw027
   
      CALL s_astp613_chkcust(g_pmaa001_wc,l_prdadocno,'1') RETURNING l_success,l_wc
      IF NOT l_success THEN
         LET l_success = TRUE
         CONTINUE FOREACH
      END IF
      
      #促销返利
      IF s_astp613_chk_prdh009(l_prdadocno,'5') THEN
         CALL s_get_price_adb_B('','',g_master.prdd004,'','','','','','','','4',g_pmaa001_wc,l_prdadocno) RETURNING l_success
         IF NOT l_success THEN
            EXIT FOREACH
         END IF
      END IF
      
      #任务量返利
      IF s_astp613_chk_prdh009(l_prdadocno,'6') THEN
         CALL s_get_price_adb_B('','',g_master.prdd004,'','','','','','','','5',g_pmaa001_wc,l_prdadocno) RETURNING l_success
         IF NOT l_success THEN
            EXIT FOREACH
         END IF
      END IF
   END FOREACH
   
   IF l_success THEN
      CALL s_transaction_end("Y","0")
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'adz-00217'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   ELSE
      CALL s_transaction_end("N","0")
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'adz-00218'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   
   #删临时表
   CALL s_get_price_B_tmp('2') RETURNING l_success
   CALL s_get_price_adb_tmp('2') RETURNING l_success
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg)  
   #160225-00040#18 2016/04/13 s983961--add(e)
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
      
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
      
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL astp613_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp613.get_buffer" >}
PRIVATE FUNCTION astp613_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.prdd004 = p_dialog.getFieldBuffer('prdd004')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp613.msgcentre_notify" >}
PRIVATE FUNCTION astp613_msgcentre_notify()
 
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
 
{<section id="astp613.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

#end add-point
 
{</section>}
 
