#該程式未解開Section, 採用最新樣板產出!
{<section id="astp503.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0007(2016-09-14 10:00:33), PR版次:0007(2016-11-15 14:03:29)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000064
#+ Filename...: astp503
#+ Description: 專櫃銷退成本調整產生批次作業
#+ Creator....: 05818(2015-07-30 10:38:56)
#+ Modifier...: 08172 -SD/PR- 02481
 
{</section>}
 
{<section id="astp503.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#Memos
#160905-00007#16   2016/09/05  By 02599         SQL条件增加ent
#160913-00034#1    2016/09/13  by 08172         q_pmaa001開窗替换
#161024-00025#11   2016/10/27  by 08742         组织开窗修改
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
        dat        LIKE type_t.dat,
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       stgasite LIKE type_t.chr10, 
   stga002 LIKE type_t.chr500, 
   stga003 LIKE type_t.chr10, 
   stga004 LIKE type_t.chr20, 
   stga005 LIKE type_t.chr10, 
   l_date LIKE type_t.dat, 
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
 
{<section id="astp503.main" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
   DEFINE l_success LIKE type_t.num5     #161024-00025#11   2016/10/27  by 08742 add
   
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
      CALL astp503_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp503 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp503_init()
 
      #進入選單 Menu (="N")
      CALL astp503_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp503
   END IF
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success    #161024-00025#11   2016/10/27  by 08742 add
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp503.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp503_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   DEFINE l_success LIKE type_t.num5     #161024-00025#11   2016/10/27  by 08742 add
   
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
   CALL s_aooi500_create_temp() RETURNING l_success    #161024-00025#11   2016/10/27  by 08742 add
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp503.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp503_ui_dialog()
 
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
   
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.l_date 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_date
            #add-point:BEFORE FIELD l_date name="input.b.l_date"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_date
            
            #add-point:AFTER FIELD l_date name="input.a.l_date"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_date
            #add-point:ON CHANGE l_date name="input.g.l_date"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.l_date
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_date
            #add-point:ON ACTION controlp INFIELD l_date name="input.c.l_date"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON stgasite,stga002,stga003,stga004,stga005
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.stgasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgasite
            #add-point:ON ACTION controlp INFIELD stgasite name="construct.c.stgasite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.WHERE = s_aooi500_q_WHERE(g_prog,'stgasite',g_site,'c')   # add by yul 2015/08/13          
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.RETURN1 TO stgasite  #顯示到畫面上
            NEXT FIELD stgasite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgasite
            #add-point:BEFORE FIELD stgasite name="construct.b.stgasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgasite
            
            #add-point:AFTER FIELD stgasite name="construct.a.stgasite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stga002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stga002
            #add-point:ON ACTION controlp INFIELD stga002 name="construct.c.stga002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stga002  #顯示到畫面上
            NEXT FIELD stga002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stga002
            #add-point:BEFORE FIELD stga002 name="construct.b.stga002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stga002
            
            #add-point:AFTER FIELD stga002 name="construct.a.stga002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stga003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stga003
            #add-point:ON ACTION controlp INFIELD stga003 name="construct.c.stga003"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stga003  #顯示到畫面上
            NEXT FIELD stga003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stga003
            #add-point:BEFORE FIELD stga003 name="construct.b.stga003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stga003
            
            #add-point:AFTER FIELD stga003 name="construct.a.stga003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stga004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stga004
            #add-point:ON ACTION controlp INFIELD stga004 name="construct.c.stga004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site 
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stga004  #顯示到畫面上
            NEXT FIELD stga004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stga004
            #add-point:BEFORE FIELD stga004 name="construct.b.stga004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stga004
            
            #add-point:AFTER FIELD stga004 name="construct.a.stga004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stga005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stga005
            #add-point:ON ACTION controlp INFIELD stga005 name="construct.c.stga005"
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
            DISPLAY g_qryparam.return1 TO stga005  #顯示到畫面上
            NEXT FIELD stga005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stga005
            #add-point:BEFORE FIELD stga005 name="construct.b.stga005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stga005
            
            #add-point:AFTER FIELD stga005 name="construct.a.stga005"
            
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
            CALL astp503_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            let g_master.l_date=g_today-1
            display  g_master.l_date to l_date
            
         AFTER DIALOG
               LET lc_param.dat = g_master.l_date 
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
         CALL astp503_init()
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
                 CALL astp503_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp503_transfer_argv(ls_js)
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
 
{<section id="astp503.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp503_transfer_argv(ls_js)
 
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
 
{<section id="astp503.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp503_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   define l_success   string
   define l_i  integer
   define l_sql string
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
   
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      LET l_loop = 3
      CALL cl_progress_bar_no_window(l_loop)
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp503_process_cs CURSOR FROM ls_sql
#  FOREACH astp503_process_cs INTO
   #add-point:process段process name="process.process"
   CALL s_transaction_begin()
   CALL cl_err_collect_init()  #160225-00040#18 Add By Ken 160314
   
   IF cl_null(lc_param.dat) THEN
      LET lc_param.dat = g_today-1
   END IF
   
   CALL astp503_p(lc_param.wc,lc_param.dat)  RETURNING l_success,l_i
   IF l_i=0 THEN 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = ''
      LET g_errparam.code   = 'ast-00401'
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET l_success=FALSE 
   END IF
  
  
   IF NOT l_success THEN
      CALL s_transaction_END('N','0')
   ELSE      
      CALL s_transaction_END('Y','0')      
   END IF
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
   CALL astp503_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp503.get_buffer" >}
PRIVATE FUNCTION astp503_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.l_date = p_dialog.getFieldBuffer('l_date')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp503.msgcentre_notify" >}
PRIVATE FUNCTION astp503_msgcentre_notify()
 
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
 
{<section id="astp503.other_function" readonly="Y" >}
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
PRIVATE FUNCTION astp503_p(p_wc,l_date)

   DEFINE p_wc           STRING
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_sql          STRING
   DEFINE p_wc1          STRING
   DEFINE p_wc2          STRING
   
#161111-00028#3--modify----begin---------- 
 # DEFINE l_stga         RECORD  LIKE stga_t.* 
 # DEFINE l_stgc         RECORD  LIKE stgc_t.* 
 # DEFINE l_rtjb1        RECORD  LIKE rtjb_t.*
   DEFINE l_stga RECORD  #專櫃每日銷售成本統計檔
       stgaent LIKE stga_t.stgaent, #企業編號
       stgasite LIKE stga_t.stgasite, #營運組織
       stgaunit LIKE stga_t.stgaunit, #應用組織
       stga001 LIKE stga_t.stga001, #銷售日期
       stga002 LIKE stga_t.stga002, #商品編號
       stga003 LIKE stga_t.stga003, #庫區編號
       stga004 LIKE stga_t.stga004, #专柜编号
       stga005 LIKE stga_t.stga005, #供應商編號
       stga006 LIKE stga_t.stga006, #費用編號
       stga007 LIKE stga_t.stga007, #銷售數量
       stga008 LIKE stga_t.stga008, #原價金額
       stga009 LIKE stga_t.stga009, #實收金額
       stga010 LIKE stga_t.stga010, #費率
       stga011 LIKE stga_t.stga011, #費用金額
       stga012 LIKE stga_t.stga012, #成本金額
       stga013 LIKE stga_t.stga013, #日結成本類別
       stga014 LIKE stga_t.stga014, #價款類型
       stga015 LIKE stga_t.stga015, #已結轉否
       stgadocno LIKE stga_t.stgadocno, #來源單號
       stga016 LIKE stga_t.stga016, #銷售單單號
       stga017 LIKE stga_t.stga017  #銷售單項次
       END RECORD
  DEFINE l_stgc RECORD  #專櫃每日退貨統計檔
       stgcent LIKE stgc_t.stgcent, #企業編號
       stgcsite LIKE stgc_t.stgcsite, #營運組織
       stgcunit LIKE stgc_t.stgcunit, #應用組織
       stgc001 LIKE stgc_t.stgc001, #銷退日期
       stgc002 LIKE stgc_t.stgc002, #商品編號
       stgc003 LIKE stgc_t.stgc003, #庫區編號
       stgc004 LIKE stgc_t.stgc004, #专柜编号
       stgc005 LIKE stgc_t.stgc005, #供應商編號
       stgc006 LIKE stgc_t.stgc006, #費用編號
       stgc007 LIKE stgc_t.stgc007, #銷退金額
       stgc008 LIKE stgc_t.stgc008, #原扣率
       stgc009 LIKE stgc_t.stgc009, #新扣率
       stgc010 LIKE stgc_t.stgc010, #銷退費用金額
       stgc011 LIKE stgc_t.stgc011, #銷退成本金額
       stgc012 LIKE stgc_t.stgc012, #原銷售日期
       stgc013 LIKE stgc_t.stgc013, #價款類型
       stgc014 LIKE stgc_t.stgc014, #已結轉否
       stgcdocno LIKE stgc_t.stgcdocno, #銷退單號
       stgcseq LIKE stgc_t.stgcseq #項次
       END RECORD
DEFINE l_rtjb1 RECORD  #銷售整合商品明細檔
       rtjbent LIKE rtjb_t.rtjbent, #企業編號
       rtjbsite LIKE rtjb_t.rtjbsite, #營運據點
       rtjbunit LIKE rtjb_t.rtjbunit, #應用組織
       rtjborga LIKE rtjb_t.rtjborga, #帳務組織
       rtjbdocno LIKE rtjb_t.rtjbdocno, #單據編號
       rtjbseq LIKE rtjb_t.rtjbseq, #項次
       rtjb001 LIKE rtjb_t.rtjb001, #來源單號
       rtjb002 LIKE rtjb_t.rtjb002, #來源單號項次
       rtjb003 LIKE rtjb_t.rtjb003, #商品條碼
       rtjb004 LIKE rtjb_t.rtjb004, #商品編號
       rtjb005 LIKE rtjb_t.rtjb005, #特徵碼
       rtjb006 LIKE rtjb_t.rtjb006, #稅別編號
       rtjb007 LIKE rtjb_t.rtjb007, #銷售開立發票
       rtjb008 LIKE rtjb_t.rtjb008, #標準售價
       rtjb009 LIKE rtjb_t.rtjb009, #促銷售價
       rtjb010 LIKE rtjb_t.rtjb010, #交易售價
       rtjb011 LIKE rtjb_t.rtjb011, #成本售價
       rtjb012 LIKE rtjb_t.rtjb012, #銷售數量
       rtjb013 LIKE rtjb_t.rtjb013, #銷售單位
       rtjb014 LIKE rtjb_t.rtjb014, #庫存數量
       rtjb015 LIKE rtjb_t.rtjb015, #庫存單位
       rtjb016 LIKE rtjb_t.rtjb016, #銷售庫存單位換算率
       rtjb017 LIKE rtjb_t.rtjb017, #計價數量
       rtjb018 LIKE rtjb_t.rtjb018, #計價單位
       rtjb019 LIKE rtjb_t.rtjb019, #銷售計價單位換算率
       rtjb020 LIKE rtjb_t.rtjb020, #折價金額
       rtjb021 LIKE rtjb_t.rtjb021, #應收金額
       rtjb022 LIKE rtjb_t.rtjb022, #未稅金額
       rtjb023 LIKE rtjb_t.rtjb023, #成本金額
       rtjb024 LIKE rtjb_t.rtjb024, #理由碼
       rtjb025 LIKE rtjb_t.rtjb025, #庫區
       rtjb026 LIKE rtjb_t.rtjb026, #儲位
       rtjb027 LIKE rtjb_t.rtjb027, #批號
       rtjb028 LIKE rtjb_t.rtjb028, #專櫃編號
       rtjb029 LIKE rtjb_t.rtjb029, #分攤積點
       rtjb030 LIKE rtjb_t.rtjb030, #卡券銷售明細對應項次
       rtjb031 LIKE rtjb_t.rtjb031, #本幣應收金額
       rtjb032 LIKE rtjb_t.rtjb032, #庫存管理特徵
       rtjb033 LIKE rtjb_t.rtjb033, #營業員
       rtjb034 LIKE rtjb_t.rtjb034, #掃描碼
       rtjb035 LIKE rtjb_t.rtjb035, #交易類型
       rtjb036 LIKE rtjb_t.rtjb036, #商品屬性
       rtjb037 LIKE rtjb_t.rtjb037, #捆綁條碼項次
       rtjb038 LIKE rtjb_t.rtjb038, #結算扣率
       rtjb039 LIKE rtjb_t.rtjb039, #贈品否
       rtjb040 LIKE rtjb_t.rtjb040, #卡種/券種編號
       rtjb041 LIKE rtjb_t.rtjb041, #卡號/券號
       rtjb101 LIKE rtjb_t.rtjb101, #退貨退回商品(租賃)
       rtjb102 LIKE rtjb_t.rtjb102, #產品品類(租賃)
       rtjb103 LIKE rtjb_t.rtjb103, #品牌(租賃)
       rtjb104 LIKE rtjb_t.rtjb104, #商戶編號(租賃)
       rtjb105 LIKE rtjb_t.rtjb105, #合約編號(租賃)
       rtjb106 LIKE rtjb_t.rtjb106, #單位兌換積分
       rtjb107 LIKE rtjb_t.rtjb107, #促銷單位兌換積分
       rtjb108 LIKE rtjb_t.rtjb108, #總兌換積分
       rtjb042 LIKE rtjb_t.rtjb042, #退貨方式
       rtjb043 LIKE rtjb_t.rtjb043, #發票編號
       rtjb044 LIKE rtjb_t.rtjb044, #發票號碼
       rtjb109 LIKE rtjb_t.rtjb109  #返現金額
       END RECORD
#161111-00028#3--modify----end---------- 
   
   DEFINE g_sql          STRING 
   
   DEFINE l_rtjb         RECORD   
           
           rtjbent       LIKE rtjb_t.rtjbent,    #  企业编号
           rtjbsite      LIKE rtjb_t.rtjbsite,   #  门店编号
           rtjb004       LIKE rtjb_t.rtjb004,    #  商品编号
           rtjb025       LIKE rtjb_t.rtjb025,    #  专柜编号
           rtjb028       LIKE rtjb_t.rtjb028,    #  供应商编号
           rtjb012       LIKE rtjb_t.rtjb012     #  销售数量 (SUM)          
                         END RECORD 
                         

   
   DEFINE l_date         date 
   DEFINE l_stfa001      LIKE stfa_t.stfa001     #  
   DEFINE l_stfc024      LIKE stfc_t.stfc024     #  
   DEFINE l_COUNT        INTEGER                 #  
                                                 #  
#   DEFINE l_prec058      LIKE prec_t.prec058,    #  
#          l_prea013      LIKE prea_t.prea013,    #  
#          l_preb007      LIKE preb_t.preb007,    #  
#          l_preb008      LIKE preb_t.preb008     # 

   DEFINE l_prei001      LIKE prei_t.prei001,
          l_prei058      LIKE prei_t.prei058,
          l_preg013      LIKE preg_t.preg013,
          l_preh007      LIKE preh_t.preh007,     
          l_preh008      LIKE preh_t.preh008 
   
   DEFINE l_preb008_1    LIKE preb_t.preb008     #  
   DEFINE l_stga010      LIKE stga_t.stga010     #  
   DEFINE l_stga010_1    LIKE stga_t.stga010     #  
   DEFINE i              INTEGER 
   DEFINE l_rtja007      LIKE rtja_t.rtja007
   DEFINE l_rtjb001      LIKE rtjb_t.rtjb001
   DEFINE l_stfc025      LIKE stfc_t.stfc025
   
   DEFINE l_stgc1        RECORD   
           stgc001       LIKE stgc_t.stgc001,    #  销售日期
           stgc002       LIKE stgc_t.stgc002,    #  商品编号
           stgc003       LIKE stgc_t.stgc003,    #  库区编号
           #stgc004       LIKE stgc_t.stgc004,    #  专柜编号
           #stgc005       LIKE stgc_t.stgc005,    #  供应商编号
           #stgc008       LIKE stgc_t.stgc008,    #  原扣率
           #stgc009       LIKE stgc_t.stgc009,    #  新扣率
           stgc011       LIKE stgc_t.stgc011     #  销退成本金额
                         END RECORD
   DEFINE l_ooef016      LIKE ooef_t.ooef016 #ADDED BY LANJJ 2015-10-27
   DEFINE l_msg          STRING             #160225-00040#18 Add By Ken 160314
   DEFINE l_prei098      LIKE prei_t.prei098
   
   
   LET l_success = TRUE
   
   #160225-00040#18 Add By Ken 160314(S)  資料準備
   LET l_msg = cl_getmsg('ade-00114',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 Add By Ken 160314(E)
   
   
   
   IF cl_null(p_wc) THEN
      LET p_wc=" 1=1"
      LET p_wc1=" 1=1"
      LET p_wc2=" 1=1"
   ELSE   
      LET p_wc1 = cl_replace_str(p_wc, "stga", "stgc")        
      LET p_wc2 = cl_replace_str(p_wc, "stgasite", "rtjbsite")
      LET p_wc2 = cl_replace_str(p_wc2, "stga002", "rtjb004")
      LET p_wc2 = cl_replace_str(p_wc2, "stga003", "rtjb025")
      LET p_wc2 = cl_replace_str(p_wc2, "stga004", "rtjb028")
      LET p_wc2 = cl_replace_str(p_wc2, "stga005", "mhae006")   
   END IF
   # DELETE 503  (S)
   
   LET l_sql= "  DELETE FROM stgc_t 
                       WHERE stgc014 <> 'Y' 
                         AND stgcent=",g_enterprise," 
                         AND stgc001=to_date('",l_date,"','yy/mm/dd') 
                         AND ",p_wc1,
              "          AND stgcsite='",g_site,"'"
   
   PREPARE p503_pr4 FROM l_sql
   EXECUTE p503_pr4 
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = ' DELETE stgc_t fail:'
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      LET l_success=FALSE 
      RETURN  l_success,1 
   END IF
   
   # DELETE 503  (E) 
  
   # DELETE 501  (S)
   LET l_sql= "  DELETE FROM stga_t 
                       WHERE stga013='13' 
                         AND stga015<>'Y' 
                         AND stgaent=",g_enterprise,"                                       
                         AND stga001=to_date('",l_date,"','yy/mm/dd') 
                         AND ",p_wc,
              "          AND stgasite='",g_site,"'"
   
   PREPARE p503_pr1 FROM l_sql
   EXECUTE p503_pr1 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = ' DELETE stga_t fail:'
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      LET l_success=FALSE 
      RETURN  l_success,1 
    END IF
   
   # DELETE 501  (E)   
    
   # 重新产生 503 (S)
   
   #160225-00040#18 Add By Ken 160314(S)   產生資料
   LET l_msg = cl_getmsg('ast-00330',g_lang)
   CALL cl_progress_no_window_ing(l_msg)   
   #160225-00040#18 Add By Ken 160314(e)
   
   LET  i=0
   
 # LET g_sql=" SELECT DISTINCT rtjb_t.*     #161111-00028#3--MARK
   LET g_sql=" SELECT DISTINCT rtjbent,rtjbsite,rtjbunit,rtjborga,rtjbdocno,rtjbseq,rtjb001,rtjb002,rtjb003,rtjb004,
                 rtjb005,rtjb006,rtjb007,rtjb008,rtjb009,rtjb010,rtjb011,rtjb012,rtjb013,rtjb014,rtjb015,rtjb016,rtjb017,
                 rtjb018,rtjb019,rtjb020,rtjb021,rtjb022,rtjb023,rtjb024,rtjb025,rtjb026,rtjb027,rtjb028,rtjb029,rtjb030,
                 rtjb031,rtjb032,rtjb033,rtjb034,rtjb035,rtjb036,rtjb037,rtjb038,rtjb039,rtjb040,rtjb041,rtjb101,rtjb102,
                 rtjb103,rtjb104,rtjb105,rtjb106,rtjb107,rtjb108,rtjb042,rtjb043,rtjb044,rtjb109
                 FROM rtja_t,rtjb_t,mhae_t
                WHERE rtjbent=mhaeent 
                  AND rtjbsite=mhaesite 
                  AND rtjb028=mhae001 
                  AND rtjaent=rtjbent 
                  AND rtjadocno=rtjbdocno
                  AND rtjadocdt=to_date('",l_date,"','yy/mm/dd')
                  AND rtjb035='2' 
                  AND mhae003='4' 
                  AND rtjbent=",g_enterprise," 
                  AND ",p_wc2,
             "    AND rtjbsite='",g_site,"'"
                                      
   PREPARE astp503_insert_stgc_pb FROM g_sql
   DECLARE astp503_insert_stgc_cur CURSOR FOR astp503_insert_stgc_pb
   
   INITIALIZE l_rtjb1.* TO NULL 
   
   FOREACH astp503_insert_stgc_cur INTO l_rtjb1.*
          
          INITIALIZE l_stgc.* TO NULL
          
          LET i=i+1
           
          LET l_stgc.stgcdocno =NULL  # l_rtjb1.rtjbdocno # add by yuhl 2015/09/09
          LET l_stgc.stgcseq   =l_rtjb1.rtjbseq
          LET l_stgc.stgcent   =g_enterprise
          LET l_stgc.stgcsite  =l_rtjb1.rtjbsite
          LET l_stgc.stgc001   =l_date
          LET l_stgc.stgc002   =l_rtjb1.rtjb004
          LET l_stgc.stgc003   =l_rtjb1.rtjb025
          LET l_stgc.stgc004   =l_rtjb1.rtjb028
          
          
          # add by yuhl 2015/09/09 (S)
          SELECT DISTINCT rtja033
            INTO l_stgc.stgcdocno
            FROM rtja_t
           WHERE rtjaent   = g_enterprise
             AND rtjasite  = g_site             
             AND rtjadocdt = to_date(l_date,'yy/mm/dd')
             AND rtjadocno = l_rtjb1.rtjbdocno
          # add by yuhl 2015/09/09 (E)
          
          #供应商
          SELECT DISTINCT stfa010 INTO l_stgc.stgc005  
            FROM stfa_t 
           WHERE stfa005=l_rtjb1.rtjb028
             AND stfaent=g_enterprise #160905-00007#16 add
          #费用代号
          SELECT DISTINCT stav002 INTO  l_stgc.stgc006 
            FROM stav_t 
           WHERE stav001='astp503' 
             AND stavent=g_enterprise
          #销售金额
          LET l_stgc.stgc007 =l_rtjb1.rtjb031
                                                                
         
          #原销售日期
          LET l_rtja007=NULL
          
          SELECT DISTINCT rtja007
            INTO l_rtja007
            FROM rtja_t
           WHERE rtjaent   = g_enterprise
             AND rtjasite  = g_site             
             AND rtjadocdt = to_date(l_date,'yy/mm/dd')
             AND rtjadocno = l_rtjb1.rtjbdocno
          
        
          SELECT DISTINCT rtja034 
            INTO l_stgc.stgc012 
            FROM rtja_t 
           WHERE rtjaent  =g_enterprise
             AND rtjasite = g_site
             AND rtja033  =l_rtja007
             
          IF cl_null(l_stgc.stgc012) THEN #LANJJ ADD ON 2016-01-29  顾问 刘鑫
             SELECT DISTINCT rtja057
               INTO l_stgc.stgc012
               FROM rtja_t
              WHERE rtjaent  =g_enterprise
                AND rtjasite = g_site
                AND rtjadocno  =l_rtjb1.rtjbdocno
          END IF
          
          IF cl_null(l_stgc.stgc012) THEN
             LET l_stgc.stgc012=l_date
          END IF
         
          #原扣率
          LET l_stga010=NULL            
          SELECT DISTINCT stga010 INTO l_stga010 
            FROM stga_t 
           WHERE stgaent =g_enterprise 
             AND stgasite=l_rtjb1.rtjbsite
             AND stga001 = l_stgc.stgc012 
             AND stga002 =l_rtjb1.rtjb004  
             AND stga003 = l_rtjb1.rtjb025 
             #AND stga013 ='13'
             
#          IF cl_null(l_stga010) OR l_stga010=0 THEN 
          IF cl_null(l_stga010) THEN  ##mod by dengdd 151207 注：刘鑫要求：只判断空，不判断零
              LET l_stga010_1=NULL          
              SELECT DISTINCT stga010 INTO l_stga010_1 
                FROM stga_t 
               WHERE stgaent = g_enterprise 
                 AND stgasite= l_rtjb1.rtjbsite
                 AND stga001 = l_date 
                 AND stga002 = l_rtjb1.rtjb004  
                 AND stga003 = l_rtjb1.rtjb025 
                 # AND stga013 = '13'
                 
#              IF cl_null(l_stga010_1) OR l_stga010_1=0 THEN
              IF cl_null(l_stga010_1) THEN ##mod by dengdd 151207 注：刘鑫要求：只判断空，不判断零
                 LET l_stfa001=NULL
                 SELECT DISTINCT stfa001 INTO l_stfa001 
                   FROM stfa_t 
                  WHERE stfa005=l_rtjb1.rtjb028 
                    AND stfaent=g_enterprise
                    
                 SELECT DISTINCT stfc018 INTO l_stgc.stgc008 
                   FROM stfc_t 
                  WHERE stfc002=l_rtjb1.rtjb025 
                    AND stfcent=g_enterprise 
                    AND stfc001=l_stfa001  
              ELSE 
                 LET l_stgc.stgc008=l_stga010_1
              END IF 
          ELSE 
              LET l_stgc.stgc008=l_stga010         
          END IF  
          
          #新扣率
          LET l_stfa001=NULL          
          SELECT DISTINCT stfa001 INTO l_stfa001  # 合同编号
            FROM stfa_t 
           WHERE stfa005=l_rtjb1.rtjb028          # 专柜编号
             AND stfaent=g_enterprise
             
          LET l_stfc024=NULL   
          SELECT DISTINCT stfc024 INTO l_stfc024  # 库区用途分类
            FROM stfc_t 
           WHERE stfc002=l_rtjb1.rtjb025 # 库区编号 
             AND stfcent=g_enterprise 
             AND stfc001=l_stfa001       # 合同编号
          #正常库区
          IF l_stfc024!='2' THEN 
             SELECT DISTINCT stfc018 INTO l_stgc.stgc009 
               FROM stfc_t 
              WHERE stfc002=l_rtjb1.rtjb025 
                AND stfcent=g_enterprise 
                AND stfc001=l_stfa001
          END IF
          
          #促销库区 (S)
          IF l_stfc024='2' THEN 
#             LET l_prec058 = NULL
#             LET l_prea013 = NULL
#             LET l_preb007 = NULL
#             LET l_preb008 = NULL
#             
#             SELECT DISTINCT prec058,prea013,preb007,preb008  # 执行扣率,日期高端设置,固定日期,固定星期
#               INTO l_prec058,l_prea013,l_preb007,l_preb008  
#               FROM prec_t,preb_t,prea_t,prei_t
#              WHERE precent  =prebent 
#                AND precdocno=prebdocno 
#                AND precseq  =preb002 
#                AND preaent  =precent
#                AND preadocno=precdocno
#                AND prec003  =l_rtjb1.rtjb025                    # 库区编号               
#                AND l_date BETWEEN preb003 AND preb004  # 开始日期,结束日期
#                AND prei081 = '1'   # 促销状态：已发布
#                AND preient = preaent
#                AND prei001 = prea001
#             
#             LET l_stgc.stgc009 = l_prec058  

             LET l_prei001 = NULL 
             LET l_prei058 = NULL
             LET l_preg013 = NULL
             LET l_preh007 = NULL
             LET l_preh008 = NULL
             
             SELECT DISTINCT prei001,prei058,preg013,preh007,preh008
               INTO l_prei001,l_prei058,l_preg013,l_preh007,l_preh008             
               FROM prei_t,preg_t,preh_t
              WHERE preient  =prehent
                AND prei001 =preh001
               # AND preiseq  =preh002
                AND pregent  =preient
                AND preg001 = prei001
                AND prei003  =l_rtjb1.rtjb025                  
                AND l_date BETWEEN preh003 AND preh004  
                AND prei081 = '1'
             LET l_stgc.stgc009 = l_prei058             

             #lanjj add on 2016-04-06 若抓不到已发布的资料，则抓最大终止时间的已终止的资料。
             IF cl_null(l_stgc.stgc009) THEN
                SELECT DISTINCT prei001,prei058,preg013,preh007,preh008,MAX(prei098)
                  INTO l_prei001,l_prei058,l_preg013,l_preh007,l_preh008,l_prei098
                  FROM (SELECT DISTINCT prei001,prei058,preg013,preh007,preh008,prei098        
                          FROM prei_t,preg_t,preh_t
                         WHERE preient = prehent
                           AND prei001 = preh001
                           AND pregent = preient
                           AND preg001 = prei001
                           AND prei003 = l_rtjb1.rtjb025                  
                           AND l_date BETWEEN preh003 AND preh004  
                           AND prei081 = '2')
                  GROUP BY prei001,prei058,preg013,preh007,preh008     
                LET l_stgc.stgc009 = l_prei058
             END IF  
             #lanjj add on 2016-04-06 若抓不到已发布的资料，则抓最大修改时间的已终止的资料。

             IF cl_null(l_stgc.stgc009) THEN
                
                SELECT DISTINCT stfc018 INTO l_stgc.stgc009 
                  FROM stfc_t 
                 WHERE stfc002=l_rtjb1.rtjb025 
                   AND stfcent=g_enterprise 
                   AND stfc001=l_stfa001  
                   
              END IF     
          END IF
          
          IF cl_null(l_stgc.stgc009) THEN 
             LET l_stfc025=NULL
             SELECT DISTINCT stfc025 INTO l_stfc025  #促销库区对应的常规库区编号
                   FROM stfc_t 
                  WHERE stfc024=l_stfc024
                    AND stfc002=l_rtjb.rtjb025 
                    AND stfcent=g_enterprise 
                    AND stfc001=l_stfa001 
                                
                 SELECT DISTINCT stfc018 INTO l_stgc.stgc009 
                   FROM stfc_t 
                  WHERE stfc002=l_stfc025
                    AND stfcent=g_enterprise 
                    AND stfc001=l_stfa001
                    
          END IF
                              
          #促销库区 (E)
           
          LET l_stgc.stgc010=0
          #销退成本金额
          LET l_stgc.stgc011=(l_stgc.stgc009-l_stgc.stgc008)/100 * l_stgc.stgc007 
          
          IF cl_null(l_stgc.stgc011) THEN 
             LET l_stgc.stgc011=0
          END IF 
          
          #价款类型
          SELECT DISTINCT decode (stae006,'3','1',null,'1',stae006) INTO l_stgc.stgc013  
            FROM stae_t 
           WHERE staeent = g_enterprise 
             AND stae001=l_stgc.stgc006  
             AND staestus='Y'
          # 
          LET l_stgc.stgc014='N'
          # 有结算的则不插入（表结构修改需要修改条件 单号+项次）
          SELECT COUNT(*) INTO l_COUNT 
            FROM stgc_t 
           WHERE stgcent= g_enterprise 
             AND stgcdocno=l_stgc.stgcdocno 
             AND stgcseq=l_stgc.stgcseq
          
          IF l_COUNT=0 THEN                           
               
             ---#ADDED BY LanJJ 2015-10-27 ----S---
                #按当前币别截取aooi150里的用户设置小数位 处理金额字段-
                SELECT ooef016 
                  INTO l_ooef016
                  FROM ooef_t 
                 WHERE ooefent = g_enterprise 
                   AND ooef001 = l_stgc.stgcsite 
                   
                CALL s_curr_round(l_stgc.stgcsite,l_ooef016,l_stgc.stgc007,'2') RETURNING l_stgc.stgc007
                CALL s_curr_round(l_stgc.stgcsite,l_ooef016,l_stgc.stgc010,'2') RETURNING l_stgc.stgc010
                CALL s_curr_round(l_stgc.stgcsite,l_ooef016,l_stgc.stgc011,'2') RETURNING l_stgc.stgc011
             ---#ADDED BY LanJJ 2015-10-27 ----E---
               
              #INSERT INTO stgc_t VALUES (l_stgc.*)    #161111-00028#3--mark
              #161111-00028#3--ADD---BEGIN---------
               INSERT INTO stgc_t (stgcent,stgcsite,stgcunit,stgc001,stgc002,stgc003,stgc004,stgc005,stgc006,stgc007,
                                   stgc008,stgc009,stgc010,stgc011,stgc012,stgc013,stgc014,stgcdocno,stgcseq)
                 VALUES (l_stgc.stgcent,l_stgc.stgcsite,l_stgc.stgcunit,l_stgc.stgc001,l_stgc.stgc002,l_stgc.stgc003,l_stgc.stgc004,l_stgc.stgc005,l_stgc.stgc006,l_stgc.stgc007,
                         l_stgc.stgc008,l_stgc.stgc009,l_stgc.stgc010,l_stgc.stgc011,l_stgc.stgc012,l_stgc.stgc013,l_stgc.stgc014,l_stgc.stgcdocno,l_stgc.stgcseq)
              #161111-00028#3--ADD---END-----------
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "INTO stgc_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success=FALSE
                  RETURN l_success,1
               END IF
          END IF      
   END FOREACH  
   #重新产生 503 (E) 
   
    
   #重新产生 501 (S)                            # 商品编号 库区编号 专柜编号
   LET g_sql=" SELECT DISTINCT rtjbent,rtjbsite,rtjb004,rtjb025,rtjb028,SUM(nvl(rtjb012,0))  
                 FROM rtja_t,rtjb_t,mhae_t 
                WHERE rtjbent=mhaeent 
                  AND rtjbsite=mhaesite 
                  AND rtjb028=mhae001 
                  AND rtjaent=rtjbent
                  AND rtjadocno=rtjbdocno
                  AND rtjb035='2' 
                  AND mhae003='4'  
                  AND rtjbent=",g_enterprise," AND ",p_wc2,
             "    AND rtjbsite='",g_site,"'",
             "    AND rtjadocdt=to_date('",l_date,"','yy/mm/dd')",                                    
             "  GROUP BY rtjbent,rtjbsite,rtjb004,rtjb025,rtjb028 "
   PREPARE astp503_insert_stga_pb FROM g_sql
   DECLARE astp503_insert_stga_cur CURSOR FOR astp503_insert_stga_pb

   INITIALIZE l_rtjb.* TO NULL 
  
   FOREACH astp503_insert_stga_cur INTO l_rtjb.*
         INITIALIZE l_stga.* TO NULL
         
         #501
         LET l_stga.stgaent =g_enterprise
         LET l_stga.stgasite=l_rtjb.rtjbsite # 营运组织
         LET l_stga.stga001 =l_date # 销售日期
         LET l_stga.stga002 =l_rtjb.rtjb004  # 商品编号 
         LET l_stga.stga003 =l_rtjb.rtjb025  # 库区
         LET l_stga.stga004 =l_rtjb.rtjb028  # 专柜编号
         LET l_stga.stgaunit =l_rtjb.rtjbsite # stgautnit
         #供应商
         SELECT DISTINCT stfa010 INTO l_stga.stga005    # 供应商编号
           FROM stfa_t                                  # 专柜合同主档
          WHERE stfa005=l_rtjb.rtjb028                  # 
            AND stfaent=g_enterprise
         #费用代号                                       #
         SELECT DISTINCT stav002 INTO  l_stga.stga006   # 费用编号
           FROM stav_t                                  # 结算会计期维护数据表
          WHERE stav001='astp503'                       #
            AND stavent=g_enterprise
            
         #销售数量
         LET  l_stga.stga007=l_rtjb.rtjb012
         
         #应收实收
         LET l_stga.stga008=0  # 应收
         LET l_stga.stga009=0  # 实收
         
         #新费率
         LET l_stfa001=NULL
         SELECT DISTINCT stfa001 INTO l_stfa001       # 合同编号
           FROM stfa_t                                # 专柜合同主档
          WHERE stfa005=l_rtjb.rtjb028                # 供应商编号
            AND stfaent=g_enterprise                  # 
            
         LET l_stfc024=NULL                            
         SELECT DISTINCT stfc024 INTO l_stfc024       # 库区用途分类
           FROM stfc_t                                # 
          WHERE stfc002=l_rtjb.rtjb025                # 库区编号
            AND stfcent=g_enterprise                  # 
            AND stfc001=l_stfa001                     # 合同编号
            
         # 1.正常库区
         IF l_stfc024!='2' THEN 
            SELECT DISTINCT stfc018 INTO l_stga.stga010       #  费用比率
              FROM stfc_t                                     #  
             WHERE stfc002=l_rtjb.rtjb025                     #  
               AND stfcent=g_enterprise                       #  
               AND stfc001=l_stfa001                          #  
         END IF                                               #  
                                                              #  
         # 2.促销库区                                          #  
         IF l_stfc024='2' THEN                                #  
#             LET l_prec058 = NULL
#             LET l_prea013 = NULL
#             LET l_preb007 = NULL
#             LET l_preb008 = NULL
#             
#             SELECT DISTINCT prec058,prea013,preb007,preb008  #   执行扣率,日期高端设置,固定日期,固定星期
#               INTO l_prec058,l_prea013,l_preb007,l_preb008   #   
#               FROM prec_t,preb_t,prea_t,prei_t               #  
#              WHERE precent=prebent                           #  
#                AND precdocno=prebdocno                       #  
#                AND precseq=preb002                           #  
#                AND preaent=precent                           #  
#                AND preadocno =precdocno                      #  
#                AND prec003 =l_rtjb.rtjb025                   #  
#                AND l_date BETWEEN preb003 AND preb004        
#                AND prei081 = '1'
#                AND preient = preaent
#                AND prei001 = prea001
             LET l_prei001 = NULL 
             LET l_prei058 = NULL
             LET l_preg013 = NULL
             LET l_preh007 = NULL
             LET l_preh008 = NULL
             
             SELECT DISTINCT prei001,prei058,preg013,preh007,preh008
               INTO l_prei001,l_prei058,l_preg013,l_preh007,l_preh008             
               FROM prei_t,preg_t,preh_t
              WHERE preient  =prehent
                AND prei001 =preh001
                # AND preiseq  =preh002
                AND pregent  =preient
                AND preg001 = prei001
                AND prei003  =l_rtjb1.rtjb025                  
                AND l_date BETWEEN preh003 AND preh004  
                AND prei081 = '1'
             
             LET l_stga.stga010 = l_prei058
             
             IF cl_null(l_stga.stga010) THEN
#mark by dengdd 151205(S)
#                SELECT DISTINCT stfc018 INTO l_stga.stga010 
#                  FROM stfc_t 
#                 WHERE stfc002=l_rtjb.rtjb025
#                   AND stfcent=g_enterprise 
#                   AND stfc001=l_stfa001
#mark by dengdd 151205(E)    
                 LET l_stga.stga010=0  #add by dengdd 151205
             END IF
             
         END IF 
         
         IF cl_null(l_stga.stga010) THEN
              LET l_stfc025=NULL
              SELECT DISTINCT stfc025 INTO l_stfc025  # 销库区对应的常规库区编号
                FROM stfc_t 
               WHERE stfc024=l_stfc024
                 AND stfc002=l_rtjb.rtjb025 
                 AND stfcent=g_enterprise 
                 AND stfc001=l_stfa001 
               
               SELECT DISTINCT stfc018 INTO l_stga.stga010 
                FROM stfc_t 
               WHERE stfc002=l_stfc025
                 AND stfcent=g_enterprise 
                 AND stfc001=l_stfa001
         END IF
         # 费用金额
         LET l_stga.stga011=0 
         
         #价款
         SELECT DISTINCT decode (stae006,'3','1',null,'1',stae006) 
           INTO l_stga.stga014                                                        
           FROM stae_t                                                               
          WHERE staeent = g_enterprise                                                
            AND stae001=l_stga.stga006                                                
            AND staestus='Y'                                                          
                                                                                      
         LET l_stga.stga013='13'                                                      
         LET l_stga.stga015='N'                                                       
         LET l_stga.stgadocno=' '                                                    
         SELECT COUNT(*) INTO l_COUNT FROM stga_t                                     
          WHERE stga013='13'                                                          
            AND stgaent= g_enterprise                                                 
            AND stga001=to_date(l_date,'yy/mm/dd')                                    
            AND stgasite=l_stga.stgasite                                              
            AND stga002=l_stga.stga002                                                
            AND stga003=l_stga.stga003
                                       
         IF l_COUNT=0 THEN                         
             
             ---#ADDED BY LanJJ 2015-10-27 ----S---
                #按当前币别截取aooi150里的用户设置小数位 处理金额字段-
                SELECT ooef016 
                  INTO l_ooef016
                  FROM ooef_t 
                 WHERE ooefent = g_enterprise 
                   AND ooef001 = l_stga.stgasite  
                   
                CALL s_curr_round(l_stga.stgasite,l_ooef016,l_stga.stga008,'2') RETURNING l_stga.stga008
                CALL s_curr_round(l_stga.stgasite,l_ooef016,l_stga.stga009,'2') RETURNING l_stga.stga009
                CALL s_curr_round(l_stga.stgasite,l_ooef016,l_stga.stga011,'2') RETURNING l_stga.stga011
             ---#ADDED BY LanJJ 2015-10-27 ----E---
             
            #INSERT INTO stga_t VALUES (l_stga.*)    #161111-00028#3--mark
            #161111-00028#3--ADD---BEGIN---------
             INSERT INTO stga_t (stgaent,stgasite,stgaunit,stga001,stga002,stga003,stga004,stga005,stga006,stga007,stga008,
                                 stga009,stga010,stga011,stga012,stga013,stga014,stga015,stgadocno,stga016,stga017)
               VALUES (l_stga.stgaent,l_stga.stgasite,l_stga.stgaunit,l_stga.stga001,l_stga.stga002,l_stga.stga003,l_stga.stga004,l_stga.stga005,l_stga.stga006,l_stga.stga007,l_stga.stga008,
                       l_stga.stga009,l_stga.stga010,l_stga.stga011,l_stga.stga012,l_stga.stga013,l_stga.stga014,l_stga.stga015,l_stga.stgadocno,l_stga.stga016,l_stga.stga017)  
             #161111-00028#3--ADD---BEGIN---------  
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = "INTO stga_t fail"
                LET g_errparam.popup = TRUE
                CALL cl_err()
               LET l_success=FALSE
               RETURN l_success,1
             END IF
         END IF     
   END FOREACH 
   
   # 重新产生 501 (E)
   
   # 根据日期+商品+库区从【astq503-专柜每日退货明细查询作业】中的销退成本金额 （即差额）
#   LET l_sql=" UPDATE stga_t SET stga012 = (SELECT nvl(stgc011,0) 
#                                              FROM stgc_t,stga_t
#                                             WHERE stgcent=stgaent
#                                               AND stgcsite=stgasite
#                                               AND stgc001=stga001
#                                               AND stgc002=stga002
#                                               AND stgc003=stga003 )  
#                           WHERE stga015<>'Y' AND stga013='13' 
#                             AND stga001= to_date('",l_date,"','yy/mm/dd') 
#                             AND ",p_wc
#   
   
   LET l_sql = " SELECT stgc001,stgc002,stgc003,SUM(nvl(stgc011,0)) ",
               "   FROM stgc_t ",
               "  WHERE stgcent=",g_enterprise,
               "    AND stgcsite='",g_site,"'",
               "    AND stgc001= to_date('",l_date,"','yy/mm/dd') ",
               "    AND ",p_wc1,
               "    AND stgc014<>'Y'  ",
               "  GROUP BY stgc001,stgc002,stgc003"
                     
   PREPARE p503_pr100 FROM l_sql   
   DECLARE p503_pr100_cur CURSOR FOR p503_pr100 
   INITIALIZE l_stgc1.* TO NULL   
   FOREACH p503_pr100_cur INTO l_stgc1.*
   
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL 
          LET g_errparam.extend = ' FOREACH p503_pr100_cur:'
          LET g_errparam.code   = SQLCA.sqlcode 
          LET g_errparam.popup  = FALSE 
          CALL cl_err()
          LET l_success=FALSE
          RETURN l_success,1
       END IF
       
       CALL s_curr_round(l_stga.stgasite,l_ooef016,l_stgc1.stgc011,'2') RETURNING l_stgc1.stgc011 #ADDED BY LANJJ 2015-10-27
       
       LET l_sql =  " UPDATE stga_t  ",
                    "    SET stga012=",l_stgc1.stgc011," ,",
                    "        stga010=0,",#l_stgc1.stgc009-l_stgc1.stgc008,
                    "        stga011=(-1)* ",l_stgc1.stgc011,
                    "  WHERE stgaent=",g_enterprise,
                    "    AND stgasite='",g_site,"'",
                    "    AND stga001='",l_date,"'",
                    "    AND stga002='",l_stgc1.stgc002,"'",
                    "    AND stga003='",l_stgc1.stgc003,"'",
                    #"    AND stga004='",l_stgc1.stgc004,"'",
                    #"    AND stga005='",l_stgc1.stgc005,"'",          
                    "    AND stga013='13'",
                    "    AND stga015<>'Y'"
       PREPARE p503_pr6 FROM l_sql
       EXECUTE p503_pr6 
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL 
          LET g_errparam.extend = ' UPDATE stga_t fail:'
          LET g_errparam.code   = SQLCA.sqlcode 
          LET g_errparam.popup  = FALSE 
          CALL cl_err()
          LET l_success=FALSE
          RETURN l_success,1
       END IF         
       
       INITIALIZE l_stgc1.* TO NULL
       
   END FOREACH
   
   
   
   # 如果成本金额为0，则不生成,【删除该数据】。
   LET l_sql= "  DELETE FROM stga_t 
                       WHERE stga013='13' 
                         AND stga015='N' 
                         AND stga012=0 
                         AND stgaent= ",g_enterprise,"
                         AND stga001=to_date('",l_date,"','yy/mm/dd') 
                         AND ",p_wc 
   
   PREPARE p503_pr5 FROM l_sql
   EXECUTE p503_pr5 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = 'DELETE stga_t fail:'
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      LET l_success=FALSE
      RETURN l_success,1    
   END IF
   
   RETURN l_success,i
END FUNCTION

#end add-point
 
{</section>}
 
