#該程式未解開Section, 採用最新樣板產出!
{<section id="astp301.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0007(2015-10-12 10:53:20), PR版次:0007(2016-11-15 09:53:29)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000043
#+ Filename...: astp301
#+ Description: 自營合約狀態更新批次作業
#+ Creator....: 02003(2015-10-12 10:09:41)
#+ Modifier...: 02003 -SD/PR- 02481
 
{</section>}
 
{<section id="astp301.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#160523-00009#1   2016/5/25   by 08172       经营方式scc显示修改
#161111-00028#3   2016/11/15  by 02481       标准程式定义采用宣告模式,弃用.*写法
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
        stan017          LIKE stan_t.stan017,
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       stan015 LIKE type_t.chr10, 
   stan001 LIKE type_t.chr20, 
   stan005 LIKE type_t.chr10, 
   stan002 LIKE type_t.chr10, 
   bdate LIKE type_t.chr500, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_bdate  LIKE type_t.dat   #预设执行日期

#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"
 
#end add-point
 
{</section>}
 
{<section id="astp301.main" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
   DEFINE l_success  LIKE type_t.num5 
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
      CALL astp301_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp301 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp301_init()
 
      #進入選單 Menu (="N")
      CALL astp301_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp301
   END IF
 
   #add-point:作業離開前 name="main.exit"
#   CALL s_aooi500_drop_temp() RETURNING l_success #mark by yangxf 20151214
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp301.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp301_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   DEFINE l_success  LIKE type_t.num5 
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
   CALL cl_set_combo_scc_part('stan002','6013','1,2,3')  #160523-00009#1  by 08172
#   CALL s_aooi500_create_temp() RETURNING l_success   #mark by yangxf 20151214
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp301.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp301_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"
   DEFINE l_steasite LIKE stea_t.steasite
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   LET g_master.bdate = g_today            #预设执行日期为g_today
   DISPLAY g_master.bdate TO bdate
  
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.bdate 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD bdate
            #add-point:BEFORE FIELD bdate name="input.b.bdate"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD bdate
            
            #add-point:AFTER FIELD bdate name="input.a.bdate"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE bdate
            #add-point:ON CHANGE bdate name="input.g.bdate"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.bdate
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD bdate
            #add-point:ON ACTION controlp INFIELD bdate name="input.c.bdate"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON stan015,stan001,stan005,stan002
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
 
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.stan015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stan015
            #add-point:ON ACTION controlp INFIELD stan015 name="construct.c.stan015"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001_23()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan015  #顯示到畫面上
            NEXT FIELD stan015                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stan015
            #add-point:BEFORE FIELD stan015 name="construct.b.stan015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stan015
            
            #add-point:AFTER FIELD stan015 name="construct.a.stan015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stan001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stan001
            #add-point:ON ACTION controlp INFIELD stan001 name="construct.c.stan001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stan001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan001  #顯示到畫面上
            NEXT FIELD stan001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stan001
            #add-point:BEFORE FIELD stan001 name="construct.b.stan001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stan001
            
            #add-point:AFTER FIELD stan001 name="construct.a.stan001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stan005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stan005
            #add-point:ON ACTION controlp INFIELD stan005 name="construct.c.stan005"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "('1','3')" #
            CALL q_pmaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan005  #顯示到畫面上
            NEXT FIELD stan005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stan005
            #add-point:BEFORE FIELD stan005 name="construct.b.stan005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stan005
            
            #add-point:AFTER FIELD stan005 name="construct.a.stan005"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stan002
            #add-point:BEFORE FIELD stan002 name="construct.b.stan002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stan002
            
            #add-point:AFTER FIELD stan002 name="construct.a.stan002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stan002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stan002
            #add-point:ON ACTION controlp INFIELD stan002 name="construct.c.stan002"
            
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
            CALL astp301_get_buffer(l_dialog)
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
         CALL astp301_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      LET lc_param.stan017 = g_master.bdate
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
                 CALL astp301_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp301_transfer_argv(ls_js)
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
 
{<section id="astp301.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp301_transfer_argv(ls_js)
 
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
 
{<section id="astp301.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp301_process(ls_js)
 
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
   DEFINE l_msg         STRING           #160225-00040#16 20160328 add by beckxie
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   #160225-00040#16 20160328 add by beckxie---S
   IF g_bgjob <> "Y" THEN
      CALL cl_progress_bar_no_window(2)   
   END IF
   #160225-00040#16 20160328 add by beckxie---E 
   
   IF cl_null(lc_param.stan017) THEN 
      LET lc_param.stan017 = g_today-1                                  
   END IF
   #160225-00040#16 20160328 add by beckxie---S
   LET l_msg = cl_getmsg('ast-00330',g_lang)
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#16 20160328 add by beckxie---E
   CALL astp301_update(g_master.wc,lc_param.stan017) RETURNING l_success
   #160225-00040#16 20160328 add by beckxie---S
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#16 20160328 add by beckxie---E
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp301_process_cs CURSOR FROM ls_sql
#  FOREACH astp301_process_cs INTO
   #add-point:process段process name="process.process"
   
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
   CALL astp301_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp301.get_buffer" >}
PRIVATE FUNCTION astp301_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.bdate = p_dialog.getFieldBuffer('bdate')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp301.msgcentre_notify" >}
PRIVATE FUNCTION astp301_msgcentre_notify()
 
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
 
{<section id="astp301.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 更新专柜合同异动申请的合同状态
# Memo...........:
# Usage..........: CALL astp301_update (p_wc,p_day)
#                  RETURNING r_success
# Input parameter:p_wc     查询条件
#                :p_day    执行日期
# Return code....: r_success  执行成功
# Date & Author..: 15/7/24 By zhr
# Modify.........:
################################################################################
PUBLIC FUNCTION astp301_update(p_wc,p_day)
DEFINE p_wc        STRING               #组查询条件
DEFINE p_day       DATE                 #执行日期dateedit_1
DEFINE r_success   LIKE type_t.num5      
DEFINE l_sql       STRING
#DEFINE l_stan      RECORD LIKE stan_t.* #161111-00028#3--mark
#161111-00028#3---add----begin----------
DEFINE l_stan RECORD  #自營合約主檔
       stanent LIKE stan_t.stanent, #企業編號
       stanunit LIKE stan_t.stanunit, #應用組織
       stan001 LIKE stan_t.stan001, #合約編號
       stan002 LIKE stan_t.stan002, #經營方式
       stan003 LIKE stan_t.stan003, #版本
       stan004 LIKE stan_t.stan004, #模板編號
       stan005 LIKE stan_t.stan005, #供應商編號
       stan006 LIKE stan_t.stan006, #幣別
       stan007 LIKE stan_t.stan007, #稅別
       stan008 LIKE stan_t.stan008, #收付款方式
       stan009 LIKE stan_t.stan009, #結算方式
       stan010 LIKE stan_t.stan010, #結算類別
       stan011 LIKE stan_t.stan011, #訂貨滿足率
       stan012 LIKE stan_t.stan012, #簽訂日期
       stan013 LIKE stan_t.stan013, #簽訂法人
       stan014 LIKE stan_t.stan014, #簽訂人員
       stan015 LIKE stan_t.stan015, #結算中心
       stan016 LIKE stan_t.stan016, #採購中心
       stan017 LIKE stan_t.stan017, #生效日期
       stan018 LIKE stan_t.stan018, #失效日期
       stan019 LIKE stan_t.stan019, #清退日期
       stan020 LIKE stan_t.stan020, #作廢日期
       stan021 LIKE stan_t.stan021, #檔案編號
       stanownid LIKE stan_t.stanownid, #資料所有者
       stanowndp LIKE stan_t.stanowndp, #資料所有部門
       stancrtid LIKE stan_t.stancrtid, #資料建立者
       stancrtdp LIKE stan_t.stancrtdp, #資料建立部門
       stancrtdt LIKE stan_t.stancrtdt, #資料創建日
       stanmodid LIKE stan_t.stanmodid, #資料修改者
       stanmoddt LIKE stan_t.stanmoddt, #最近修改日
       stanstus LIKE stan_t.stanstus, #狀態碼
       stancnfid LIKE stan_t.stancnfid, #資料確認者
       stancnfdt LIKE stan_t.stancnfdt, #資料確認日
       stan022 LIKE stan_t.stan022, #交易條件
       stan023 LIKE stan_t.stan023, #發票類型
       stan024 LIKE stan_t.stan024, #採購價格允許人工修改
       stan025 LIKE stan_t.stan025, #修改容差率
       stan026 LIKE stan_t.stan026, #超出處理方式
       stan027 LIKE stan_t.stan027, #內外購
       stan028 LIKE stan_t.stan028, #匯率計算基準
       stan029 LIKE stan_t.stan029, #合約狀態
       stan030 LIKE stan_t.stan030, #原合約編號
       stan031 LIKE stan_t.stan031, #延期日期
       stan032 LIKE stan_t.stan032, #收銀方式
       stan033 LIKE stan_t.stan033, #續期日期
       stan034 LIKE stan_t.stan034, #文本盖章否
       stan035 LIKE stan_t.stan035, #蓋章日期
       stan036 LIKE stan_t.stan036, #備註
       stan037 LIKE stan_t.stan037, #含發票否
       stan038 LIKE stan_t.stan038, #部門
       stan039 LIKE stan_t.stan039  #按法人結算
       END RECORD
#161111-00028#3---add----end------------
DEFINE l_date      LIKE stan_t.stan018
DEFINE l_bdate     LIKE stan_t.stan018

   WHENEVER ERROR CONTINUE
   
   CALL s_transaction_begin()
   CALL cl_err_collect_init()
   LET r_success = TRUE
   #更新合同狀態為3.合同已生效
   LET l_sql = " UPDATE stan_t SET stan029 = '3' ",
               "  WHERE stanent = ",g_enterprise,
              #"    AND ",s_aooi500_sql_where(g_prog,'stanunit'),    #mark by yangxf 20151214
               "    AND ",p_wc,
               "    AND stan029 = '2' ",
               "    AND stan017 = '",p_day,"'"
   PREPARE upd_stan_pre FROM l_sql
   EXECUTE upd_stan_pre 
   IF SQLCA.sqlcode THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = " upd stan_t "
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF 
   IF r_success THEN 
      #合同自动延期
     # LET l_sql = " SELECT * FROM stan_t WHERE stanent = ",g_enterprise," AND ",p_wc, #161111-00028#3--mark
      #161111-00028#3---add----begin-------------
       LET l_sql = " SELECT stanent,stanunit,stan001,stan002,stan003,stan004,stan005,stan006,stan007,stan008,stan009,",
                   "stan010,stan011,stan012,stan013,stan014,stan015,stan016,stan017,stan018,stan019,stan020,stan021,",
                   "stanownid,stanowndp,stancrtid,stancrtdp,stancrtdt,stanmodid,stanmoddt,stanstus,stancnfid,stancnfdt,",
                   "stan022,stan023,stan024,stan025,stan026,stan027,stan028,stan029,stan030,stan031,stan032,stan033,",
                   "stan034,stan035,stan036,stan037,stan038,stan039 FROM stan_t WHERE stanent = ",g_enterprise," AND ",p_wc,
      #161111-00028#3---add----end---------------
                 #" AND ",s_aooi500_sql_where(g_prog,'stanunit'),     #mark by yangxf 20151214
                  " AND ((stan018 = '",p_day,"' AND stan029 = '3') OR (stan031 = '",p_day,"' AND stan029 = '4')) "
      PREPARE sel_stan FROM l_sql
      DECLARE sel_stan_cs CURSOR FOR sel_stan
      FOREACH sel_stan_cs INTO l_stan.*
         #延期日期=合同失效日期+1年-1天
         LET l_date = s_date_get_date(l_stan.stan018,12,0)
         IF NOT cl_null(l_stan.stan031) THEN  
            LET l_date = s_date_get_date(l_stan.stan031,12,0)
         END IF 
         UPDATE stan_t SET stan031 = l_date,
                           stan029 = '4'
          WHERE stanent = g_enterprise
            AND stan001 = l_stan.stan001
         IF SQLCA.sqlcode THEN 
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = " upd stan_t "
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH 
         END IF 
#mark by yangxf ---start----         
#         #合同账期自动更新往后延期一年到延期日期
#         IF NOT astp301_cal_period(l_stan.stan001,l_date,l_stan.stan009,l_stan.stanunit) THEN 
#            LET r_success = FALSE
#            EXIT FOREACH 
#         END IF 
#         #延期日期=合同失效日期+1天
#         LET l_bdate = s_date_get_date(l_stan.stan018,0,1)
#         IF NOT cl_null(l_stan.stan031) THEN  
#            LET l_bdate = s_date_get_date(l_stan.stan031,0,1)
#         END IF 
#         IF NOT s_astt301_period('2','',l_stan.stan001,l_bdate) THEN   
#mark by yangxf ----end-----
#add by yangxf ---start---
         IF NOT cl_null(l_stan.stan031) THEN  
            LET l_bdate = l_stan.stan031
         ELSE
            LET l_bdate = l_stan.stan018
         END IF 
         IF NOT s_astt301_period('3','',l_stan.stan001,l_bdate) THEN       
            LET r_success = FALSE
            EXIT FOREACH 
         END IF 
#add by yangxf ----end----
         #更新采购协议的失效日期为延期日期
         UPDATE stas_t SET stas019 = l_date
          WHERE stasent = g_enterprise
            AND EXISTS(SELECT 1 FROM star_t WHERE starent = stasent
                                              AND star001 = stas001
                                              AND starsite = stassite
                                              AND starent = g_enterprise
                                              AND star004 = l_stan.stan001)
         IF SQLCA.sqlcode THEN 
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = " upd stas_t "
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH 
         END IF 
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = "ast-00486"
         LET g_errparam.extend = ""
         LET g_errparam.replace[1] = l_stan.stan001
         LET g_errparam.replace[2] = l_date
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END FOREACH 
   END IF 
   IF r_success THEN 
      CALL cl_err_collect_show()
      CALL s_transaction_end('Y','0')
      RETURN TRUE
   ELSE
      CALL cl_err_collect_show()
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 产生延期帐期
# Memo...........:
# Usage..........: CALL astp301_cal_period(p_stan001,p_edate,p_stan009,p_unit)
# Input parameter: p_stan001      合同编号
#                : p_edate        结束日期
#                : p_stan009      结算类型
#                : p_unit         应用组织
# Return code....: r_success      处理状态
# Date & Author..: 2015/10/12 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp301_cal_period(p_stan001,p_edate,p_stan009,p_unit)
DEFINE p_stan001  LIKE stan_t.stan001
DEFINE p_edate    LIKE type_t.dat
DEFINE p_stan009  LIKE stan_t.stan009
DEFINE p_unit     LIKE stax_t.staxunit
DEFINE l_site     LIKE stax_t.staxsite
DEFINE l_bdate    LIKE type_t.dat
DEFINE l_edate    LIKE type_t.dat
DEFINE l_staa002  LIKE staa_t.staa002
DEFINE l_staa003  LIKE staa_t.staa003
DEFINE l_staa004  LIKE staa_t.staa004
DEFINE l_staa005  LIKE staa_t.staa005
DEFINE l_stax003  LIKE stax_t.stax003
DEFINE l_n        LIKE type_t.num5
DEFINE l_cnt      LIKE type_t.num5
DEFINE l_date     LIKE type_t.dat
DEFINE l_c        LIKE type_t.num5
DEFINE l_sys      LIKE type_t.chr1

   LET l_n = 0
   LET l_c = 0
   CALL cl_get_para(g_enterprise,g_site,'E-CIR-0058') RETURNING l_sys
   #取得最大帐期
   SELECT MAX(staxseq) INTO l_n
     FROM stax_t
    WHERE staxent = g_enterprise
      AND stax001 = p_stan001
   #获取最大帐期的截止日期
   SELECT stax003,staxsite INTO l_stax003,l_site
     FROM stax_t
    WHERE staxent = g_enterprise
      AND stax001 = p_stan001
      AND staxseq = l_n
   #根据结算方式抓取出加月数和加天数（结算方式只能设置加天或者加月）
   #加月按照自然月计算，不区分残月；加天按照时间天数算
   SELECT staa002,staa003,staa004,staa005 
     INTO l_staa002,l_staa003,l_staa004,l_staa005
     FROM staa_t
    WHERE staaent = g_enterprise 
      AND staa001 = p_stan009
   IF cl_null(l_staa002) THEN LET l_staa002 = 0 END IF
   IF cl_null(l_staa003) THEN LET l_staa003 = 0 END IF
   #延期帐期的开始日期
   LET l_bdate = l_stax003 + 1
   #延期帐期
   LET l_n = l_n + 1   
   LET l_date = l_bdate
   IF l_staa002 > 0 THEN
      IF l_staa004 = '1' THEN     #标准结算 
         LET l_edate = s_date_get_date(l_bdate,l_staa002,0)
      ELSE                        #月底结算   
         LET l_edate = s_date_get_date(l_bdate,l_staa002-1,0)
      END IF
      LET l_date = l_edate
   END IF
   
   IF l_staa004 = '1' THEN
      LET l_edate = s_date_get_date(l_date,0,l_staa003-1)
   ELSE
      IF l_staa003 > 0 THEN
         IF l_staa005 >0 THEN
            CALL s_astt301_cal_nextb(l_date,l_staa003,l_staa005) RETURNING l_date,l_edate,l_c
            #add by yangxf 20151222 ---start----
            #如果是周结，第二期的结束日期根据参数设置来
            IF l_c = 2 AND l_staa005 = 4 THEN
               IF l_sys = '2' THEN
                  LET l_edate = MDY(MONTH(l_date),15,YEAR(l_date))
               ELSE
                  LET l_edate = MDY(MONTH(l_date),14,YEAR(l_date))
               END IF
            END IF
            #add by yangxf 20151222 ---end----
         ELSE
            LET l_edate = s_date_get_date(l_date,0,l_staa003-1)
         END IF            
      END IF
   END IF
   
   IF l_staa004 = '2' AND l_staa005 = 0  THEN        #1.标准结算 2.月底结算
      LET l_edate = s_date_get_last_date(l_edate)
   END IF
   
   IF l_edate >= p_edate THEN
      LET l_edate = p_edate
   END IF
  #计算延期账期
   WHILE TRUE
      LET l_c = l_c+1
      #插入第l_n期别的账期
      INSERT INTO stax_t (staxent,staxsite,staxunit,staxseq,stax001,stax002,stax003,stax004,stax005,stax006)
       VALUES (g_enterprise,l_site,p_unit,l_n,p_stan001,l_bdate,l_edate,l_edate,'N','') 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET l_bdate = l_edate + 1
      IF l_bdate > p_edate THEN
         EXIT WHILE 
      END IF
      LET l_date = l_bdate
      IF l_staa002 > 0 THEN
         IF l_staa004 = '1' THEN     #标准结算 
            LET l_edate = s_date_get_date(l_bdate,l_staa002,0)
         ELSE                        #月底结算   
            LET l_edate = s_date_get_date(l_bdate,l_staa002-1,0)
         END IF
         LET l_date = l_edate
      END IF
  
      IF l_staa004 = '1' THEN
         LET l_edate = s_date_get_date(l_date,0,l_staa003-1)
      ELSE
         IF l_staa003 > 0 THEN
            IF l_staa005 >0 THEN
               #加入月拆分期的计算
               #例:加天为7 月拆分为4   2月1-28 最后一期为2月22-2月28 最后一期7天
               #例:加天为7 月拆分为4   8月1-31 最后一期为8月22-8月31 最后一期10天
               IF l_c MOD l_staa005 = 0 THEN   #月拆分最后一期。如果上期结束日期小于月底，则该期账期是 上期结束+1 到 该月月底
                  LET l_edate = s_date_get_last_date(l_date)
                  LET l_c = 0
               ELSE
                  CALL s_astt301_cal_nextb(l_date,l_staa003,l_staa005) RETURNING l_date,l_edate,l_c
                  #例:开始日6月12日。第一期6月12-6月21 第二期 6月22日 到月底 此时l_c =2 mod 4 <> 0                  
                  #LET p_next_b = s_date_get_date(l_date,0,l_staa003-1)
                  #IF p_next_b >= s_date_get_last_date(l_date) THEN  #下一期账期 预计 跨月了。则取当月月底
                  #   LET p_next_b = s_date_get_last_date(l_date)
                  #   LET l_c = 0          #初始化为0
                  #END IF
                  #add by yangxf 20151222 ---start----
                  #如果是周结，第二期的结束日期根据参数设置来
                  IF l_c = 2 AND l_staa005 = 4 THEN
                     IF l_sys = '2' THEN
                        LET l_edate = MDY(MONTH(l_date),15,YEAR(l_date))
                     ELSE
                        LET l_edate = MDY(MONTH(l_date),14,YEAR(l_date))
                     END IF
                  END IF
                  #add by yangxf 20151222 ---end----
               END IF
            ELSE
               LET l_edate = s_date_get_date(l_date,0,l_staa003-1)
            END IF            
         END IF
      END IF
      
      IF l_staa004 = '2' AND l_staa005 = 0  THEN        #1.标准结算 2.月底结算
         LET l_edate = s_date_get_last_date(l_edate)
      END IF
      
      IF l_edate >= p_edate THEN
         LET l_edate = p_edate
      END IF
      LET l_n = l_n + 1
   
   END WHILE
   
   RETURN TRUE
END FUNCTION

#end add-point
 
{</section>}
 
