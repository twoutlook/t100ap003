#該程式未解開Section, 採用最新樣板產出!
{<section id="astp322.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0004(2015-10-22 16:05:13), PR版次:0004(2016-10-25 10:17:23)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000037
#+ Filename...: astp322
#+ Description: 自營費用單批次還原作業
#+ Creator....: 06189(2015-10-22 15:31:00)
#+ Modifier...: 06189 -SD/PR- 08172
 
{</section>}
 
{<section id="astp322.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#160523-00009#1   2016/5/25  by 08172  经营方式scc显示修改
#161024-00025#4   2016/10/24 by 08172   组织调整
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
       stan015 LIKE type_t.chr500, 
   stan001 LIKE type_t.chr500, 
   stan005 LIKE type_t.chr500, 
   stbx005 LIKE type_t.chr20, 
   stbx008 LIKE type_t.chr10, 
   stan002 LIKE type_t.chr10, 
   stan009 LIKE type_t.chr10, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_caldate  LIKE type_t.dat
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astp322.main" >}
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
      CALL astp322_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp322 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp322_init()
 
      #進入選單 Menu (="N")
      CALL astp322_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      CALL s_aooi500_drop_temp() RETURNING l_success
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp322
   END IF
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp322.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp322_init()
 
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
   CALL s_aooi500_create_temp() RETURNING l_success
   CALL cl_set_combo_scc_part("stan002","6013",'1,2,3,A,B')  #160523-00009#1    by 08172
   CALL astp322_stan009_display('stan009')           #add by geza 20151123
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp322.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp322_ui_dialog()
 
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
   LET g_caldate = g_today-1 
   DISPLAY g_caldate TO caldate
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON stan015,stan001,stan005,stbx005,stbx008,stan002,stan009
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
            IF s_aooi500_setpoint(g_prog,'stan015') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stan015',g_site,'c')
               CALL q_ooef001_24() 
            ELSE
               LET g_qryparam.where = "ooef212 = 'Y'"
               CALL q_ooef001() 
            END IF                         #呼叫開窗
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
            CALL q_stan001_2()                           #呼叫開窗
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
            LET g_qryparam.arg1 = "('1','3')"
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
            
 
 
         #Ctrlp:construct.c.stbx005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbx005
            #add-point:ON ACTION controlp INFIELD stbx005 name="construct.c.stbx005"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " stba014 = '1'"
            CALL q_stbadocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbx005  #顯示到畫面上
            NEXT FIELD stbx005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbx005
            #add-point:BEFORE FIELD stbx005 name="construct.b.stbx005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbx005
            
            #add-point:AFTER FIELD stbx005 name="construct.a.stbx005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbx008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbx008
            #add-point:ON ACTION controlp INFIELD stbx008 name="construct.c.stbx008"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO stbx008  #顯示到畫面上
            NEXT FIELD stbx008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbx008
            #add-point:BEFORE FIELD stbx008 name="construct.b.stbx008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbx008
            
            #add-point:AFTER FIELD stbx008 name="construct.a.stbx008"
            
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
 
 
         #Ctrlp:construct.c.stan009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stan009
            #add-point:ON ACTION controlp INFIELD stan009 name="construct.c.stan009"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan009  #顯示到畫面上
            NEXT FIELD stan009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stan009
            #add-point:BEFORE FIELD stan009 name="construct.b.stan009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stan009
            
            #add-point:AFTER FIELD stan009 name="construct.a.stan009"
            
            #END add-point
            
 
 
 
            
            #add-point:其他管控 name="cs.other"
            
            #end add-point
            
         END CONSTRUCT
 
 
 
      
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
         
         #end add-point
         #add-point:ui_dialog段input name="ui_dialog.more_input"
         INPUT g_caldate FROM caldate ATTRIBUTE(WITHOUT DEFAULTS)
            BEFORE INPUT
           
            AFTER FIELD caldate
              IF NOT cl_null(g_caldate) THEN
                 IF g_caldate >= g_today THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = 'ast-00149'
                    LET g_errparam.extend = ''
                    LET g_errparam.popup = TRUE
                    CALL cl_err()
                    
                    NEXT FIELD caldate
                 END IF
              END IF
              
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
            CALL astp322_get_buffer(l_dialog)
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
         CALL astp322_init()
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
                 CALL astp322_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp322_transfer_argv(ls_js)
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
 
{<section id="astp322.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp322_transfer_argv(ls_js)
 
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
 
{<section id="astp322.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp322_process(ls_js)
 
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
   DEFINE l_success1   LIKE type_t.num5
   DEFINE l_msg         STRING           #160225-00040#6 20160302 add by beckxie
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
   CALL s_transaction_begin()
 
   CALL cl_err_collect_init()
   LET l_success = TRUE
   #160225-00040#16 20160328 add by beckxie---S
   LET l_msg = cl_getmsg('ast-00330',g_lang)
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#16 20160328 add by beckxie---E
   
   #CALL s_expense_astp322(g_caldate,g_master.wc) RETURNING l_success
   CALL s_expense_astp322('1',g_caldate,g_master.wc,'') RETURNING l_success

   #160225-00040#16 20160328 add by beckxie---S
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#16 20160328 add by beckxie---E
   
   #CALL s_expense_cost(g_caldate,g_master.wc) RETURNING l_success1
   CALL cl_err_collect_show()
   IF l_success  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'adz-00217'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      CALL s_transaction_end("Y","0")
   ELSE
     
      
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'adz-00218'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      CALL s_transaction_end("N","0")
   END IF
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp322_process_cs CURSOR FROM ls_sql
#  FOREACH astp322_process_cs INTO
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
   CALL astp322_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp322.get_buffer" >}
PRIVATE FUNCTION astp322_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp322.msgcentre_notify" >}
PRIVATE FUNCTION astp322_msgcentre_notify()
 
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
 
{<section id="astp322.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 结算方式下拉框显示
# Memo...........:
# Usage..........: CALL astp322_stan009_display(p_field)
#                  RETURNING 回传参数
# Input parameter: p_field        栏位名称
# Return code....: 回传参数变量1   回传参数变量说明1
# Date & Author..: 20151123  By geza
################################################################################
PRIVATE FUNCTION astp322_stan009_display(p_field)
DEFINE p_field        LIKE type_t.chr20     #栏位名称
DEFINE l_staa001      LIKE staa_t.staa001
DEFINE l_staal003     LIKE staal_t.staal003
DEFINE l_cnt          LIKE type_t.num5
DEFINE l_sql          STRING
DEFINE cb004          ui.ComboBox
   
   
   LET cb004 = ui.ComboBox.forName(p_field)
   CALL cb004.clear()
   
   LET l_cnt = 0
   LET l_sql = " SELECT DISTINCT staa001,staal003 ",
               "   FROM staa_t LEFT JOIN staal_t ON staaent = staalent AND staa001 = staal001 AND staal002 = '",g_dlang,"' ",
               "  WHERE staaent = ",g_enterprise," ",
               "    AND staastus = 'Y' "
   LET l_sql = l_sql," ORDER BY staa001 "
  
   PREPARE sel_staa_pre FROM l_sql
   DECLARE sel_staa_cs  CURSOR FOR sel_staa_pre
   LET l_cnt = 1
   FOREACH sel_staa_cs  INTO l_staa001,l_staal003
      LET l_staal003 = l_staa001,':',l_staal003
      IF cl_null(l_staal003) THEN
         CALL cb004.addItem(l_staa001,l_staa001)
      ELSE
         CALL cb004.addItem(l_staa001,l_staal003)
      END IF
      LET l_cnt = l_cnt+1
   END FOREACH
END FUNCTION

#end add-point
 
{</section>}
 
