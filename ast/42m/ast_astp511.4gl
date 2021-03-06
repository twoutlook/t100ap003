#該程式未解開Section, 採用最新樣板產出!
{<section id="astp511.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0006(2016-09-14 10:04:08), PR版次:0006(2016-11-15 14:10:25)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000057
#+ Filename...: astp511
#+ Description: 專櫃每日促銷銷售情況計算批次作業
#+ Creator....: 01251(2015-05-29 10:50:31)
#+ Modifier...: 08172 -SD/PR- 02481
 
{</section>}
 
{<section id="astp511.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#Memos
#160905-00007#16   2016/09/05  By 02599       SQL条件增加ent
#160913-00034#1    2016/09/13  by 08172       q_pmaa001開窗替换
#161024-00025#11   2016/10/27  by 08742       组织开窗调整
#161111-00028#3    2016/11/15  by 02481         标准程式定义采用宣告模式,弃用.*写法
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
   stgf001 LIKE stgf_t.stgf001,
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       stgfsite LIKE stgf_t.stgfsite, 
   stgf003 LIKE stgf_t.stgf003, 
   stgf004 LIKE stgf_t.stgf004, 
   stgf005 LIKE stgf_t.stgf005, 
   stgf001 LIKE stgf_t.stgf001, 
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
 
{<section id="astp511.main" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
   DEFINE l_success LIKE type_t.num5    #161024-00025#11   2016/10/27  by 08742  add
   
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
      CALL astp511_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp511 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp511_init()
 
      #進入選單 Menu (="N")
      CALL astp511_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp511
   END IF
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success   #161024-00025#11   2016/10/27  by 08742  add
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp511.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp511_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   DEFINE l_success LIKE type_t.num5    #161024-00025#11   2016/10/27  by 08742  add
   
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
   CALL s_aooi500_create_temp() RETURNING l_success   #161024-00025#11   2016/10/27  by 08742  add
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp511.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp511_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"
   DEFINE l_ooab002_1      LIKE ooab_t.ooab002
   DEFINE l_ooab002_2      LIKE ooab_t.ooab002
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   LET g_master.stgf001 =g_today-1  

#門店日結關賬日期 
   SELECT ooab002 INTO l_ooab002_1
     FROM ooab_t
    WHERE ooabent = g_enterprise 
      AND ooabsite = g_site 
      AND ooab001 = 'S-CIR-0001'  
      

   IF g_master.stgf001<l_ooab002_1 THEN
      LET g_master.stgf001=''
   END IF   
   DISPLAY BY NAME g_master.stgf001
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.stgf001 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgf001
            #add-point:BEFORE FIELD stgf001 name="input.b.stgf001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgf001
            
            #add-point:AFTER FIELD stgf001 name="input.a.stgf001"
            IF NOT cl_null(g_master.stgf001) THEN
#               IF g_master.stgf001<l_ooab002_1 OR g_master.stgf001>l_ooab002_2 THEN
               IF g_master.stgf001<=l_ooab002_1 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00414'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()              
                  
                  NEXT FIELD stgf001
               END IF

           END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgf001
            #add-point:ON CHANGE stgf001 name="input.g.stgf001"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.stgf001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgf001
            #add-point:ON ACTION controlp INFIELD stgf001 name="input.c.stgf001"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON stgfsite,stgf003,stgf004,stgf005
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               DISPLAY g_site TO stgfsite
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.stgfsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgfsite
            #add-point:ON ACTION controlp INFIELD stgfsite name="construct.c.stgfsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stgfsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgfsite  #顯示到畫面上
            NEXT FIELD stgfsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgfsite
            #add-point:BEFORE FIELD stgfsite name="construct.b.stgfsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgfsite
            
            #add-point:AFTER FIELD stgfsite name="construct.a.stgfsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgf003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgf003
            #add-point:ON ACTION controlp INFIELD stgf003 name="construct.c.stgf003"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgf003  #顯示到畫面上
            NEXT FIELD stgf003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgf003
            #add-point:BEFORE FIELD stgf003 name="construct.b.stgf003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgf003
            
            #add-point:AFTER FIELD stgf003 name="construct.a.stgf003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgf004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgf004
            #add-point:ON ACTION controlp INFIELD stgf004 name="construct.c.stgf004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgf004  #顯示到畫面上
            NEXT FIELD stgf004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgf004
            #add-point:BEFORE FIELD stgf004 name="construct.b.stgf004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgf004
            
            #add-point:AFTER FIELD stgf004 name="construct.a.stgf004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgf005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgf005
            #add-point:ON ACTION controlp INFIELD stgf005 name="construct.c.stgf005"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #160913-00034#1 -s by 08172
            LET g_qryparam.arg1 = "('3')"
            CALL q_pmaa001_1()
#            CALL q_pmaa001()                           #呼叫開窗
            #160913-00034#1 -e by 08172
            DISPLAY g_qryparam.return1 TO stgf005  #顯示到畫面上
            NEXT FIELD stgf005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgf005
            #add-point:BEFORE FIELD stgf005 name="construct.b.stgf005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgf005
            
            #add-point:AFTER FIELD stgf005 name="construct.a.stgf005"
            
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
            CALL astp511_get_buffer(l_dialog)
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
         CALL astp511_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      LET lc_param.stgf001 = g_master.stgf001
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
                 CALL astp511_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp511_transfer_argv(ls_js)
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
 
{<section id="astp511.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp511_transfer_argv(ls_js)
 
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
 
{<section id="astp511.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp511_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_loop        LIKE type_t.num5   #160225-00040#18 Add By Ken 160314
   DEFINE l_msg         STRING             #160225-00040#18 Add By Ken 160314    
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   #CALL astp511_insert(lc_param.wc,lc_param.stgf001) RETURNING l_success
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      #160225-00040#18 Add By Ken 160314(S)
      LET l_loop = 3
      CALL cl_progress_bar_no_window(l_loop)  
      #160225-00040#18 Add By Ken 160314(E)
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp511_process_cs CURSOR FROM ls_sql
#  FOREACH astp511_process_cs INTO
   #add-point:process段process name="process.process"
   #160225-00040#18 Add By Ken 160314(S)  資料準備 
   LET l_msg = cl_getmsg('ade-00114',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   CALL cl_err_collect_init()    
   #160225-00040#18 Add By Ken 160314(E) 
   
   CALL astp511_insert(lc_param.wc,lc_param.stgf001) RETURNING l_success
   
   #160225-00040#18 Add By Ken 160314(S)
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg) 
   CALL cl_err_collect_show()    
   #160225-00040#18 Add By Ken 160314(E)   
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
   CALL astp511_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp511.get_buffer" >}
PRIVATE FUNCTION astp511_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.stgf001 = p_dialog.getFieldBuffer('stgf001')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp511.msgcentre_notify" >}
PRIVATE FUNCTION astp511_msgcentre_notify()
 
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
 
{<section id="astp511.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: p處理邏輯
# Memo...........:
# Usage..........: CALL astp511_insert(p_wc,p_stgf001)
#                  RETURNING r_success
# Input parameter: p_wc           查詢條件
#                : p_stgf001      統計日期
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 20150529 By huangrh
# Modify.........:
################################################################################
PRIVATE FUNCTION astp511_insert(p_wc,p_stgf001)
DEFINE p_wc            STRING
DEFINE p_stgf001       LIKE stgf_t.stgf001
DEFINE r_success       LIKE type_t.num5
DEFINE l_sql           STRING
DEFINE l_wc            STRING
DEFINE l_debaent       LIKE deba_t.debaent
DEFINE l_debasite      LIKE deba_t.debasite
DEFINE l_deba002       LIKE deba_t.deba002
DEFINE l_deba005       LIKE deba_t.deba005
DEFINE l_deba009       LIKE deba_t.deba009
DEFINE l_deba021       LIKE deba_t.deba021
DEFINE l_deba024       LIKE deba_t.deba024
DEFINE l_deba047       LIKE deba_t.deba047
DEFINE l_stgf004       LIKE stgf_t.stgf004
DEFINE l_stgf005       LIKE stgf_t.stgf005
DEFINE l_stgf006       LIKE stgf_t.stgf006
DEFINE l_stgf007       LIKE stgf_t.stgf007
DEFINE l_stgf008       LIKE stgf_t.stgf008
DEFINE l_stgf012       LIKE stgf_t.stgf012
DEFINE l_success       LIKE type_t.num5
DEFINE l_prei058       LIKE prei_t.prei058
DEFINE l_inaa141       LIKE inaa_t.inaa141
DEFINE l_stfc018       LIKE stfc_t.stfc018
DEFINE l_count         LIKE type_t.num5
DEFINE l_prei057       LIKE prei_t.prei057
#DEFINE l_stgf   RECORD LIKE stgf_t.*  #161111-00028#3--mark
#161111-00028#3---add----begin----------
DEFINE l_stgf RECORD  #專櫃每日促銷銷售情況統計檔
       stgfent LIKE stgf_t.stgfent, #企業編號
       stgfsite LIKE stgf_t.stgfsite, #營運組織
       stgfunit LIKE stgf_t.stgfunit, #應用組織
       stgf001 LIKE stgf_t.stgf001, #促銷日期
       stgf002 LIKE stgf_t.stgf002, #商品編號
       stgf003 LIKE stgf_t.stgf003, #庫區編號
       stgf004 LIKE stgf_t.stgf004, #专柜编号
       stgf005 LIKE stgf_t.stgf005, #供應商編號
       stgf006 LIKE stgf_t.stgf006, #樓層編號
       stgf007 LIKE stgf_t.stgf007, #經營小類編號
       stgf008 LIKE stgf_t.stgf008, #加抽/降扣率
       stgf009 LIKE stgf_t.stgf009, #銷售數量
       stgf010 LIKE stgf_t.stgf010, #原價金額
       stgf011 LIKE stgf_t.stgf011, #實收金額
       stgf012 LIKE stgf_t.stgf012, #加抽降扣金額
       stgf013 LIKE stgf_t.stgf013, #管理品類
       stgf014 LIKE stgf_t.stgf014, #促銷方式
       stgf015 LIKE stgf_t.stgf015, #促銷類型
       stgf016 LIKE stgf_t.stgf016, #活動類型
       stgf017 LIKE stgf_t.stgf017, #活動力度
       stgf018 LIKE stgf_t.stgf018  #成本金額
       END RECORD
#161111-00028#3---add----end------------
#----str--------add by dengdd 150923--------
DEFINE l_stgf018       LIKE stgf_t.stgf018
DEFINE l_preg001       LIKE preg_t.preg001
DEFINE l_prei009       LIKE prei_t.prei009
DEFINE l_prei010       LIKE prei_t.prei010
#----end--------add by dengdd 150923--------
DEFINE l_ooef016      LIKE ooef_t.ooef016 #ADDED BY LANJJ 2015-10-27
DEFINE l_loop         LIKE type_t.num5   #160225-00040#18 Add By Ken 160314
DEFINE l_msg          STRING             #160225-00040#18 Add By Ken 160314 

 #aooi500設置的組織範圍
#   CALL s_aooi500_sql_where(g_prog,'stgfsite') RETURNING l_wc 
   IF cl_null(l_wc) THEN
      LET l_wc=" 1=1"
   END IF
   IF cl_null(p_wc) THEN
      LET p_wc=" 1=1"
   END IF  
   
   #開啟事務
   CALL s_transaction_begin()


   LET r_success=TRUE
      
   #根據錄入的條件，刪除stgf的資料
   LET l_sql=" DELETE FROM stgf_t",
             " WHERE stgfent='",g_enterprise,"'",
             "   AND stgf001='",p_stgf001,"'",
             "   AND ",p_wc,
             "   AND ",l_wc

   PREPARE astp511_del_stgf_pre FROM l_sql   
   EXECUTE astp511_del_stgf_pre                      
   IF SQLCA.SQLcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "del stgf_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
    
      LET r_success=FALSE
      RETURN r_success
   END IF 

#查詢條件，重新整理--替換字符
   CALL cl_str_replace(p_wc,"stgfsite","debasite") RETURNING p_wc 
   CALL cl_str_replace(p_wc,"stgf003","deba005") RETURNING p_wc
   CALL cl_str_replace(p_wc,"stgf004","deba017") RETURNING p_wc
   CALL cl_str_replace(p_wc,"stgf005","deba014") RETURNING p_wc
   
   CALL cl_str_replace(l_wc,"stgfsite","debasite") RETURNING l_wc   

#門店單品日結檔，查詢資料  
   LET l_sql=" SELECT debaent,debasite,deba002,deba005,deba009,SUM(deba021),SUM(deba024),SUM(deba047) ", #取原价金额150805-00003#44
             "   FROM deba_t",
             " WHERE debaent='",g_enterprise,"'",
             "   AND deba002='",p_stgf001,"'",
             "   AND ",p_wc,
             "   AND ",l_wc,
             "   AND EXISTS(SELECT 1 FROM preg_t,prei_t,preh_t",
             "                      WHERE pregent=preient",
             "                        AND pregent='",g_enterprise,"'",
             "                        AND preg001=prei001",
             "                        AND pregent=prehent",
             "                        AND preg001=preh001",
             "                        AND prei003=deba005",
             "                        AND prehacti='Y'",
             "                        AND pregstus='F'",
             "                        AND (prei081='1' OR prei081='2')",
             "                        AND preh003<=deba002",
             "                        AND preh004>=deba002)",             
             " GROUP BY debaent,debasite,deba002,deba005,deba009"

   PREPARE astp511_sel_deba_pre FROM l_sql   
   DECLARE astp511_sel_deba CURSOR FOR astp511_sel_deba_pre 
   
   #160225-00040#18 Add By Ken 160314(S)   產生資料
   LET l_msg = cl_getmsg('ast-00330',g_lang)
   CALL cl_progress_no_window_ing(l_msg)   
   #160225-00040#18 Add By Ken 160314(e) 

   FOREACH astp511_sel_deba INTO l_debaent,l_debasite,l_deba002,l_deba005,l_deba009,l_deba021,l_deba024,l_deba047
      INITIALIZE l_stgf.* TO NULL
      LET l_stgf.stgfent=l_debaent
      LET l_stgf.stgfsite=l_debasite
      LET l_stgf.stgfunit=l_debasite
      LET l_stgf.stgf001=l_deba002
      LET l_stgf.stgf002=l_deba009
      LET l_stgf.stgf003=l_deba005
      LET l_stgf.stgf009=l_deba021
      LET l_stgf.stgf010=l_deba024
      LET l_stgf.stgf011=l_deba047
         
      SELECT DISTINCT deba017,deba014,deba016 INTO l_stgf.stgf004,l_stgf.stgf005,l_stgf.stgf007
        FROM deba_t
       WHERE debaent=g_enterprise
         AND debasite=l_debasite
         AND deba002=l_deba002
         AND deba005=l_deba005
         AND deba009=l_deba009

      SELECT stfa048 INTO l_stgf.stgf006   #樓層
        FROM stfa_t
       WHERE stfaent=g_enterprise
         AND stfa005=l_stgf.stgf004
         AND stfastus='Y'
#加抽/降扣率
      #取促销库区对应的常规库区
      LET l_inaa141=''
      SELECT inaa141 INTO l_inaa141 #促销库区对应的常规库区
        FROM inaa_t
       WHERE inaaent=g_enterprise
         AND inaa001=l_stgf.stgf003     
      
     #合同扣率、执行扣率
      LET l_prei057=''
      LET l_prei058=''
      SELECT DISTINCT prei057,prei058,preg004,preg051,preg008,preg001,prei009,prei010 
       INTO l_prei057,l_prei058,                                                        #合同扣率、执行扣率 
            l_stgf.stgf014,l_stgf.stgf015,l_stgf.stgf016,l_preg001,l_prei009,l_prei010  #add by dengdd l_stgf.stgf014,l_stgf.stgf015,l_stgf.stgf016
        FROM preg_t,prei_t,preh_t
       WHERE pregent=preient
         AND preg001=prei001
         AND pregent=prehent
         AND preg001=preh001
         AND pregent=g_enterprise
         AND prei003=l_deba005
         AND prehacti='Y'
         AND pregstus='F'
         AND prei081='1'
         AND preh003<=l_deba002
         AND preh004>=l_deba002
      IF cl_null(l_prei057) AND cl_null(l_prei058) THEN #取不到取已经终止的促销库区
         SELECT prei057,prei058,preg004,preg051,preg008,preg001,prei009,prei010 
           INTO l_prei057,l_prei058,
                l_stgf.stgf014,l_stgf.stgf015,l_stgf.stgf016,l_preg001,l_prei009,l_prei010  #add by dengdd l_stgf.stgf014,l_stgf.stgf015,l_stgf.stgf016
           FROM preg_t,prei_t,preh_t
          WHERE pregent=preient
            AND preg001=prei001
            AND pregent=prehent
            AND preg001=preh001
            AND pregent=g_enterprise
            AND prei003=l_deba005
            AND prehacti='Y'
            AND pregstus='F'
            AND prei081='2'
            AND preh003<=l_deba002
            AND preh004>=l_deba002
            AND prei098=(SELECT MAX(prei098) 
                           FROM preg_t,prei_t,preh_t
                          WHERE pregent=preient
                            AND preg001=prei001
                            AND pregent=prehent
                            AND preg001=preh001
                            AND pregent=g_enterprise
                            AND prei003=l_deba005
                            AND prehacti='Y'
                            AND pregstus='F'
                            AND prei081='2'
                            AND preh003<=l_deba002
                            AND preh004>=l_deba002)                            
      END IF                            

      IF cl_null(l_prei058) THEN LET l_prei058=0 END IF 
      IF cl_null(l_prei057) THEN #没有合同扣率取
         LET l_prei057=''
         SELECT stfc018 INTO l_prei057  #合同费用比率
           FROM stfc_t,stfa_t
          WHERE stfcent=g_enterprise
            AND stfcent=stfaent
            AND stfa001=stfc001
            AND stfastus='Y'
            AND stfc002=l_inaa141
            AND stfa005=l_stgf.stgf004
         IF cl_null(l_prei057) THEN LET l_prei057=0 END IF
      END IF
      
      #加抽/降扣率
      LET l_stgf.stgf008=l_prei057-l_prei058
      IF cl_null(l_stgf.stgf008) THEN LET l_stgf.stgf008=0 END IF      
      #加抽/降扣金額=加抽/降扣率*实收金额
      LET l_stgf.stgf012=l_deba047*l_stgf.stgf008/100
      IF cl_null(l_stgf.stgf012) THEN
         LET l_stgf.stgf012=0
      END IF

      #add by dengdd 150922----str--------------
      #成本金额
#      LET l_stgf.stgf018=l_stgf.stgf011*(l_stgf.stgf008/100)
      
      SELECT sum(stga012) INTO l_stgf.stgf018   #mod by dengdd 15/10/19
        FROM stga_t
       WHERE stga001=p_stgf001
         AND stga003=l_stgf.stgf003
         AND stgaent=g_enterprise #160905-00007#16 add
         
      #管理品类
      SELECT mhae036 INTO l_stgf.stgf013
        FROM mhae_t
       WHERE mhaeent=g_enterprise
         AND mhaesite=g_site
         AND mhae001=l_stgf.stgf004
              
      #活动力度
                          
        CASE l_stgf.stgf014
           WHEN '1'   #买换
                SELECT (l_prei009||'换'||l_prei010) INTO l_stgf.stgf017 FROM DUAL
                IF STATUS THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = SQLCA.sqlcode
                    LET g_errparam.popup = TRUE
                    CALL cl_err()                   
                    LET r_success=FALSE
                    EXIT CASE
                END IF                
           WHEN '2'   #买送
                SELECT (l_prei009||'送'||l_prei010) INTO l_stgf.stgf017 FROM DUAL
                IF STATUS THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = SQLCA.sqlcode
                    LET g_errparam.popup = TRUE
                    CALL cl_err()                   
                    LET r_success=FALSE
                    EXIT CASE
                END IF 
                
           WHEN '3'   #买减
                SELECT (l_prei009||'减'||l_prei010) INTO l_stgf.stgf017 FROM DUAL
                IF STATUS THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = SQLCA.sqlcode
                    LET g_errparam.popup = TRUE
                    CALL cl_err()                   
                    LET r_success=FALSE
                    EXIT CASE
                END IF 
                
           WHEN '4'   #折扣
                SELECT ((l_prei010/10)||'折' ) INTO l_stgf.stgf017 FROM DUAL
                IF STATUS THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = SQLCA.sqlcode
                    LET g_errparam.popup = TRUE
                    CALL cl_err()                   
                    LET r_success=FALSE
                    EXIT CASE
                END IF 
                
           WHEN '5'   #倍换
                SELECT (l_prei009||'换'||l_prei010) INTO l_stgf.stgf017 FROM DUAL
                IF STATUS THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = SQLCA.sqlcode
                    LET g_errparam.popup = TRUE
                    CALL cl_err()                   
                    LET r_success=FALSE
                    EXIT CASE
                END IF 
          
          OTHERWISE
               EXIT CASE
      END CASE    
      #add by dengdd 150922----end--------------



#插入stgf表資料   
            
       ---#ADDED BY LanJJ 2015-10-27 ----S---
          #按当前币别截取aooi150里的用户设置小数位 处理金额字段-
          SELECT ooef016 
            INTO l_ooef016
            FROM ooef_t 
           WHERE ooefent = g_enterprise 
             AND ooef001 = l_stgf.stgfsite
             
          CALL s_curr_round(l_stgf.stgfsite,l_ooef016,l_stgf.stgf010,'2') RETURNING l_stgf.stgf010
          CALL s_curr_round(l_stgf.stgfsite,l_ooef016,l_stgf.stgf011,'2') RETURNING l_stgf.stgf011
          CALL s_curr_round(l_stgf.stgfsite,l_ooef016,l_stgf.stgf012,'2') RETURNING l_stgf.stgf012
          CALL s_curr_round(l_stgf.stgfsite,l_ooef016,l_stgf.stgf018,'2') RETURNING l_stgf.stgf018
       ---#ADDED BY LanJJ 2015-10-27 ----E---
      
    # INSERT INTO stgf_t VALUES(l_stgf.*)  #161111-00028#3--mark
    #161111-00028#3--add---begin--------
      INSERT INTO stgf_t (stgfent,stgfsite,stgfunit,stgf001,stgf002,stgf003,stgf004,stgf005,stgf006,stgf007,stgf008,
                          stgf009,stgf010,stgf011,stgf012,stgf013,stgf014,stgf015,stgf016,stgf017,stgf018)
        VALUES(l_stgf.stgfent,l_stgf.stgfsite,l_stgf.stgfunit,l_stgf.stgf001,l_stgf.stgf002,l_stgf.stgf003,l_stgf.stgf004,l_stgf.stgf005,l_stgf.stgf006,l_stgf.stgf007,l_stgf.stgf008,
               l_stgf.stgf009,l_stgf.stgf010,l_stgf.stgf011,l_stgf.stgf012,l_stgf.stgf013,l_stgf.stgf014,l_stgf.stgf015,l_stgf.stgf016,l_stgf.stgf017,l_stgf.stgf018)
    #161111-00028#3--add---end----------
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins stgf_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
       
         LET r_success=FALSE
         EXIT FOREACH
      END IF   

   END FOREACH
   

##門店單品日結檔，查詢資料  
#   LET l_sql=" SELECT debaent,debasite,deba002,deba005,deba009,SUM(deba021),SUM(deba024),SUM(deba047) ", #取原价金额150805-00003#44
#             "   FROM deba_t",
#             " WHERE debaent='",g_enterprise,"'",
#             "   AND deba002='",p_stgf001,"'",
#             "   AND ",p_wc,
#             "   AND ",l_wc,
#             " GROUP BY debaent,debasite,deba002,deba005,deba009"
#
#   PREPARE astp511_sel_deba_pre FROM l_sql   
#   DECLARE astp511_sel_deba CURSOR FOR astp511_sel_deba_pre 
#
#   FOREACH astp511_sel_deba INTO l_debaent,l_debasite,l_deba002,l_deba005,l_deba009,l_deba021,l_deba024,l_deba047
# 
##加抽/降扣金額
##---各會員等級（包括非VIP）的實收金額*各會員等級的加抽/降扣率/100 的匯總值
#      LET l_prei058=''
#      CALL astp511_get_stgf012(l_debasite,l_deba002,l_deba005,l_deba009,l_deba047) RETURNING l_success,l_stgf012,l_prei058 
#      IF NOT l_success THEN
#         CONTINUE FOREACH
#      END IF
#
##目前SA說一個商品只能是一個專櫃的
##       一個專櫃只能歸屬於一個供應商
#      LET l_stgf004=''
#      SELECT inaa120 INTO l_stgf004   #專櫃
#        FROM inaa_t
#       WHERE inaaent=g_enterprise
#         AND inaa001=l_deba005
#         AND inaasite=l_debasite
##20150906---add---合约的经营方式为‘4’，才写入stgf_t----begin---
#       LET l_count=0
#       SELECT count(*) INTO l_count
#        FROM stfa_t
#       WHERE stfaent=g_enterprise
#         AND stfasite=l_debasite
#         AND stfa005=l_stgf004
#         AND stfa003='4'
#         AND stfastus='Y'
#      IF cl_null(l_count) OR l_count=0 THEN
#         CONTINUE FOREACH
#      END IF
##20150906---add---合约的经营方式为‘4’，才写入stgf_t----end---         
#      LET l_stgf005=''
#      LET l_stgf007=''
#      SELECT MAX(deba014),MAX(deba016) INTO l_stgf005,l_stgf007  #供應商--品類
#        FROM deba_t
#       WHERE debaent=g_enterprise
#         AND debasite=l_debasite
#         AND deba002=l_deba002
#         AND deba005=l_deba005
#         AND deba009=l_deba009
#
##加抽/降扣率
#      #取促销库区对应的常规库区，常规库区合同中的加抽/降扣率，减去--aprm300中促销库区中设置的加抽/降扣率
#      LET l_inaa141=''
#      SELECT inaa141 INTO l_inaa141 #促销库区对应的常规库区
#        FROM inaa_t
#       WHERE inaaent=g_enterprise
#         AND inaa001=l_deba005      
#      
##执行扣率
#      LET l_prei058=''
#      SELECT DISTINCT prei057,prei058 INTO l_stfc018,l_prei058
#        FROM preg_t,prei_t,preh_t
#       WHERE pregent=preient
#         AND preg001=prei001
#         AND pregent=prehent
#         AND preg001=preh001
#         AND prei003=l_deba005
#         AND prehacti='Y'
#         AND pregstus<>'X'
#         AND prei081='1'
#         AND preh003<=l_deba002
#         AND preh004>=l_deba002
#
#      IF cl_null(l_prei058) THEN 
#         LET l_prei058=0
#      END IF 
#      IF cl_null(l_stfc018) THEN
#         LET l_stfc018=0
#      END IF
#      IF l_stfc018=0 THEN
#         LET l_stfc018=''
#         SELECT stfc018 INTO l_stfc018  #合同费用比率
#           FROM stfc_t,stfa_t
#          WHERE stfcent=g_enterprise
#            AND stfcent=stfaent
#            AND stfa001=stfc001
#            AND stfastus='Y'
#            AND stfc002=l_inaa141
#            AND stfa005=l_stgf004
#         IF cl_null(l_stfc018) THEN
#            LET l_stfc018=0
#         END IF
#      END IF
#      
#      LET l_stgf008=l_stfc018-l_prei058
#      IF cl_null(l_stgf008) THEN
#         LET l_stgf008=0
#      END IF      
##20150906----add---加抽/降扣金額=加抽/降扣率*实收金额---begin---
#      LET l_stgf012=''
#      LET l_stgf012=l_deba047*l_stgf008/100
#      IF cl_null(l_stgf012) THEN
#         LET l_stgf012=0
#      END IF
##20150906----add---加抽/降扣金額=加抽/降扣率*实收金额---end---
#
##插入stgf表資料   
#      INSERT INTO stgf_t(stgfent,stgfsite,stgfunit,stgf001,stgf002,stgf003,
#                         stgf004,stgf005,stgf006,stgf007,stgf008,stgf009,stgf010,stgf011,stgf012)
#                  VALUES(l_debaent,l_debasite,l_debasite,l_deba002,l_deba009,l_deba005,
#                         l_stgf004,l_stgf005,l_stgf006,l_stgf007,l_stgf008,l_deba021,l_deba024,l_deba047,l_stgf012)
#      IF SQLCA.SQLcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = "ins stgf_t"
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#       
#         LET r_success=FALSE
#         EXIT FOREACH
#      END IF      
#   
#   END FOREACH
   

   #事務提交
   IF r_success THEN
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF

   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 加抽/降扣金額
# Memo...........:
# Usage..........: CALL astp511_get_stgf012(p_debasite,p_deba002,p_deba005,p_deba009,p_deba047)
#                  RETURNING r_stgf012
# Input parameter: p_debasite     營運組織
#                : p_deba002      統計日期
#                : p_deba005      庫區編號
#                : p_deba009      商品編號
#                : p_deba047      實收金額
# Return code....: r_success      TRUE/FALSE
# ...............: r_stgf012      加抽/降扣金額
# ...............: r_prei058      执行扣率
# Date & Author..: 20150529 By huangrh
# Modify.........:
################################################################################
PRIVATE FUNCTION astp511_get_stgf012(p_debasite,p_deba002,p_deba005,p_deba009,p_deba047)
DEFINE p_debasite    LIKE deba_t.debasite
DEFINE p_deba002     LIKE deba_t.deba002
DEFINE p_deba005     LIKE deba_t.deba005
DEFINE p_deba009     LIKE deba_t.deba009
DEFINE p_deba047     LIKE deba_t.deba047
DEFINE r_success     LIKE type_t.num5
DEFINE r_stgf012     LIKE stgf_t.stgf012
DEFINE r_prei058     LIKE prei_t.prei058
DEFINE l_day         LIKE type_t.num5
DEFINE l_weekday     LIKE type_t.num5
DEFINE l_preh001     LIKE preh_t.preh001
DEFINE l_preh002     LIKE preh_t.preh002
DEFINE l_preh003     LIKE preh_t.preh003
DEFINE l_preh004     LIKE preh_t.preh004
DEFINE l_preh005     LIKE preh_t.preh005
DEFINE l_preh006     LIKE preh_t.preh006
DEFINE l_preh007     LIKE preh_t.preh007
DEFINE l_preh008     LIKE preh_t.preh008
DEFINE l_prei046     LIKE prei_t.prei046
DEFINE l_prei047     LIKE prei_t.prei047
DEFINE l_prei048     LIKE prei_t.prei048
DEFINE l_prei049     LIKE prei_t.prei049
DEFINE l_prei050     LIKE prei_t.prei050
DEFINE l_prei051     LIKE prei_t.prei051
DEFINE l_debb0340    LIKE debb_t.debb034
DEFINE l_debb0341    LIKE debb_t.debb034
DEFINE l_debb0342    LIKE debb_t.debb034
DEFINE l_debb0343    LIKE debb_t.debb034
DEFINE l_debb0344    LIKE debb_t.debb034
DEFINE l_debb0345    LIKE debb_t.debb034
DEFINE l_flag        LIKE type_t.num5

      LET r_stgf012=0
      LET r_prei058=0
      LET r_success=TRUE
#根據統計日期和庫區，取得促銷談判結果檔資料
#應該只能取得一筆促銷規則
#正常情況下，一定可以取到對應的促銷規則，所以現沒寫異常處理代碼
      DECLARE astp511_sel_preg CURSOR FOR SELECT DISTINCT preh001,preh002,preh003,preh004,preh005,preh006,preh007,preh008
                                            FROM preg_t,prei_t,preh_t
                                           WHERE pregent=preient
                                             AND preg001=prei001
                                             AND pregent=prehent
                                             AND preg001=preh001
                                             AND prei003=p_deba005
                                             AND prehacti='Y'
                                             AND pregstus<>'X'
                                             AND prei081='1'
                                             AND preh003<=p_deba002
                                             AND preh004>=p_deba002
                                             
      LET l_day=DAY(p_deba002)
      LET l_weekday=WEEKDAY(p_deba002)
      LET l_flag=FALSE   #此庫區是否有促銷--aprm310
      FOREACH astp511_sel_preg INTO l_preh001,l_preh002,l_preh003,l_preh004,l_preh005,l_preh006,l_preh007,l_preh008
         IF cl_null(l_preh007) AND cl_null(l_preh008) THEN
            LET l_flag=TRUE
            EXIT FOREACH
         END IF
         
         IF NOT cl_null(l_preh007) AND NOT cl_null(l_preh008) THEN
            IF l_day=l_preh007 AND l_weekday=l_preh008 THEN
               LET l_flag=TRUE
               EXIT FOREACH
            END IF
         END IF
      
         IF NOT cl_null(l_preh007) AND cl_null(l_preh008) THEN
            IF l_day=l_preh007 THEN
               LET l_flag=TRUE
               EXIT FOREACH
            END IF
         END IF
         
         IF cl_null(l_preh007) AND NOT cl_null(l_preh008) THEN
            IF l_weekday=l_preh008 THEN
               LET l_flag=TRUE
               EXIT FOREACH
            END IF
         END IF        
            
      END FOREACH

      IF NOT l_flag THEN   #此庫區不滿足aprm310設定
         LET r_success=FALSE
         RETURN r_success,r_stgf012,r_prei058
      END IF
      
#會員價內折扣點
      LET l_prei046=''
      LET l_prei047=''
      LET l_prei048=''
      LET l_prei050=''
      LET l_prei051=''     
      SELECT prei046,prei047,prei048,prei049,prei050,prei051
        INTO l_prei046,l_prei047,l_prei048,l_prei049,l_prei050,l_prei051
        FROM prei_t
       WHERE preient=g_enterprise
         AND prei001=l_preh001
         AND prei003=p_deba005
      IF cl_null(l_prei046) THEN LET l_prei046=0 END IF
      IF cl_null(l_prei047) THEN LET l_prei047=0 END IF
      IF cl_null(l_prei048) THEN LET l_prei048=0 END IF
      IF cl_null(l_prei049) THEN LET l_prei049=0 END IF
      IF cl_null(l_prei050) THEN LET l_prei050=0 END IF
      IF cl_null(l_prei051) THEN LET l_prei051=0 END IF
      
      
#會員等級1~5的實收金額 
      #會員等級一
      LET l_debb0341=''
      SELECT SUM(debb034) INTO l_debb0341
        FROM debb_t
       WHERE debbent=g_enterprise
         AND debbsite=p_debasite
         AND debb002=p_deba002
         AND debb005=p_deba005
         AND debb009=p_deba009
         AND debb021='001'   #會員等級一
      IF cl_null(l_debb0341) THEN LET l_debb0341=0 END IF
      #會員等級二
      LET l_debb0342=''
      SELECT SUM(debb034) INTO l_debb0342
        FROM debb_t
       WHERE debbent=g_enterprise
         AND debbsite=p_debasite
         AND debb002=p_deba002
         AND debb005=p_deba005
         AND debb009=p_deba009
         AND debb021='002'   #會員等級二 
      IF cl_null(l_debb0342) THEN LET l_debb0342=0 END IF         
      #會員等級三
      LET l_debb0343=''
      SELECT SUM(debb034) INTO l_debb0343
        FROM debb_t
       WHERE debbent=g_enterprise
         AND debbsite=p_debasite
         AND debb002=p_deba002
         AND debb005=p_deba005
         AND debb009=p_deba009
         AND debb021='003'   #會員等級三 
      IF cl_null(l_debb0343) THEN LET l_debb0343=0 END IF          
      #會員等級四
      LET l_debb0344=''
      SELECT SUM(debb034) INTO l_debb0344
        FROM debb_t
       WHERE debbent=g_enterprise
         AND debbsite=p_debasite
         AND debb002=p_deba002
         AND debb005=p_deba005
         AND debb009=p_deba009
         AND debb021='004'   #會員等級四  
      IF cl_null(l_debb0344) THEN LET l_debb0344=0 END IF          
      #會員等級五
      LET l_debb0345=''
      SELECT SUM(debb034) INTO l_debb0345
        FROM debb_t
       WHERE debbent=g_enterprise
         AND debbsite=p_debasite
         AND debb002=p_deba002
         AND debb005=p_deba005
         AND debb009=p_deba009
         AND debb021='004'   #會員等級五 
      IF cl_null(l_debb0345) THEN LET l_debb0345=0 END IF          
      #非VIP會員
      LET l_debb0340=p_deba047-l_debb0341-l_debb0342-l_debb0343-l_debb0344-l_debb0345
      
#加抽/降扣金額      
      LET l_debb0340=l_debb0340*l_prei046/100
      LET l_debb0341=l_debb0341*l_prei047/100
      LET l_debb0342=l_debb0342*l_prei048/100
      LET l_debb0343=l_debb0343*l_prei049/100
      LET l_debb0344=l_debb0344*l_prei050/100
      LET l_debb0345=l_debb0345*l_prei051/100
      
      LET r_stgf012=l_debb0340+l_debb0341+l_debb0342+l_debb0343+l_debb0344+l_debb0345
      
#执行扣率
      LET r_prei058=''
      SELECT prei058 INTO r_prei058
        FROM prei_t
       WHERE preient=g_enterprise
         AND prei001=l_preh001
         AND prei003=p_deba005
         AND prei081='1'
      IF cl_null(r_prei058) THEN 
         LET r_prei058=0
      END IF      
      
      RETURN r_success,r_stgf012,r_prei058
END FUNCTION

#end add-point
 
{</section>}
 
