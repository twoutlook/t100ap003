#該程式未解開Section, 採用最新樣板產出!
{<section id="astp510.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0008(2016-06-15 13:38:15), PR版次:0008(2016-10-24 16:56:10)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000052
#+ Filename...: astp510
#+ Description: 收銀小票分攤明細計算批次
#+ Creator....: 06778(2015-08-26 10:00:03)
#+ Modifier...: 06814 -SD/PR- 06189
 
{</section>}
 
{<section id="astp510.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#Memos
#160604-00009#144 2016/07/13 by 06814 1.運行日期按照收款日期rtjf025來算(租賃可能一個銷售單多次付款的情況)
#                                     2.stgd006 賦值:如果是租賃，給rtja102
#                                     3.修正款別類型、款別編號的順序
#add by geza 20161024 #161024-00025#10 aooi500规范调整
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
        l_date           LIKE type_t.dat,           #add by yangxf 20151124
        stgd013          LIKE stgd_t.stgd013,       #160613-00045#3 20160615 add by beckxie
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       stgdsite LIKE type_t.chr10, 
   stgd004 LIKE type_t.chr10, 
   stgd005 LIKE type_t.chr20, 
   stgd014 LIKE type_t.chr20, 
   stgd013 LIKE type_t.chr10, 
   l_date LIKE type_t.dat, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE gs_date    LIKE type_t.dat
DEFINE ls_date    LIKE type_t.dat
#160604-00009#103 20160627 add by beckxie---S
 TYPE type_g_stgd RECORD
       stgdent  LIKE stgd_t.stgdent,  #企業編號
       stgdsite LIKE stgd_t.stgdsite, #營運組織
       stgdunit LIKE stgd_t.stgdunit, #應用組織
       stgd001  LIKE stgd_t.stgd001,  #收款序號
       stgd002  LIKE stgd_t.stgd002,  #銷售日期
       stgd003  LIKE stgd_t.stgd003,  #商品編號
       stgd004  LIKE stgd_t.stgd004,  #庫區編號
       stgd005  LIKE stgd_t.stgd005,  #專櫃/鋪位編號
       stgd006  LIKE stgd_t.stgd006,  #供應商編號
       stgd007  LIKE stgd_t.stgd007,  #銷售收銀單號
       stgd008  LIKE stgd_t.stgd008,  #收銀大類
       stgd009  LIKE stgd_t.stgd009,  #收銀小類
       stgd010  LIKE stgd_t.stgd010,  #收銀分攤否
       stgd011  LIKE stgd_t.stgd011,  #小票實收金額
       stgd012  LIKE stgd_t.stgd012,  #小票明細實收金額
       stgdseq  LIKE stgd_t.stgdseq,  #銷售單項次
       stgd013  LIKE stgd_t.stgd013,  #經營方式
       stgd014  LIKE stgd_t.stgd014,  #合約編號
       stgd015  LIKE stgd_t.stgd015,  #商品品類
       stgd016  LIKE stgd_t.stgd016,  #手續費金額
       stgd017  LIKE stgd_t.stgd017   #儲值折扣金額
END RECORD
#160604-00009#103 20160627 add by beckxie---E
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astp510.main" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
   DEFINE l_success       LIKE type_t.num5
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
      CALL cl_get_para(g_enterprise,g_site,'S-CIR-0001') RETURNING gs_date
      LET l_success = ''
      CALL s_aooi500_create_temp() RETURNING l_success
      CALL astp510_create_tmp() RETURNING l_success
      INITIALIZE ls_date TO NULL
      #end add-point
      CALL astp510_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp510 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp510_init()
 
      #進入選單 Menu (="N")
      CALL astp510_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp510
   END IF
 
   #add-point:作業離開前 name="main.exit"
   DROP TABLE astp510_tmp_a
   DROP TABLE astp510_tmp_b
   DROP TABLE astp510_tmp_c
   CALL s_aooi500_drop_temp() RETURNING l_success #add by geza 20161024 #161024-00025#10
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp510.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp510_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   DEFINE l_success       LIKE type_t.num5
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
   CALL cl_get_para(g_enterprise,g_site,'S-CIR-0001') RETURNING gs_date
   LET l_success = ''
   CALL cl_set_combo_scc_part('stgd013','6013','4,5')   #160613-00045#3 20160615 add by beckxie
   CALL s_aooi500_create_temp() RETURNING l_success
   CALL astp510_create_tmp() RETURNING l_success
   INITIALIZE ls_date TO NULL
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp510.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp510_ui_dialog()
 
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
         INPUT BY NAME g_master.stgd013,g_master.l_date 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgd013
            #add-point:BEFORE FIELD stgd013 name="input.b.stgd013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgd013
            
            #add-point:AFTER FIELD stgd013 name="input.a.stgd013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgd013
            #add-point:ON CHANGE stgd013 name="input.g.stgd013"
            
            #END add-point 
 
 
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
 
 
 
                     #Ctrlp:input.c.stgd013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgd013
            #add-point:ON ACTION controlp INFIELD stgd013 name="input.c.stgd013"
            
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
         CONSTRUCT BY NAME g_master.wc ON stgdsite,stgd004,stgd005,stgd014
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.stgdsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgdsite
            #add-point:ON ACTION controlp INFIELD stgdsite name="construct.c.stgdsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stgdsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgdsite  #顯示到畫面上
            NEXT FIELD stgdsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgdsite
            #add-point:BEFORE FIELD stgdsite name="construct.b.stgdsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgdsite
            
            #add-point:AFTER FIELD stgdsite name="construct.a.stgdsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgd004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgd004
            #add-point:ON ACTION controlp INFIELD stgd004 name="construct.c.stgd004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_inaa001()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgd004  #顯示到畫面上
            NEXT FIELD stgd004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgd004
            #add-point:BEFORE FIELD stgd004 name="construct.b.stgd004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgd004
            
            #add-point:AFTER FIELD stgd004 name="construct.a.stgd004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgd005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgd005
            #add-point:ON ACTION controlp INFIELD stgd005 name="construct.c.stgd005"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            #160613-00045#3 20160615 add by beckxie---S
            CALL q_stgd005() 
            #160613-00045#3 20160615 add by beckxie---E
            DISPLAY g_qryparam.return1 TO stgd005  #顯示到畫面上
            NEXT FIELD stgd005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgd005
            #add-point:BEFORE FIELD stgd005 name="construct.b.stgd005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgd005
            
            #add-point:AFTER FIELD stgd005 name="construct.a.stgd005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgd014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgd014
            #add-point:ON ACTION controlp INFIELD stgd014 name="construct.c.stgd014"
            #160613-00045#3 20160615 add by beckxie---S
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stgd014_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgd014  #顯示到畫面上
            NEXT FIELD stgd014                     #返回原欄位
            #160613-00045#3 20160615 add by beckxie---E
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgd014
            #add-point:BEFORE FIELD stgd014 name="construct.b.stgd014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgd014
            
            #add-point:AFTER FIELD stgd014 name="construct.a.stgd014"
            
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
            CALL astp510_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            LET g_master.l_date=g_today-1
            DISPLAY g_master.l_date to l_date
            DISPLAY g_site TO stgdsite
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
         CALL astp510_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      LET lc_param.l_date = g_master.l_date
      LET lc_param.stgd013 = g_master.stgd013   #160613-00045#3 20160615 add by beckxie
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
                 CALL astp510_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp510_transfer_argv(ls_js)
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
 
{<section id="astp510.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp510_transfer_argv(ls_js)
 
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
 
{<section id="astp510.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp510_process(ls_js)
 
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
   DEFINE l_i           INTEGER
   DEFINE l_loop        LIKE type_t.num5   #160225-00040#18 Add By Ken 160314
   DEFINE l_msg         STRING             #160225-00040#18 Add By Ken 160314   
   DEFINE l_where       STRING
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
      #160225-00040#18 Add By Ken 160314(S)
      LET l_loop = 3
      CALL cl_progress_bar_no_window(l_loop)  
      #160225-00040#18 Add By Ken 160314(E)
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp510_process_cs CURSOR FROM ls_sql
#  FOREACH astp510_process_cs INTO
   #add-point:process段process name="process.process"
  
   #160225-00040#18 Add By Ken 160314(S)  資料準備 
   LET l_msg = cl_getmsg('ade-00114',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 Add By Ken 160314(E)
   
   CALL cl_err_collect_init()   
   CALL s_transaction_begin()
#   CALL astp510_p(g_master.wc,g_master.l_date)  RETURNING l_success,l_i      #mark by yangxf 20151124
   #add by yangxf 20151124  ---begin----
   IF cl_null(lc_param.l_date) THEN 
      LET lc_param.l_date = g_today-1                                  
   END IF
   IF cl_null(lc_param.wc) THEN 
      LET lc_param.wc = " 1=1 "                          
   END IF
   CALL s_aooi500_sql_where(g_prog,'stgdsite') RETURNING l_where #add by geza 20161024 #161024-00025#10
   LET lc_param.wc = lc_param.wc, " AND ",l_where #add by geza 20161024 #161024-00025#10
   #add by yangxf 20151124 -----end-----
   #160613-00045#3 20160615 modify by beckxie---S
   #CALL astp510_p(lc_param.wc,lc_param.l_date)  RETURNING l_success,l_i      #add by yangxf 20151124
   CALL astp510_p(lc_param.wc,lc_param.l_date,lc_param.stgd013)  RETURNING l_success,l_i      #add by yangxf 20151124
   #160613-00045#3 20160615 modify by beckxie---E
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
   CALL astp510_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp510.get_buffer" >}
PRIVATE FUNCTION astp510_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.stgd013 = p_dialog.getFieldBuffer('stgd013')
   LET g_master.l_date = p_dialog.getFieldBuffer('l_date')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp510.msgcentre_notify" >}
PRIVATE FUNCTION astp510_msgcentre_notify()
 
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
 
{<section id="astp510.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 批处理逻辑
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: p_wc    画面组条件
#                : p_date  统计日期
# Return code....: l_sucess   执行成功/失败
#                : 
# Date & Author..: 2015/08/26 By yuhl
# Modify.........: 20160615 modify(增加傳入參數p_rtdx003) by beckxie
################################################################################
PRIVATE FUNCTION astp510_p(p_wc,p_date,p_rtdx003)
    DEFINE l_3monthsago   LIKE type_t.dat        #ADDED BY LANJJ 2015-12-30 
    DEFINE p_wc           STRING
    DEFINE p_date         LIKE type_t.dat
    DEFINE p_rtdx003      LIKE rtdx_t.rtdx003    #經營方式   #160613-00045#3 20160615 add by beckxie
    DEFINE l_success      LIKE type_t.num5
    DEFINE l_i            INTEGER
    DEFINE l_sql          STRING
    DEFINE l_sql_t        STRING
    DEFINE l_count        LIKE type_t.num5
    DEFINE l_rtjfseq      LIKE rtjf_t.rtjfseq   #160615-00046#6 20160617 add by beckxie
    DEFINE l_rate         LIKE type_t.num20_6   #160615-00046#6 20160617 add by beckxie
    #DEFINE l_stgd_t       RECORD LIKE stgd_t.* #160604-00009#103 20160627 mark by beckxie
    #160604-00009#103 20160627 add by beckxie---S
    DEFINE l_stgd_t       type_g_stgd           
    DEFINE l_stgd_tmp     type_g_stgd            
    DEFINE l_stgd007_tmp  LIKE stgd_t.stgd007  
    DEFINE l_stgd009_tmp  LIKE stgd_t.stgd009  #160604-00009#144 20160713 add by beckxie
    #DEFINE l_stgd008_tmp  LIKE stgd_t.stgd008  #160604-00009#144 20160713 mark by beckxie
    DEFINE l_stgd012_all  LIKE stgd_t.stgd012  
    DEFINE l_sum_stgd012  LIKE stgd_t.stgd012  
    DEFINE l_stgd012_tmp  LIKE stgd_t.stgd012  
    DEFINE l_stgd016_all  LIKE stgd_t.stgd016  
    DEFINE l_stgd016_tmp  LIKE stgd_t.stgd016  
    DEFINE l_stgd017_all  LIKE stgd_t.stgd017  
    DEFINE l_stgd017_tmp  LIKE stgd_t.stgd017  
    #160604-00009#103 20160627 add by beckxie---E
    DEFINE l_tmp_c        RECORD
             rtjbdocno   LIKE type_t.chr20,      # 销售收银单号
             rtjbseq     LIKE type_t.num10,      # 销售单项次
             rtjb004     LIKE type_t.chr100,     # 商品编号
             rtjb025     LIKE type_t.chr10,      # 库区编号
             rtjb028     LIKE type_t.chr20,      # 专柜编号
             l_rate      LIKE type_t.num20_6     # 比率
                         END RECORD
                         
    DEFINE l_tmp_d       RECORD
             rtjbdocno   LIKE type_t.chr20,      # 销售收银单号             
             sum_rtjb031 LIKE type_t.num20_6    # 本小票总销售金额
                         END RECORD         
    DEFINE l_ooef016      LIKE ooef_t.ooef016 #ADDED BY LANJJ 2015-10-27  
    DEFINE l_loop        LIKE type_t.num5   #160225-00040#18 Add By Ken 160314
    DEFINE l_msg         STRING             #160225-00040#18 Add By Ken 160314 
    DEFINE l_cnt         LIKE type_t.num5   #160604-00009#144 20160713 add by beckxie

    LET l_success = TRUE
        
    # DELETE  (S)
   #IF g_master.l_date > gs_date THEN   #mark by yangxf 20151124
    IF p_date > gs_date THEN            #add by yangxf 20151124           
      
       LET l_sql= "  DELETE FROM stgd_t WHERE stgdent=",g_enterprise," AND stgdsite='",g_site,"'",
                                       #" AND stgd002=to_date('",g_master.l_date,"','yy/mm/dd') AND ",p_wc    #mark by yangxf 20151124
                                        " AND stgd002=to_date('",p_date,"','yy/mm/dd') AND ",p_wc             #add by yangxf 20151124                                       
    
       PREPARE p510_pr FROM l_sql
       EXECUTE p510_pr 
          
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL 
          LET g_errparam.extend = ' DELETE stgd_t'
          LET g_errparam.code   = SQLCA.sqlcode 
          LET g_errparam.popup  = FALSE 
          CALL cl_err()
          LET l_success=FALSE 
          RETURN  l_success,1 
       END IF
    END IF
    # DELETE (E) 

    # DELETE ADDED BY LANJJ 2015-12-30 ---start---151214-00017#9  删除销售日期<=执行日期-3个月的数据。 顾问：刘鑫
    IF p_date > gs_date THEN          
       #三个月前日期
       SELECT ADD_MONTHS(to_date(p_date,'yy/mm/dd'), -3) INTO l_3monthsago FROM dual 
       
       #lanjj add on 2016-04-21  将删除的数据存入stgj备份起来  start
       
       LET l_sql = " INSERT INTO stgj_t(stgjent,stgjsite,stgjunit,
                                        stgj001,stgj002,stgj003,stgj004,stgj005,
                                        stgj006,stgj007,stgj008,stgj009,stgj010,
                                        stgj011,stgj012,stgjseq ) ",
                   " SELECT stgdent,stgdsite,stgdunit,
                            stgd001,stgd002,stgd003,stgd004,stgd005,
                            stgd006,stgd007,stgd008,stgd009,stgd010,
                            stgd011,stgd012,stgdseq ",
                   "   FROM stgd_t ",
                   "  WHERE stgdent = '",g_enterprise,"' ", 
                   "    AND stgdsite = '",g_site,"' ", 
                   "    AND stgd002 = to_date('",l_3monthsago,"','yy/mm/dd') AND ",p_wc             
       EXECUTE IMMEDIATE l_sql
       #lanjj add on 2016-04-21  将删除的数据存入stgj备份起来  end
       
       
       LET l_sql = "  DELETE FROM stgd_t ", 
                   "  WHERE stgdent = '",g_enterprise,"' ", 
                   "    AND stgdsite = '",g_site,"' ", 
                   "    AND stgd002 <= to_date('",l_3monthsago,"','yy/mm/dd') AND ",p_wc             
       PREPARE p510_del FROM l_sql
       EXECUTE p510_del 
          
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL 
          LET g_errparam.extend = ' DELETE stgd_t'
          LET g_errparam.code   = SQLCA.sqlcode 
          LET g_errparam.popup  = FALSE 
          CALL cl_err()
          LET l_success=FALSE 
          RETURN  l_success,1 
       END IF
    END IF
    # DELETE ADDED BY LANJJ 2015-12-30 ---end---
    

    # INSERT (S)
    
    # step 1
    DELETE FROM astp510_tmp_a
    LET l_sql_t = " SELECT DISTINCT t0.rtjbdocno,t0.rtjbseq,t0.rtjb004,t0.rtjb025,t0.rtjb028 ,
                     t0.rtjb031,0,0 ",
#                  "   FROM rtdx_t,rtja_t,rtjb_t t0  ",   #marked by lanjj 2015-12-30 151214-00017#9 调整为不控制经营方式 顾问：刘鑫 
                  "   FROM rtja_t,rtjb_t t0  ",           #added by lanjj 2015-12-30
#                  "  LEFT JOIN rtjb_t t1 ON t1.rtjbent  = t0.rtjbent   AND t1.rtjbsite=t0.rtjbsite
#                                        AND t1.rtjbdocno= t0.rtjbdocno AND t1.rtjbseq =t0.rtjbseq ",
#                                        
#                  "  WHERE rtdxent=t0.rtjbent ",         #marked by lanjj 2015-12-30
#                  "    AND rtdxsite=t0.rtjbsite  ",      #marked by lanjj 2015-12-30
#                  "    AND rtdx001=t0.rtjb004 ",         #marked by lanjj 2015-12-30
                  "  WHERE t0.rtjb036 IN ('1','2','3')",
                 #"    AND rtdx003 = '4'",                #marked by lanjj 2015-12-30
                  "    AND t0.rtjbent=",g_enterprise,
                  "    AND t0.rtjbsite='",g_site,"'",
                 #"    AND rtjaent=t0.rtjbent                                               #mark by yangxf 20151124
                 #     AND rtjadocno=t0.rtjbdocno                                           #mark by yangxf 20151124
                 #     AND rtjadocdt=to_date('",g_master.l_date,"','yy/mm/dd')",            #mark by yangxf 20151124
                  "    AND rtjaent=t0.rtjbent ",                                            #add by yangxf 20151124
                  "    AND rtjadocno=t0.rtjbdocno ",                                        #add by yangxf 20151124
                  #160604-00009#144 20160713 modify by beckxie---S
                  #"    AND rtjadocdt=to_date('",p_date,"','yy/mm/dd')"                      #add by yangxf 20151124
                  "    AND EXISTS(SELECT 1 FROM rtjf_t ",
                  "                WHERE rtjfent = ",g_enterprise,
                  "                  AND rtjfdocno = rtjadocno ",
                  "                  AND rtjf025 = TO_DATE('",p_date,"','yy/mm/dd')) "
                  #160604-00009#144 20160713 modify by beckxie---E
                  # "  GROUP BY t0.rtjbdocno,t0.rtjbseq,t0.rtjb004,t0.rtjb025,t0.rtjb028 , t0.rtjb031",
    #160613-00045#3 20160615 add by beckxie---S
    IF NOT cl_null(p_rtdx003) THEN
       LET l_sql_t = l_sql_t ,
                  "    AND EXISTS (SELECT 1 FROM rtdx_t ",
                  "                 WHERE rtdxent = t0.rtjbent AND rtdxsite = t0.rtjbsite ",
                  "                   AND rtdx001 = t0.rtjb004 AND rtdx003 = '",p_rtdx003,"') "
    END IF
    #160613-00045#3 20160615 add by beckxie---E
    LET l_sql_t = l_sql_t,"  ORDER BY t0.rtjbdocno,t0.rtjbseq "
    LET l_sql = " INSERT INTO astp510_tmp_a(rtjbdocno,rtjbseq,rtjb004,rtjb025,rtjb028,rtjb031,sum_rtjb031,l_rate) ",l_sql_t
    EXECUTE IMMEDIATE l_sql
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL 
       LET g_errparam.extend = 'INSERT Table astp510_tmp_a fail'
       LET g_errparam.code   = SQLCA.sqlcode 
       LET g_errparam.popup  = FALSE 
       CALL cl_err()
       LET l_success=FALSE 
       RETURN  l_success,1 
    END IF
   
   
    # 计算本小票总销售金额 (S)
    LET l_sql = " SELECT DISTINCT rtjbdocno,SUM(nvl(rtjb031,0)) FROM astp510_tmp_a GROUP BY rtjbdocno"
    PREPARE astp510_pb8 FROM l_sql
    DECLARE astp510_pb8_cur CURSOR FOR astp510_pb8   
    INITIALIZE l_tmp_d.* TO NULL
    
    FOREACH astp510_pb8_cur INTO l_tmp_d.*
    
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "FOREACH astp510_pb8_cur:" 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               EXIT FOREACH
            END IF
            
            UPDATE astp510_tmp_a SET sum_rtjb031 = l_tmp_d.sum_rtjb031
                               #WHERE rtjbdocno   = l_tmp_c.rtjbdocno  #MRKED BY LANJJ 2015-10-28
                               WHERE rtjbdocno   = l_tmp_d.rtjbdocno  #ADDED BY LANJJ 2015-10-28                                 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'UPDATE astp_tmp_a fail 1 '
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
               LET l_success=FALSE 
               RETURN  l_success,1 
            END IF
            INITIALIZE l_tmp_d.* TO NULL
    END FOREACH
    
    # 本小票总销售金额 (E)
    
    #160225-00040#18 Add By Ken 160314(S)   產生資料
    LET l_msg = cl_getmsg('ast-00330',g_lang)
    CALL cl_progress_no_window_ing(l_msg)   
    #160225-00040#18 Add By Ken 160314(e) 
   
    # 更新比率
    DELETE FROM astp510_tmp_c
    LET l_sql_t = " SELECT rtjbdocno,rtjbseq,rtjb004,rtjb025,rtjb028,rtjb031/ CASE WHEN sum_rtjb031=0 THEN 1 ELSE sum_rtjb031 END as l_rate",
                  "   FROM astp510_tmp_a "
                  
    LET l_sql = " INSERT INTO astp510_tmp_c(rtjbdocno,rtjbseq,rtjb004,rtjb025,rtjb028,l_rate) " ,l_sql_t
    EXECUTE IMMEDIATE l_sql
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL 
       LET g_errparam.extend = 'INSERT Table astp510_tmp_c fail 2'
       LET g_errparam.code   = SQLCA.sqlcode 
       LET g_errparam.popup  = FALSE 
       CALL cl_err()
       LET l_success=FALSE 
       RETURN  l_success,1 
    END IF
    
    LET l_sql = " SELECT * FROM astp510_tmp_c "
    PREPARE astp510_pb FROM l_sql
    DECLARE astp510_pb_cur CURSOR FOR astp510_pb   
    INITIALIZE l_tmp_c.* TO NULL
    
    FOREACH astp510_pb_cur INTO l_tmp_c.*
    
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "FOREACH:" 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               EXIT FOREACH
            END IF
            
            UPDATE astp510_tmp_a SET l_rate    = l_tmp_c.l_rate
                               WHERE rtjbdocno = l_tmp_c.rtjbdocno
                                 AND rtjbseq   = l_tmp_c.rtjbseq
                                 AND rtjb004   = l_tmp_c.rtjb004
                                 AND rtjb025   = l_tmp_c.rtjb025
                                 AND rtjb028   = l_tmp_c.rtjb028
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'UPDATE astp_tmp_a fail'
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
               LET l_success=FALSE 
               RETURN  l_success,1 
            END IF
            INITIALIZE l_tmp_c.* TO NULL
    END FOREACH
    
    
    # step 2
        
    DELETE FROM astp510_tmp_b
    #160604-00009#103 20160624 mark by beckxie---S
    #LET l_sql_t = " SELECT DISTINCT t0.rtjfdocno,t0.rtjfseq,t0.rtjfseq1,t0.rtjf002,t0.rtjf001,t0.rtjf031 ",
    #              "   FROM rtjf_t t0,astp510_tmp_a t1 ",
    #              "  WHERE t0.rtjfdocno=t1.rtjbdocno ",
    #              # "    AND t0.rtjfseq=t1.rtjbseq ",
    #              "    AND t0.rtjfent=",g_enterprise,
    #              "    AND t0.rtjfsite='",g_site,"'"
    #LET l_sql = " INSERT INTO astp510_tmp_b(rtjfdocno,rtjfseq,rtjfseq1,rtjf002,rtjf001,rtjf031) ",l_sql_t
    #160604-00009#103 20160624 mark by beckxie---E
    #160604-00009#103 20160624 add by beckxie---S
    LET l_sql_t = "SELECT DISTINCT rtjfdocno ,rtjfseq,DENSE_RANK() OVER(PARTITION BY rtjfdocno ORDER BY rtjfdocno,rtjf001,rtjf002), rtjf002,rtjf001 , sum_rtjf031 ",
                  "  FROM  ",
                  "     (SELECT DISTINCT t0.rtjfdocno,t0.rtjfseq,t0.rtjf002,t0.rtjf001,SUM(t0.rtjf031) sum_rtjf031  ",
                  "        FROM rtjf_t t0 ", 
                  "     WHERE t0.rtjfent=",g_enterprise,
                  "       AND t0.rtjfsite='",g_site,"'" ,
                  "       AND t0.rtjf025 = TO_DATE('",p_date,"','yy/mm/dd') ",   #160604-00009#144 20160713 add by beckxie
                  "        GROUP BY t0.rtjfdocno,t0.rtjfseq,rtjf002,t0.rtjf001) t1 ,astp510_tmp_a t2",
                  "  WHERE t1.rtjfdocno=t2.rtjbdocno "
    #" SELECT DISTINCT t0.rtjfdocno,t0.rtjfseq,DENSE_RANK() OVER(PARTITION BY deba_t.debasite ORDER BY t0.rtjfdocno,t0.rtjf001), ",
    #              "                 t0.rtjf002,t0.rtjf001,SUM(t0.rtjf031)",
    #              "   FROM rtjf_t t0,astp510_tmp_a t1 ",
    #              "  WHERE t0.rtjfdocno=t1.rtjbdocno ",
    #              "    AND t0.rtjfent=",g_enterprise,
    #              "    AND t0.rtjfsite='",g_site,"'" "
    #              " GROUP BY t0.rtjfdocno,t0.rtjfseq,
    LET l_sql = " INSERT INTO astp510_tmp_b(rtjfdocno,rtjfseq,rtjfseq1,rtjf002,rtjf001,rtjf031) ",l_sql_t
    #160604-00009#103 20160624 add by beckxie---E
    EXECUTE IMMEDIATE l_sql 
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL 
       LET g_errparam.extend = 'INSERT Table astp510_tmp_b fail'
       LET g_errparam.code   = SQLCA.sqlcode 
       LET g_errparam.popup  = FALSE 
       CALL cl_err()
       LET l_success=FALSE 
       RETURN  l_success,1        
    END IF
                        # 企业编号 ，营运组织 ，应用组织， 收款序号 ，销售日期，
                        # 商品编号，库区编号，专柜编号，供应商编号，销售收银单号 ，
                        # 款别编号，款别类型，收银分摊否，小票实收金额，小票明细实收金额，
                        # 销售单项次，收款项次，比率
    
    LET l_sql = "SELECT '','','',t2.rtjfseq1,'', ",
                "     t1.rtjb004,t1.rtjb025,t1.rtjb028,'',t1.rtjbdocno, ",
                #"     t2.rtjf002,t2.rtjf001,'Y',t1.sum_rtjb031,t1.l_rate*t2.rtjf031, ",   #160604-00009#144 20160713 mark by beckxie
                "     t2.rtjf001,t2.rtjf002,'Y',t1.sum_rtjb031,t1.l_rate*t2.rtjf031, ",   #160604-00009#144 20160713 add by beckxie
                "     t1.rtjbseq,t2.rtjfseq,t1.l_rate,t2.rtjf031 ",   #160615-00046#6 20160617 add(rtjfseq) by beckxie
                "  FROM astp510_tmp_a t1,astp510_tmp_b t2 ",
                " WHERE t1.rtjbdocno=t2.rtjfdocno ",
                " ORDER BY t1.rtjbdocno ,t2.rtjf001,t2.rtjf002,t1.rtjbseq" #160604-00009#103 20160624 add by beckxie
               #"   AND t1.rtjbseq  =t2.rtjfseq "
    
                
    PREPARE astp510_pb2 FROM l_sql
    DECLARE astp510_pb2_cur CURSOR FOR astp510_pb2   
    INITIALIZE l_stgd_t.* TO NULL
    #160604-00009#103 20160624 add by beckxie---S
    LET l_stgd012_all = 0
    LET l_stgd012_tmp = 0
    LET l_stgd016_all = 0
    LET l_stgd016_tmp = 0
    LET l_stgd017_all = 0
    LET l_stgd017_tmp = 0
    LET l_stgd007_tmp = ''
    #LET l_stgd008_tmp = ''  #160604-00009#144 20160713 mark by beckxie
    LET l_stgd009_tmp = ''   #160604-00009#144 20160713 add by beckxie
    LET l_ooef016 = ''
    INITIALIZE l_stgd_tmp.* TO NULL
    SELECT ooef016 
      INTO l_ooef016
      FROM ooef_t 
     WHERE ooefent = g_enterprise 
       AND ooef001 = g_site
    #160604-00009#103 20160624 add by beckxie---E
    #FOREACH astp510_pb2_cur INTO l_stgd_t.*   #160613-00045#3 20160615 mark by beckxie
    #160613-00045#3 20160615 add by beckxie---S
    FOREACH astp510_pb2_cur INTO l_stgd_t.stgdent,l_stgd_t.stgdsite,l_stgd_t.stgdunit,l_stgd_t.stgd001,l_stgd_t.stgd002,
                                 l_stgd_t.stgd003,l_stgd_t.stgd004,l_stgd_t.stgd005,l_stgd_t.stgd006,l_stgd_t.stgd007,
                                 l_stgd_t.stgd008,l_stgd_t.stgd009,l_stgd_t.stgd010,l_stgd_t.stgd011,l_stgd_t.stgd012,
                                 l_stgd_t.stgdseq,l_rtjfseq,l_rate,l_stgd012_all  #160615-00046#6 20160617 add(rtjfseq,rate) by beckxie
    #160613-00045#3 20160615 add by beckxie---E
    
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "FOREACH astp510_pb2_cur:" 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               EXIT FOREACH
            END IF
            #160604-00009#144 20160713 add by beckxie---S
            LET l_cnt = 0
            WHILE TRUE
               SELECT COUNT(*) INTO l_cnt
                 FROM stgd_t
                WHERE stgdent = g_enterprise        # 企业编号
                  AND stgdsite= g_site              # 营运组织
                  AND stgd007 = l_stgd_t.stgd007    # 销售收银单号
                  AND stgdseq = l_stgd_t.stgdseq    # 销售单项次
                  AND stgd001 = l_stgd_t.stgd001    # 收款序
               IF l_cnt = 0 THEN 
                  EXIT WHILE
               ELSE
                  LET l_stgd_t.stgd001 = l_stgd_t.stgd001 +1  USING "&"
               END IF
            END WHILE
            
            LET l_stgd_t.stgd001 =l_stgd_t.stgd001  USING "&"
            #160604-00009#144 20160713 add by beckxie---E
            #160604-00009#103 20160624 add by beckxie---S
            #尾差處理:上筆是否為最後一筆,判斷是否重置
            #IF (cl_null(l_stgd008_tmp) OR l_stgd008_tmp != l_stgd_t.stgd008) #160604-00009#144 20160713 mark by beckxie
            IF (cl_null(l_stgd009_tmp) OR l_stgd009_tmp != l_stgd_t.stgd009)  #160604-00009#144 20160713 add by beckxie
                OR (cl_null(l_stgd007_tmp) OR l_stgd007_tmp != l_stgd_t.stgd007) THEN
               #若為最後一筆,將上一筆資料更新尾差
               LET l_count = 0 
               SELECT COUNT(*) INTO l_count 
                 FROM stgd_t                                     
                WHERE stgdent=g_enterprise        # 企业编号
                  AND stgdsite=g_site             # 营运组织
                  AND stgd001 =l_stgd_tmp.stgd001   # 收款序号
                  AND stgd007 =l_stgd_tmp.stgd007   # 销售收银单号
                  AND stgdseq =l_stgd_tmp.stgdseq   # 销售单项次
               IF NOT cl_null(l_stgd_tmp.stgdent) AND l_count =1 THEN
                  LET l_stgd_tmp.stgd012 = l_stgd_tmp.stgd012 + l_stgd012_tmp 
                  LET l_stgd_tmp.stgd016 = l_stgd_tmp.stgd016 + l_stgd016_tmp 
                  LET l_stgd_tmp.stgd017 = l_stgd_tmp.stgd017 + l_stgd017_tmp 
                  UPDATE stgd_t SET (stgd012,stgd016,stgd017) = (l_stgd_tmp.stgd012 ,l_stgd_tmp.stgd016 ,l_stgd_tmp.stgd017 )
                   WHERE stgdent =g_enterprise        # 企业编号
                     AND stgdsite=g_site             # 营运组织
                     AND stgd001 =l_stgd_tmp.stgd001   # 收款序号
                     AND stgd007 =l_stgd_tmp.stgd007   # 销售收银单号
                     AND stgdseq =l_stgd_tmp.stgdseq   # 销售单项次
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "UPDATE stgd_t:" 
                     LET g_errparam.code   = SQLCA.sqlcode 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                  END IF
               END IF
               LET l_stgd007_tmp = l_stgd_t.stgd007
               #LET l_stgd008_tmp = l_stgd_t.stgd008   #160604-00009#144 20160713 mark by beckxie
               LET l_stgd009_tmp = l_stgd_t.stgd009   #160604-00009#144 20160713 add by beckxie
               LET l_stgd012_tmp = l_stgd012_all
               LET l_stgd016_all = 0
               LET l_stgd016_tmp = 0
               LET l_stgd017_all = 0
               LET l_stgd017_tmp = 0
               INITIALIZE l_stgd_tmp.* TO NULL
            END IF
            #160604-00009#103 20160624 add by beckxie---E
            LET l_stgd_t.stgdent =g_enterprise
            LET l_stgd_t.stgdsite=g_site
            LET l_stgd_t.stgd002 =p_date
            #160613-00045#3 20160615 add by beckxie---S
            #經營方式按照site和商品抓rtdx003
            SELECT rtdx003 INTO l_stgd_t.stgd013 
              FROM rtdx_t
             WHERE rtdxent = g_enterprise
               AND rtdxsite = l_stgd_t.stgdsite
               AND rtdx001 = l_stgd_t.stgd003
            #合同編號按經營方式，= 4抓astm401 ,5 抓astm801
            IF l_stgd_t.stgd013 = '4' THEN
               SELECT stfa001 INTO l_stgd_t.stgd014
                 FROM stfa_t 
                WHERE stfaent = g_enterprise 
                  AND stfasite = l_stgd_t.stgdsite
                  AND stfa004 IN ('2','3','4','5','6')
                  AND stfa005 = l_stgd_t.stgd005
            END IF
            IF l_stgd_t.stgd013 = '5' THEN
               #160801-00036#1 20160802 mark by beckxie---S
               #SELECT stje001 INTO l_stgd_t.stgd014
               #  FROM stje_t 
               # WHERE stjeent = g_enterprise 
               #   AND stjesite = l_stgd_t.stgdsite
               #   AND stje005 IN ('2','3','4','5','6')
               #   AND stje008 = l_stgd_t.stgd005
               #160801-00036#1 20160802 mark by beckxie---E
               #160801-00036#1 20160802 add by beckxie---S
               SELECT rtja105 INTO l_stgd_t.stgd014
                 FROM rtja_t
                WHERE rtjaent = g_enterprise
                  AND rtjadocno = l_stgd_t.stgd007
               #160801-00036#1 20160802 add by beckxie---E
            END IF
            #商品品類按商品抓imaa009
            SELECT imaa009 INTO l_stgd_t.stgd015
              FROM imaa_t
             WHERE imaaent = g_enterprise
               AND imaa001 = l_stgd_t.stgd003
            
            #手續費金額抓rtjf007
            IF l_stgd016_all = 0 THEN
               SELECT SUM(rtjf007) INTO l_stgd016_all
                 FROM rtjf_t 
                WHERE rtjfent = g_enterprise 
                  AND rtjfdocno = l_stgd_t.stgd007
                  #160604-00009#103 20160624 mark by beckxie---S
                  #AND rtjfseq = l_rtjfseq
                  #AND rtjfseq1 = l_stgd_t.stgd001
                  #160604-00009#103 20160624 mark by beckxie---E
                  #160604-00009#103 20160624 add by beckxie---S
                  #AND rtjf001 = l_stgd_t.stgd009            #160604-00009#144 20160713 mark by beckxie
                  #AND rtjf002 = l_stgd_t.stgd008            #160604-00009#144 20160713 mark by beckxie
                  AND rtjf001 = l_stgd_t.stgd008             #160604-00009#144 20160713 add by beckxie
                  AND rtjf002 = l_stgd_t.stgd009             #160604-00009#144 20160713 add by beckxie
                  AND rtjf025 = TO_DATE(p_date,'yy/mm/dd')   #160604-00009#144 20160713 add by beckxie
                  GROUP BY rtjfent,rtjfdocno,rtjf001,rtjf002
                  #160604-00009#103 20160624 add by beckxie---E
                  LET l_stgd016_tmp = l_stgd016_all
            END IF
            LET l_stgd_t.stgd016 = l_stgd016_all * l_rate
            IF cl_null(l_stgd_t.stgd016) THEN
               LET l_stgd_t.stgd016 = 0
            END IF
            #160613-00045#3 20160615 add by beckxie---E
            #160615-00046#6 20160617 add by beckxie---S
            #IF l_stgd017_all = 0 AND l_stgd_t.stgd009 ='60' THEN   #160604-00009#144 20160713 mark by beckxie
            IF l_stgd017_all = 0 AND l_stgd_t.stgd008 ='60' THEN   #160604-00009#144 20160713 add by beckxie
               SELECT DISTINCT COALESCE(((SUM(mmau009)*(-1))-(SUM(mmau014)*-1)),0) INTO l_stgd017_all
                 FROM rtja_t, rtjf_t ,mmau_t      
                WHERE rtjaent = rtjfent AND rtjadocno = rtjfdocno 
                  AND rtjaent = mmauent AND rtjasite = mmau018 AND rtja033 = mmau005 
                  AND rtjaent = g_enterprise 
                  #AND rtjf001 = l_stgd_t.stgd009   #160604-00009#144 20160713 mark by beckxie
                  AND rtjf001 = l_stgd_t.stgd008   #160604-00009#144 20160713 add by beckxie
                  #160604-00009#103 20160623 add by beckxie---S
                  #抓储值异动档时，需要判断款别存在于卡种的储值对应的款别mman058 ，
                  #才汇总储值异动档的储值成本，其他的款别不处理
                  AND rtjf002 IN (SELECT mman058 FROM mman_t 
                                   WHERE mmanent = rtjaent 
                                     AND mman001 = (SELECT mmaq002 FROM mmaq_t 
                                                     WHERE mmaqent = mmanent 
                                                       AND mmaq001 = mmau001 ))
                  #160604-00009#103 20160623 add by beckxie---E
                  AND rtjadocno = l_stgd_t.stgd007
                  AND rtjfseq = l_rtjfseq
                  #160604-00009#144 modify by beckxie---S
                  #AND rtjfseq1 = l_stgd_t.stgd001
                  AND rtjf025 = TO_DATE(p_date,'yy/mm/dd')
                  AND TO_CHAR(mmau006 ,'yy/mm/dd') =TO_CHAR(TO_DATE(p_date,'yy/mm/dd'),'yy/mm/dd')
                  GROUP BY rtjfseq1
                  #160604-00009#144 modify by beckxie---E
               CALL s_curr_round(l_stgd_t.stgdsite,l_ooef016,l_stgd017_all,'2') RETURNING l_stgd017_all
               LET l_stgd017_tmp = l_stgd017_all
            END IF
            #IF l_stgd_t.stgd009 ='60' THEN   #160604-00009#144 20160713 mark by beckxie
            IF l_stgd_t.stgd008 ='60' THEN   #160604-00009#144 20160713 add by beckxie
               LET l_stgd_t.stgd017 = l_stgd017_all * l_rate
            END IF
            IF cl_null(l_stgd_t.stgd017) THEN
               LET l_stgd_t.stgd017 = 0
            END IF
            #160615-00046#6 20160617 add by beckxie---E
            #160604-00009#144 20160713 mark by beckxie---S
            #SELECT DISTINCT mhae006 INTO l_stgd_t.stgd006  # 供应商编号
            #  FROM mhae_t
            # WHERE mhaeent=g_enterprise
            #   AND mhaesite=g_site
            #   AND mhae001 =l_stgd_t.stgd005
            #160604-00009#144 20160713 mark by beckxie---E
            #160604-00009#144 20160713 add by beckxie---S
            IF l_stgd_t.stgd013 = '5' THEN 
               #stgd006:租賃给rtja102
               SELECT rtja102 INTO l_stgd_t.stgd006  # 商戶編號
                 FROM rtja_t 
                WHERE rtjaent = g_enterprise
                  AND rtjadocno = l_stgd_t.stgd007
            ELSE
               SELECT DISTINCT mhae006 INTO l_stgd_t.stgd006  # 供应商编号
                 FROM mhae_t
                WHERE mhaeent=g_enterprise
                  AND mhaesite=g_site
                  AND mhae001 =l_stgd_t.stgd005
            END IF
            #160604-00009#144 20160713 add by beckxie---E
            #160604-00009#103 20160624 add by beckxie---S
            #系統取位
            CALL s_curr_round(l_stgd_t.stgdsite,l_ooef016,l_stgd_t.stgd012,'2') RETURNING l_stgd_t.stgd012
            CALL s_curr_round(l_stgd_t.stgdsite,l_ooef016,l_stgd_t.stgd016,'2') RETURNING l_stgd_t.stgd016
            CALL s_curr_round(l_stgd_t.stgdsite,l_ooef016,l_stgd_t.stgd017,'2') RETURNING l_stgd_t.stgd017
            #尾差
            LET l_stgd012_tmp = l_stgd012_tmp - l_stgd_t.stgd012
            LET l_stgd016_tmp = l_stgd016_tmp - l_stgd_t.stgd016
            LET l_stgd017_tmp = l_stgd017_tmp - l_stgd_t.stgd017
            #160604-00009#103 20160624 add by beckxie---E
            LET l_count=0
            SELECT COUNT(*) INTO l_count FROM stgd_t                                     
             WHERE stgdent=g_enterprise        # 企业编号
               AND stgdsite=g_site             # 营运组织
               AND stgd001 =l_stgd_t.stgd001   # 收款序号
               AND stgd007 =l_stgd_t.stgd007   # 销售收银单号
               AND stgdseq =l_stgd_t.stgdseq   # 销售单项次
            IF l_count=0 THEN  

#             ---#ADDED BY LanJJ 2015-10-27 ----S---
#                #按当前币别截取aooi150里的用户设置小数位 处理金额字段-
#                SELECT ooef016 
#                  INTO l_ooef016
#                  FROM ooef_t 
#                 WHERE ooefent = g_enterprise 
#                   AND ooef001 = l_stgd_t.stgdsite
#                   
#                CALL s_curr_round(l_stgd_t.stgdsite,l_ooef016,l_stgd_t.stgd011,'2') RETURNING l_stgd_t.stgd011
#                CALL s_curr_round(l_stgd_t.stgdsite,l_ooef016,l_stgd_t.stgd012,'2') RETURNING l_stgd_t.stgd012
#             ---#ADDED BY LanJJ 2015-10-27 ----E---

               #INSERT INTO stgd_t VALUES (l_stgd_t.*)   #160604-00009#103 20160627 mark by beckxie
               #160604-00009#103 20160627 add by beckxie---S
               LET l_stgd_tmp.* = l_stgd_t.* 
               INSERT INTO stgd_t (stgdent,stgdsite,stgdunit,stgd001,stgd002,
                                   stgd003,stgd004,stgd005,stgd006,stgd007,
                                   stgd008,stgd009,stgd010,stgd011,stgd012,
                                   stgdseq,stgd013,stgd014,stgd015,stgd016,
                                   stgd017)
                           VALUES (l_stgd_t.stgdent,l_stgd_t.stgdsite,l_stgd_t.stgdunit,l_stgd_t.stgd001,l_stgd_t.stgd002,
                                   l_stgd_t.stgd003,l_stgd_t.stgd004,l_stgd_t.stgd005,l_stgd_t.stgd006,l_stgd_t.stgd007,
                                   l_stgd_t.stgd008,l_stgd_t.stgd009,l_stgd_t.stgd010,l_stgd_t.stgd011,l_stgd_t.stgd012,
                                   l_stgd_t.stgdseq,l_stgd_t.stgd013,l_stgd_t.stgd014,l_stgd_t.stgd015,l_stgd_t.stgd016,
                                   l_stgd_t.stgd017)   
               #160604-00009#103 20160627 add by beckxie---E
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "INTO stgd_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success=FALSE
                  RETURN l_success,1
               END IF
               LET l_i=l_i+1
            END IF
            INITIALIZE l_stgd_t.* TO NULL
    END FOREACH
    # INSERT (E)
    #160604-00009#103 20160627 add by beckxie---S
    #最後一筆
    LET l_count = 0 
    SELECT COUNT(*) INTO l_count 
      FROM stgd_t                                     
     WHERE stgdent=g_enterprise        # 企业编号
       AND stgdsite=g_site             # 营运组织
       AND stgd001 =l_stgd_tmp.stgd001   # 收款序号
       AND stgd007 =l_stgd_tmp.stgd007   # 销售收银单号
       AND stgdseq =l_stgd_tmp.stgdseq   # 销售单项次
    IF NOT cl_null(l_stgd_tmp.stgdent) AND l_count =1 THEN
    
       LET l_stgd_tmp.stgd012 = l_stgd_tmp.stgd012 + l_stgd012_tmp 
       LET l_stgd_tmp.stgd016 = l_stgd_tmp.stgd016 + l_stgd016_tmp 
       LET l_stgd_tmp.stgd017 = l_stgd_tmp.stgd017 + l_stgd017_tmp 
       
       IF cl_null(l_stgd_tmp.stgd012) THEN LET l_stgd_tmp.stgd012 = 0 END IF
       IF cl_null(l_stgd_tmp.stgd016) THEN LET l_stgd_tmp.stgd016 = 0 END IF
       IF cl_null(l_stgd_tmp.stgd017) THEN LET l_stgd_tmp.stgd017 = 0 END IF
       
       UPDATE stgd_t SET (stgd012,stgd016,stgd017) = (l_stgd_tmp.stgd012 ,l_stgd_tmp.stgd016 ,l_stgd_tmp.stgd017 )
        WHERE stgdent =g_enterprise        # 企业编号
          AND stgdsite=g_site             # 营运组织
          AND stgd001 =l_stgd_tmp.stgd001   # 收款序号
          AND stgd007 =l_stgd_tmp.stgd007   # 销售收银单号
          AND stgdseq =l_stgd_tmp.stgdseq   # 销售单项次
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL 
          LET g_errparam.extend = "UPDATE stgd_t:" 
          LET g_errparam.code   = SQLCA.sqlcode 
          LET g_errparam.popup  = TRUE 
          CALL cl_err()
       END IF
    END IF
    #160604-00009#103 20160627 add by beckxie---E
    
    RETURN l_success,l_i
    
    
END FUNCTION

################################################################################
# Descriptions...: 创建临时表
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
PRIVATE FUNCTION astp510_create_tmp()
   DEFINE r_success    LIKE type_t.num5
   LET r_success = TRUE
   # a
   DROP TABLE astp510_tmp_a
   CREATE TEMP TABLE astp510_tmp_a(
             rtjbdocno   LIKE type_t.chr20,      # 销售收银单号
             rtjbseq     LIKE type_t.num10,      # 销售单项次
             rtjb004     LIKE type_t.chr100,     # 商品编号
             rtjb025     LIKE type_t.chr10,      # 库区编号
             rtjb028     LIKE type_t.chr20,      # 专柜编号
             rtjb031     LIKE type_t.num20_6,    # 明细销售金额
             sum_rtjb031 LIKE type_t.num20_6,    # 本小票总销售金额
             l_rate      LIKE type_t.num20_6)    # 比率
    
   IF SQLCA.sqlcode THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'Create Temp Table astp100_tmp_a'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   CREATE INDEX astp510_tmp_a_01 ON astp510_tmp_a(rtjbdocno,rtjbseq)
   
   # b
   DROP TABLE astp510_tmp_b
   CREATE TEMP TABLE astp510_tmp_b(
             rtjfdocno   LIKE type_t.chr20,   # 销售收银单号
             rtjfseq     LIKE type_t.num10,   # 销售单项次
             rtjfseq1    LIKE type_t.num10,   # 收款序号
             rtjf002     LIKE type_t.chr10,   # 款别编号
             rtjf001     LIKE type_t.chr10,   # 款别类型
             rtjf031     LIKE type_t.num20_6) # 本币收款金额
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'Create Temp Table astp100_tmp_b'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   CREATE INDEX astp510_tmp_b_01 ON astp510_tmp_b(rtjfdocno,rtjfseq)
   
   # c
   DROP TABLE astp510_tmp_c
   CREATE TEMP TABLE astp510_tmp_c(
             rtjbdocno   LIKE type_t.chr20,      # 销售收银单号
             rtjbseq     LIKE type_t.num10,      # 销售单项次
             rtjb004     LIKE type_t.chr100,     # 商品编号
             rtjb025     LIKE type_t.chr10,      # 库区编号
             rtjb028     LIKE type_t.chr20,      # 专柜编号
             l_rate      LIKE type_t.num20_6)    # 比率
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'Create Temp Table astp100_tmp_c'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   CREATE INDEX astp510_tmp_c_01 ON astp510_tmp_c(rtjbdocno,rtjbseq)
   
   RETURN r_success

END FUNCTION

#end add-point
 
{</section>}
 
