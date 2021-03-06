#該程式未解開Section, 採用最新樣板產出!
{<section id="astq530.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0005(2016-09-14 13:49:15), PR版次:0005(2016-09-14 13:30:38)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000059
#+ Filename...: astq530
#+ Description: 專櫃結算底稿查詢作業
#+ Creator....: 06189(2015-05-18 21:26:14)
#+ Modifier...: 08742 -SD/PR- 08742
 
{</section>}
 
{<section id="astq530.global" >}
#應用 i02 樣板自動產生(Version:38)
#add-point:填寫註解說明 name="global.memo"
#Memos
#160905-00007#16   2016/09/05  By 02599  SQL条件增加ent,问题在4957行，下载程序架构自动产生ENT
#160913-00034#3  2016/09/14    by 08742    q_pmaa001開窗改成 q_pmaa001_1抓類型=3 的條件
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS   #(ver:36) add
   DEFINE mc_data_owner_check LIKE type_t.num5   #(ver:36) add
END GLOBALS   #(ver:36) add
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單身 type 宣告
PRIVATE TYPE type_g_stbc_d RECORD
       stbc001 LIKE stbc_t.stbc001, 
   stbc001_desc LIKE type_t.chr500, 
   stbc002 LIKE stbc_t.stbc002, 
   stbc003 LIKE stbc_t.stbc003, 
   stbc004 LIKE stbc_t.stbc004, 
   stbc005 LIKE stbc_t.stbc005, 
   stbc040 LIKE stbc_t.stbc040, 
   stbc006 LIKE stbc_t.stbc006, 
   stbc007 LIKE stbc_t.stbc007, 
   stbc028 LIKE stbc_t.stbc028, 
   stbc045 LIKE stbc_t.stbc045, 
   stbc046 LIKE stbc_t.stbc046, 
   stbcsite LIKE stbc_t.stbcsite, 
   stbcsite_desc LIKE type_t.chr500, 
   stbc026 LIKE stbc_t.stbc026, 
   stbc025 LIKE stbc_t.stbc025, 
   stbc027 LIKE stbc_t.stbc027, 
   stbc008 LIKE stbc_t.stbc008, 
   stbc008_desc LIKE type_t.chr500, 
   stbc033 LIKE stbc_t.stbc033, 
   stbc033_desc LIKE type_t.chr500, 
   stbc058 LIKE stbc_t.stbc058, 
   stbc029 LIKE stbc_t.stbc029, 
   stbc029_desc LIKE type_t.chr500, 
   stbc030 LIKE stbc_t.stbc030, 
   stbc009 LIKE stbc_t.stbc009, 
   stbc010 LIKE stbc_t.stbc010, 
   stbc010_desc LIKE type_t.chr500, 
   stbc011 LIKE stbc_t.stbc011, 
   stbc011_desc LIKE type_t.chr500, 
   stbc012 LIKE stbc_t.stbc012, 
   stbc012_desc LIKE type_t.chr500, 
   stbc037 LIKE stbc_t.stbc037, 
   stbc038 LIKE stbc_t.stbc038, 
   stbc041 LIKE stbc_t.stbc041, 
   jsdocno LIKE type_t.chr20, 
   stbc013 LIKE stbc_t.stbc013, 
   stbc013_desc LIKE type_t.chr500, 
   stbc014 LIKE stbc_t.stbc014, 
   stbc014_desc LIKE type_t.chr500, 
   stbc015 LIKE stbc_t.stbc015, 
   stbc016 LIKE stbc_t.stbc016, 
   stbc017 LIKE stbc_t.stbc017, 
   stbc018 LIKE stbc_t.stbc018, 
   stbc019 LIKE stbc_t.stbc019, 
   stbc020 LIKE stbc_t.stbc020, 
   stbc021 LIKE stbc_t.stbc021, 
   stbc022 LIKE stbc_t.stbc022, 
   stbc023 LIKE stbc_t.stbc023, 
   stbc024 LIKE stbc_t.stbc024, 
   stbc034 LIKE stbc_t.stbc034, 
   stbc057 LIKE stbc_t.stbc057, 
   stbc035 LIKE stbc_t.stbc035, 
   stbc036 LIKE stbc_t.stbc036, 
   stbc039 LIKE stbc_t.stbc039, 
   stbc042 LIKE stbc_t.stbc042, 
   stbcstus LIKE stbc_t.stbcstus
       END RECORD
 
 
 
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_stbc037    STRING
DEFINE p_stbc037    LIKE  type_t.num5
DEFINE  l_cnt       LIKE  type_t.num10  
DEFINE  l_stbc041      LIKE  type_t.num10  

#ADDED BY LANJJ 2015-10-14---S---
   DEFINE head RECORD 
      stbcsite STRING, 
      stbc001  STRING, 
      stbcstus STRING, 
      stbc003 STRING, 
      stbc004 STRING, 
      stbc040 STRING, 
      stbc006 STRING, 
      stbc007 STRING, 
      stbc026 STRING, 
      stbc025 STRING, 
      stbc027 STRING, 
      stbc008 STRING, 
      stbc033 STRING, 
      stbc028 STRING, 
      stbc058 STRING, 
      stbc030 STRING, 
      stbc009 STRING, 
      stbc010 STRING, 
      stbc011 STRING, 
      stbc012 STRING, 
      stbc037 STRING, 
      stbc038 STRING, 
      stbc041 STRING, 
      stbc013 STRING, 
      stbc014 STRING, 
      stbc016 STRING
       END RECORD
   DEFINE l_bdate LIKE type_t.dat
   DEFINE l_edate LIKE type_t.dat 
#ADDED BY LANJJ 2015-10-14---E---
#end add-point
 
#模組變數(Module Variables)
DEFINE g_stbc_d          DYNAMIC ARRAY OF type_g_stbc_d #單身變數
DEFINE g_stbc_d_t        type_g_stbc_d                  #單身備份
DEFINE g_stbc_d_o        type_g_stbc_d                  #單身備份
DEFINE g_stbc_d_mask_o   DYNAMIC ARRAY OF type_g_stbc_d #單身變數
DEFINE g_stbc_d_mask_n   DYNAMIC ARRAY OF type_g_stbc_d #單身變數
 
      
DEFINE g_wc2                STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10    
DEFINE l_ac                 LIKE type_t.num10             #目前處理的ARRAY CNT 
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_temp_idx           LIKE type_t.num10             #單身 所在筆數(暫存用)
DEFINE g_detail_idx         LIKE type_t.num10             #單身 所在筆數(所有資料)
DEFINE g_detail_cnt         LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5
DEFINE g_chk                BOOLEAN
DEFINE g_aw                 STRING                        #確定當下點擊的單身
DEFINE g_log1               STRING                        #log用
DEFINE g_log2               STRING                        #log用
 
#多table用wc
DEFINE g_wc_table           STRING
 
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"
 
#end add-point
 
{</section>}
 
{<section id="astq530.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5      #150308-00001#5  By benson 150309
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:作業初始化 name="main.init"
   LET g_argv[1] = cl_replace_str(g_argv[1], '\"', '')
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
 
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = "SELECT stbc001,stbc002,stbc003,stbc004,stbc005,stbc040,stbc006,stbc007,stbc028, 
       stbc045,stbc046,stbcsite,stbc026,stbc025,stbc027,stbc008,stbc033,stbc058,stbc029,stbc030,stbc009, 
       stbc010,stbc011,stbc012,stbc037,stbc038,stbc041,stbc013,stbc014,stbc015,stbc016,stbc017,stbc018, 
       stbc019,stbc020,stbc021,stbc022,stbc023,stbc024,stbc034,stbc057,stbc035,stbc036,stbc039,stbc042, 
       stbcstus FROM stbc_t WHERE stbcent=? AND stbc001=? AND stbc004=? AND stbc005=? FOR UPDATE"
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq530_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq530 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq530_init()   
 
      #進入選單 Menu (="N")
      CALL astq530_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      CALL astq530_ui_dialog2()
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq530
      
   END IF 
   
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq530.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION astq530_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5      #150308-00001#5  By benson 150309
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
      CALL cl_set_combo_scc_part('stbcstus','50','N,Y,X')
 
      CALL cl_set_combo_scc('stbc003','6703') 
   CALL cl_set_combo_scc('stbc009','6725') 
 
   LET g_error_show = 1
   
   #add-point:畫面資料初始化 name="init.init"
   #CALL cl_set_combo_scc_part('stbc003','6703','1,2,3,4,5,8,9,10')
   CALL cl_set_combo_scc_part('stbc003','6703','3,4,5')     #pengxin add---20150316只显示3,4,5  add by pengxin 20160316
   CALL cl_set_combo_scc('stbc015','6006')
   CALL cl_set_combo_scc('stbcstus','6704')
   CALL cl_set_combo_scc('stbc027','6726')
   CALL cl_set_combo_scc_part('stbc009','6013','4')
   CALL cl_set_comp_visible("stbc029,stbc029_desc",FALSE)
   CALL cl_set_combo_scc('stbc041','6800') 
   #add by liaolong  150629-00016 15/07/28 --Begin--
   CALL cl_get_para(g_enterprise,g_site,'S-CIR-2007') RETURNING l_stbc041  
   IF l_stbc041 = '1' THEN
      CALL cl_set_comp_visible("stbc041",FALSE)
   ELSE 
      CALL cl_set_comp_visible("stbc041",TRUE)
   END IF
   #add by liaolong  150629-00016 15/07/28 --End--   
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   
   #ADDED BY LANJJ 2015-10-14 ---S---
      INITIALIZE head.* TO NULL
      #CALL cl_set_combo_scc_part('h_stbc003','6703','1,2,3,4,5,8,9,10')
      CALL cl_set_combo_scc_part('h_stbc003','6703','3,4,5')     #pengxin add---20150316只显示3,4,5  add by pengxin 20160316
      CALL cl_set_combo_scc('h_stbcstus','6704')
      CALL cl_set_combo_scc('h_stbc027','6726')
      CALL cl_set_combo_scc_part('h_stbc009','6013','4')
      CALL cl_set_combo_scc('h_stbc041','6800')
      LET l_bdate = g_today
      LET l_edate = g_today
      DISPLAY BY NAME l_bdate,l_edate      
   #ADDED BY LANJJ 2015-10-14 ---E---
   #end add-point
   
   CALL astq530_default_search()
   
END FUNCTION
 
{</section>}
 
{<section id="astq530.ui_dialog" >}
#+ 功能選單 
PRIVATE FUNCTION astq530_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_idx   LIKE type_t.num10
   DEFINE la_param  RECORD #串查用
             prog   STRING,
             param  DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING
   DEFINE l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_arg             STRING                 #報表作業cmdrun使用
   #add-point:ui_dialog段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"

   #ADDED BY LANJJ 2015-10-13
   RETURN
   #ADDED BY LANJJ 2015-10-13

   #end add-point 
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   LET g_action_choice = " "  
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()      
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   
   LET g_detail_idx = 1
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
   
   WHILE TRUE
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stbc_d.clear()
 
         LET g_wc2 = ' 1=2'
         LET g_action_choice = ""
         CALL astq530_init()
      END IF
   
      CALL astq530_b_fill(g_wc2)
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_stbc_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               #add-point:ui_dialog段before display  name="ui_dialog.body.before_display"
               
               #end add-point
               #讓各頁籤能夠同步指到特定資料
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               #add-point:ui_dialog段before display2 name="ui_dialog.body.before_display2"
               
               #end add-point
               
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               LET g_temp_idx = l_ac
               DISPLAY g_detail_idx TO FORMONLY.idx
               CALL cl_show_fld_cont() 
               #顯示followup圖示
               #應用 a48 樣板自動產生(Version:3)
   CALL astq530_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
               #add-point:display array-before row name="ui_dialog.before_row"
               
               #end add-point
         
            #自訂ACTION(detail_show,page_1)
            
               
         END DISPLAY
      
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
    
         BEFORE DIALOG
            IF g_temp_idx > 0 THEN
               LET l_ac = g_temp_idx
               CALL DIALOG.setCurrentRow("s_detail1",l_ac)
               LET g_temp_idx = 1
            END IF
            LET g_curr_diag = ui.DIALOG.getCurrent()         
            CALL DIALOG.setSelectionMode("s_detail1", 1)
 
            #add-point:ui_dialog段before name="ui_dialog.b_dialog"
            
            #end add-point
            NEXT FIELD CURRENT
      
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION change
            LET g_action_choice="change"
            IF cl_auth_chk_act("change") THEN
               
               #add-point:ON ACTION change name="menu.change"
               LET g_aw = g_curr_diag.getCurrentItem()               
               LET l_cnt = g_stbc_d.getLength()
               IF l_cnt > 0 THEN                   
                  CALL astq530_modify()
               ELSE   
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00368'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_action_choice= ""
                  EXIT DIALOG
               END IF
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION set_out2
            LET g_action_choice="set_out2"
            IF cl_auth_chk_act("set_out2") THEN
               
               #add-point:ON ACTION set_out2 name="menu.set_out2"
                #add by liaolong     150629-00016 15/08/06 --Begin--
               LET p_stbc037='0'
               FOR l_cnt = 1 TO g_stbc_d.getLength()
                  IF DIALOG.isRowSelected("s_detail1", l_cnt) THEN
                     IF l_cnt > 0 THEN                   
                        CALL astq530_stbc037_modify(p_stbc037)
                     ELSE   
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00368'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET g_action_choice= ""
                        EXIT DIALOG
                     END IF
                  END IF
               END FOR
               #add by liaolong     150629-00016 15/08/06 --End--
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astq530_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION datainfo
            LET g_action_choice="datainfo"
            IF cl_auth_chk_act("datainfo") THEN
               
               #add-point:ON ACTION datainfo name="menu.datainfo"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION set_in2
            LET g_action_choice="set_in2"
            IF cl_auth_chk_act("set_in2") THEN
               
               #add-point:ON ACTION set_in2 name="menu.set_in2"
               #add by liaolong     150629-00016 15/08/06 --Begin--
               LET p_stbc037='1'
               FOR l_cnt = 1 TO g_stbc_d.getLength()
                  IF DIALOG.isRowSelected("s_detail1", l_cnt) THEN
                     IF l_cnt > 0 THEN                   
                        CALL astq530_stbc037_modify(p_stbc037)
                     ELSE   
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00368'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET g_action_choice= ""
                        EXIT DIALOG
                     END IF
                  END IF
               END FOR
               #add by liaolong     150629-00016 15/08/06 --End--

               #END add-point
               
            END IF
 
 
 
 
      
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               LET g_export_node[1] = base.typeInfo.create(g_stbc_d)
               LET g_export_id[1]   = "s_detail1"
 
               #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
               
               #END add-point
               CALL cl_export_to_excel_getpage()
               CALL cl_export_to_excel()
            END IF
            
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice="exit"
            CANCEL DIALOG
      
         ON ACTION exit
            LET g_action_choice="exit"
            CANCEL DIALOG
            
         
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astq530_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astq530_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astq530_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow('')
 
 
 
         
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
      
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
      
   END WHILE
 
   CALL cl_set_act_visible("accept,cancel", TRUE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq530.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION astq530_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point
   DEFINE ls_wc      LIKE type_t.chr500
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   #add-point:query段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_stbc_d.clear()
   
   LET g_qryparam.state = "c"
   
   #wc備份
   LET ls_wc = g_wc2
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      CONSTRUCT g_wc2 ON stbc001,stbc002,stbc003,stbc004,stbc005,stbc040,stbc006,stbc007,stbc028,stbc045, 
          stbc046,stbcsite,stbc026,stbc025,stbc027,stbc008,stbc033,stbc058,stbc029,stbc030,stbc009,stbc010, 
          stbc011,stbc012,stbc037,stbc038,stbc041,stbc013,stbc014,stbc014_desc,stbc015,stbc016,stbc017, 
          stbc018,stbc019,stbc020,stbc021,stbc022,stbc023,stbc024,stbc034,stbc057,stbc035,stbc036,stbc039, 
          stbc042,stbcstus 
 
         FROM s_detail1[1].stbc001,s_detail1[1].stbc002,s_detail1[1].stbc003,s_detail1[1].stbc004,s_detail1[1].stbc005, 
             s_detail1[1].stbc040,s_detail1[1].stbc006,s_detail1[1].stbc007,s_detail1[1].stbc028,s_detail1[1].stbc045, 
             s_detail1[1].stbc046,s_detail1[1].stbcsite,s_detail1[1].stbc026,s_detail1[1].stbc025,s_detail1[1].stbc027, 
             s_detail1[1].stbc008,s_detail1[1].stbc033,s_detail1[1].stbc058,s_detail1[1].stbc029,s_detail1[1].stbc030, 
             s_detail1[1].stbc009,s_detail1[1].stbc010,s_detail1[1].stbc011,s_detail1[1].stbc012,s_detail1[1].stbc037, 
             s_detail1[1].stbc038,s_detail1[1].stbc041,s_detail1[1].stbc013,s_detail1[1].stbc014,s_detail1[1].stbc014_desc, 
             s_detail1[1].stbc015,s_detail1[1].stbc016,s_detail1[1].stbc017,s_detail1[1].stbc018,s_detail1[1].stbc019, 
             s_detail1[1].stbc020,s_detail1[1].stbc021,s_detail1[1].stbc022,s_detail1[1].stbc023,s_detail1[1].stbc024, 
             s_detail1[1].stbc034,s_detail1[1].stbc057,s_detail1[1].stbc035,s_detail1[1].stbc036,s_detail1[1].stbc039, 
             s_detail1[1].stbc042,s_detail1[1].stbcstus 
      
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stbccrtdt>>----
 
         #----<<stbcmoddt>>----
         
         #----<<stbccnfdt>>----
         
         #----<<stbcpstdt>>----
 
 
 
      
                  #Ctrlp:construct.c.page1.stbc001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc001
            #add-point:ON ACTION controlp INFIELD stbc001 name="construct.c.page1.stbc001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_23()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stbc001') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbc001',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_23()  
            END IF
            DISPLAY g_qryparam.return1 TO stbc001  #顯示到畫面上
            NEXT FIELD stbc001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc001
            #add-point:BEFORE FIELD stbc001 name="query.b.page1.stbc001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc001
            
            #add-point:AFTER FIELD stbc001 name="query.a.page1.stbc001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc002
            #add-point:BEFORE FIELD stbc002 name="query.b.page1.stbc002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc002
            
            #add-point:AFTER FIELD stbc002 name="query.a.page1.stbc002"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc002
            #add-point:ON ACTION controlp INFIELD stbc002 name="query.c.page1.stbc002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc003
            #add-point:BEFORE FIELD stbc003 name="query.b.page1.stbc003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc003
            
            #add-point:AFTER FIELD stbc003 name="query.a.page1.stbc003"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc003
            #add-point:ON ACTION controlp INFIELD stbc003 name="query.c.page1.stbc003"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbc004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc004
            #add-point:ON ACTION controlp INFIELD stbc004 name="construct.c.page1.stbc004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stbc003()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbc004  #顯示到畫面上
            NEXT FIELD stbc004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc004
            #add-point:BEFORE FIELD stbc004 name="query.b.page1.stbc004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc004
            
            #add-point:AFTER FIELD stbc004 name="query.a.page1.stbc004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc005
            #add-point:BEFORE FIELD stbc005 name="query.b.page1.stbc005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc005
            
            #add-point:AFTER FIELD stbc005 name="query.a.page1.stbc005"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc005
            #add-point:ON ACTION controlp INFIELD stbc005 name="query.c.page1.stbc005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc040
            #add-point:BEFORE FIELD stbc040 name="query.b.page1.stbc040"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc040
            
            #add-point:AFTER FIELD stbc040 name="query.a.page1.stbc040"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc040
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc040
            #add-point:ON ACTION controlp INFIELD stbc040 name="query.c.page1.stbc040"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc006
            #add-point:BEFORE FIELD stbc006 name="query.b.page1.stbc006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc006
            
            #add-point:AFTER FIELD stbc006 name="query.a.page1.stbc006"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc006
            #add-point:ON ACTION controlp INFIELD stbc006 name="query.c.page1.stbc006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc007
            #add-point:BEFORE FIELD stbc007 name="query.b.page1.stbc007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc007
            
            #add-point:AFTER FIELD stbc007 name="query.a.page1.stbc007"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc007
            #add-point:ON ACTION controlp INFIELD stbc007 name="query.c.page1.stbc007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc028
            #add-point:BEFORE FIELD stbc028 name="query.b.page1.stbc028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc028
            
            #add-point:AFTER FIELD stbc028 name="query.a.page1.stbc028"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc028
            #add-point:ON ACTION controlp INFIELD stbc028 name="query.c.page1.stbc028"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc045
            #add-point:BEFORE FIELD stbc045 name="query.b.page1.stbc045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc045
            
            #add-point:AFTER FIELD stbc045 name="query.a.page1.stbc045"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc045
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc045
            #add-point:ON ACTION controlp INFIELD stbc045 name="query.c.page1.stbc045"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc046
            #add-point:BEFORE FIELD stbc046 name="query.b.page1.stbc046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc046
            
            #add-point:AFTER FIELD stbc046 name="query.a.page1.stbc046"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc046
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc046
            #add-point:ON ACTION controlp INFIELD stbc046 name="query.c.page1.stbc046"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbcsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbcsite
            #add-point:ON ACTION controlp INFIELD stbcsite name="construct.c.page1.stbcsite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_14()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbcsite',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24() 
            DISPLAY g_qryparam.return1 TO stbcsite  #顯示到畫面上
            NEXT FIELD stbcsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbcsite
            #add-point:BEFORE FIELD stbcsite name="query.b.page1.stbcsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbcsite
            
            #add-point:AFTER FIELD stbcsite name="query.a.page1.stbcsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc026
            #add-point:BEFORE FIELD stbc026 name="query.b.page1.stbc026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc026
            
            #add-point:AFTER FIELD stbc026 name="query.a.page1.stbc026"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc026
            #add-point:ON ACTION controlp INFIELD stbc026 name="query.c.page1.stbc026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc025
            #add-point:BEFORE FIELD stbc025 name="query.b.page1.stbc025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc025
            
            #add-point:AFTER FIELD stbc025 name="query.a.page1.stbc025"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc025
            #add-point:ON ACTION controlp INFIELD stbc025 name="query.c.page1.stbc025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc027
            #add-point:BEFORE FIELD stbc027 name="query.b.page1.stbc027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc027
            
            #add-point:AFTER FIELD stbc027 name="query.a.page1.stbc027"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc027
            #add-point:ON ACTION controlp INFIELD stbc027 name="query.c.page1.stbc027"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbc008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc008
            #add-point:ON ACTION controlp INFIELD stbc008 name="construct.c.page1.stbc008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #160913-00034#3 -S
            #CALL q_pmaa001()                                       
            LET g_qryparam.arg1 = "('3')"            
            CALL q_pmaa001_1()                           #呼叫開窗
            #160913-00034#3 -E
            DISPLAY g_qryparam.return1 TO stbc008  #顯示到畫面上
            NEXT FIELD stbc008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc008
            #add-point:BEFORE FIELD stbc008 name="query.b.page1.stbc008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc008
            
            #add-point:AFTER FIELD stbc008 name="query.a.page1.stbc008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbc033
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc033
            #add-point:ON ACTION controlp INFIELD stbc033 name="construct.c.page1.stbc033"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbc033  #顯示到畫面上
            NEXT FIELD stbc033                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc033
            #add-point:BEFORE FIELD stbc033 name="query.b.page1.stbc033"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc033
            
            #add-point:AFTER FIELD stbc033 name="query.a.page1.stbc033"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc058
            #add-point:BEFORE FIELD stbc058 name="query.b.page1.stbc058"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc058
            
            #add-point:AFTER FIELD stbc058 name="query.a.page1.stbc058"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc058
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc058
            #add-point:ON ACTION controlp INFIELD stbc058 name="query.c.page1.stbc058"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbc029
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc029
            #add-point:ON ACTION controlp INFIELD stbc029 name="construct.c.page1.stbc029"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbc029  #顯示到畫面上
            NEXT FIELD stbc029                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc029
            #add-point:BEFORE FIELD stbc029 name="query.b.page1.stbc029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc029
            
            #add-point:AFTER FIELD stbc029 name="query.a.page1.stbc029"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbc030
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc030
            #add-point:ON ACTION controlp INFIELD stbc030 name="construct.c.page1.stbc030"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stce001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbc030  #顯示到畫面上
            NEXT FIELD stbc030                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc030
            #add-point:BEFORE FIELD stbc030 name="query.b.page1.stbc030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc030
            
            #add-point:AFTER FIELD stbc030 name="query.a.page1.stbc030"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc009
            #add-point:BEFORE FIELD stbc009 name="query.b.page1.stbc009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc009
            
            #add-point:AFTER FIELD stbc009 name="query.a.page1.stbc009"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc009
            #add-point:ON ACTION controlp INFIELD stbc009 name="query.c.page1.stbc009"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbc010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc010
            #add-point:ON ACTION controlp INFIELD stbc010 name="construct.c.page1.stbc010"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbc010  #顯示到畫面上
            NEXT FIELD stbc010                     #返回原欄位            


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc010
            #add-point:BEFORE FIELD stbc010 name="query.b.page1.stbc010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc010
            
            #add-point:AFTER FIELD stbc010 name="query.a.page1.stbc010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbc011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc011
            #add-point:ON ACTION controlp INFIELD stbc011 name="construct.c.page1.stbc011"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2060'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbc011  #顯示到畫面上
            NEXT FIELD stbc011                     #返回原欄位            


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc011
            #add-point:BEFORE FIELD stbc011 name="query.b.page1.stbc011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc011
            
            #add-point:AFTER FIELD stbc011 name="query.a.page1.stbc011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbc012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc012
            #add-point:ON ACTION controlp INFIELD stbc012 name="construct.c.page1.stbc012"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbc012  #顯示到畫面上
            NEXT FIELD stbc012                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc012
            #add-point:BEFORE FIELD stbc012 name="query.b.page1.stbc012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc012
            
            #add-point:AFTER FIELD stbc012 name="query.a.page1.stbc012"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc037
            #add-point:BEFORE FIELD stbc037 name="query.b.page1.stbc037"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc037
            
            #add-point:AFTER FIELD stbc037 name="query.a.page1.stbc037"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc037
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc037
            #add-point:ON ACTION controlp INFIELD stbc037 name="query.c.page1.stbc037"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc038
            #add-point:BEFORE FIELD stbc038 name="query.b.page1.stbc038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc038
            
            #add-point:AFTER FIELD stbc038 name="query.a.page1.stbc038"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc038
            #add-point:ON ACTION controlp INFIELD stbc038 name="query.c.page1.stbc038"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc041
            #add-point:BEFORE FIELD stbc041 name="query.b.page1.stbc041"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc041
            
            #add-point:AFTER FIELD stbc041 name="query.a.page1.stbc041"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc041
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc041
            #add-point:ON ACTION controlp INFIELD stbc041 name="query.c.page1.stbc041"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbc013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc013
            #add-point:ON ACTION controlp INFIELD stbc013 name="construct.c.page1.stbc013"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbc013  #顯示到畫面上
            NEXT FIELD stbc013                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc013
            #add-point:BEFORE FIELD stbc013 name="query.b.page1.stbc013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc013
            
            #add-point:AFTER FIELD stbc013 name="query.a.page1.stbc013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbc014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc014
            #add-point:ON ACTION controlp INFIELD stbc014 name="construct.c.page1.stbc014"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
#            CALL q_oodb002()                           #呼叫開窗
            CALL q_oodb002_3()  
            DISPLAY g_qryparam.return1 TO stbc014  #顯示到畫面上
            NEXT FIELD stbc014                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc014
            #add-point:BEFORE FIELD stbc014 name="query.b.page1.stbc014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc014
            
            #add-point:AFTER FIELD stbc014 name="query.a.page1.stbc014"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc014_desc
            #add-point:BEFORE FIELD stbc014_desc name="query.b.page1.stbc014_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc014_desc
            
            #add-point:AFTER FIELD stbc014_desc name="query.a.page1.stbc014_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc014_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc014_desc
            #add-point:ON ACTION controlp INFIELD stbc014_desc name="query.c.page1.stbc014_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc015
            #add-point:BEFORE FIELD stbc015 name="query.b.page1.stbc015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc015
            
            #add-point:AFTER FIELD stbc015 name="query.a.page1.stbc015"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc015
            #add-point:ON ACTION controlp INFIELD stbc015 name="query.c.page1.stbc015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc016
            #add-point:BEFORE FIELD stbc016 name="query.b.page1.stbc016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc016
            
            #add-point:AFTER FIELD stbc016 name="query.a.page1.stbc016"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc016
            #add-point:ON ACTION controlp INFIELD stbc016 name="query.c.page1.stbc016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc017
            #add-point:BEFORE FIELD stbc017 name="query.b.page1.stbc017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc017
            
            #add-point:AFTER FIELD stbc017 name="query.a.page1.stbc017"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc017
            #add-point:ON ACTION controlp INFIELD stbc017 name="query.c.page1.stbc017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc018
            #add-point:BEFORE FIELD stbc018 name="query.b.page1.stbc018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc018
            
            #add-point:AFTER FIELD stbc018 name="query.a.page1.stbc018"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc018
            #add-point:ON ACTION controlp INFIELD stbc018 name="query.c.page1.stbc018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc019
            #add-point:BEFORE FIELD stbc019 name="query.b.page1.stbc019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc019
            
            #add-point:AFTER FIELD stbc019 name="query.a.page1.stbc019"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc019
            #add-point:ON ACTION controlp INFIELD stbc019 name="query.c.page1.stbc019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc020
            #add-point:BEFORE FIELD stbc020 name="query.b.page1.stbc020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc020
            
            #add-point:AFTER FIELD stbc020 name="query.a.page1.stbc020"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc020
            #add-point:ON ACTION controlp INFIELD stbc020 name="query.c.page1.stbc020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc021
            #add-point:BEFORE FIELD stbc021 name="query.b.page1.stbc021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc021
            
            #add-point:AFTER FIELD stbc021 name="query.a.page1.stbc021"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc021
            #add-point:ON ACTION controlp INFIELD stbc021 name="query.c.page1.stbc021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc022
            #add-point:BEFORE FIELD stbc022 name="query.b.page1.stbc022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc022
            
            #add-point:AFTER FIELD stbc022 name="query.a.page1.stbc022"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc022
            #add-point:ON ACTION controlp INFIELD stbc022 name="query.c.page1.stbc022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc023
            #add-point:BEFORE FIELD stbc023 name="query.b.page1.stbc023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc023
            
            #add-point:AFTER FIELD stbc023 name="query.a.page1.stbc023"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc023
            #add-point:ON ACTION controlp INFIELD stbc023 name="query.c.page1.stbc023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc024
            #add-point:BEFORE FIELD stbc024 name="query.b.page1.stbc024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc024
            
            #add-point:AFTER FIELD stbc024 name="query.a.page1.stbc024"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc024
            #add-point:ON ACTION controlp INFIELD stbc024 name="query.c.page1.stbc024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc034
            #add-point:BEFORE FIELD stbc034 name="query.b.page1.stbc034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc034
            
            #add-point:AFTER FIELD stbc034 name="query.a.page1.stbc034"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc034
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc034
            #add-point:ON ACTION controlp INFIELD stbc034 name="query.c.page1.stbc034"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc057
            #add-point:BEFORE FIELD stbc057 name="query.b.page1.stbc057"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc057
            
            #add-point:AFTER FIELD stbc057 name="query.a.page1.stbc057"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc057
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc057
            #add-point:ON ACTION controlp INFIELD stbc057 name="query.c.page1.stbc057"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc035
            #add-point:BEFORE FIELD stbc035 name="query.b.page1.stbc035"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc035
            
            #add-point:AFTER FIELD stbc035 name="query.a.page1.stbc035"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc035
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc035
            #add-point:ON ACTION controlp INFIELD stbc035 name="query.c.page1.stbc035"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc036
            #add-point:BEFORE FIELD stbc036 name="query.b.page1.stbc036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc036
            
            #add-point:AFTER FIELD stbc036 name="query.a.page1.stbc036"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc036
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc036
            #add-point:ON ACTION controlp INFIELD stbc036 name="query.c.page1.stbc036"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc039
            #add-point:BEFORE FIELD stbc039 name="query.b.page1.stbc039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc039
            
            #add-point:AFTER FIELD stbc039 name="query.a.page1.stbc039"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc039
            #add-point:ON ACTION controlp INFIELD stbc039 name="query.c.page1.stbc039"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc042
            #add-point:BEFORE FIELD stbc042 name="query.b.page1.stbc042"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc042
            
            #add-point:AFTER FIELD stbc042 name="query.a.page1.stbc042"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbc042
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc042
            #add-point:ON ACTION controlp INFIELD stbc042 name="query.c.page1.stbc042"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbcstus
            #add-point:BEFORE FIELD stbcstus name="query.b.page1.stbcstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbcstus
            
            #add-point:AFTER FIELD stbcstus name="query.a.page1.stbcstus"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stbcstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbcstus
            #add-point:ON ACTION controlp INFIELD stbcstus name="query.c.page1.stbcstus"
            
            #END add-point
 
 
  
         
 
      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.before_construct"
            
            #end add-point 
      
      END CONSTRUCT
  
      #add-point:query段more_construct name="query.more_construct"
      
      #end add-point 
  
      BEFORE DIALOG 
         CALL cl_qbe_init()
         #add-point:query段before_dialog name="query.before_dialog"
         
         #end add-point 
      
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
      
      ON ACTION qbe_save
         CALL cl_qbe_save()
      
      ON ACTION accept
         ACCEPT DIALOG
         
      ON ACTION cancel
         LET INT_FLAG = 1
         CANCEL DIALOG
      
      #交談指令共用ACTION
      &include "common_action.4gl"
      CONTINUE DIALOG 
   END DIALOG
 
   #add-point:query段after_construct name="query.after_construct"
   
   #ADDED BY LANJJ 2015-10-13 
   IF INT_FLAG = 1 THEN 
      RETURN
   END IF
   #ADDED BY LANJJ 2015-10-13 
   
   #end add-point
 
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      #還原
      #LET g_wc2 = ls_wc
      LET g_wc2 = " 1=2"
      RETURN
   ELSE
      LET g_error_show = 1
      LET g_detail_idx = 1
   END IF
    
   CALL astq530_b_fill(g_wc2)
 
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = -100 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
   END IF
   
   LET INT_FLAG = FALSE
   
END FUNCTION
 
{</section>}
 
{<section id="astq530.insert" >}
#+ 資料新增
PRIVATE FUNCTION astq530_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point                
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #add-point:單身新增前 name="insert.b_insert"
   
   #end add-point
   
   LET g_insert = 'Y'
   CALL astq530_modify()
            
   #add-point:單身新增後 name="insert.a_insert"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq530.modify" >}
#+ 資料修改
PRIVATE FUNCTION astq530_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point
   DEFINE  l_cmd                  LIKE type_t.chr1
   DEFINE  l_ac_t                 LIKE type_t.num10               #未取消的ARRAY CNT 
   DEFINE  l_n                    LIKE type_t.num10               #檢查重複用  
   DEFINE  l_cnt                  LIKE type_t.num10               #檢查重複用  
   DEFINE  l_lock_sw              LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert         LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete         LIKE type_t.num5                #可刪除否  
   DEFINE  l_count                LIKE type_t.num10
   DEFINE  l_i                    LIKE type_t.num10
   DEFINE  ls_return              STRING
   DEFINE  l_var_keys             DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys           DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                 DYNAMIC ARRAY OF STRING
   DEFINE  l_fields               DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak         DYNAMIC ARRAY OF STRING
   DEFINE  li_reproduce           LIKE type_t.num10
   DEFINE  li_reproduce_target    LIKE type_t.num10
   DEFINE  lb_reproduce           BOOLEAN
   DEFINE  l_insert               BOOLEAN
   #add-point:modify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
#  LET g_action_choice = ""   #(ver:35) mark
   
   LET g_qryparam.state = "i"
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   
   #add-point:modify開始前 name="modify.define_sql"
   
   #end add-point
   
   LET INT_FLAG = FALSE
   LET lb_reproduce = FALSE
   LET l_insert = FALSE
 
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
 
   #add-point:modify段修改前 name="modify.before_input"
   
   #end add-point
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #Page1 預設值產生於此處
      INPUT ARRAY g_stbc_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_detail_cnt,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stbc_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astq530_b_fill(g_wc2)
            LET g_detail_cnt = g_stbc_d.getLength()
         
         BEFORE ROW
            #add-point:modify段before row name="input.body.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = g_detail_idx
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
            DISPLAY g_stbc_d.getLength() TO FORMONLY.cnt
         
            CALL s_transaction_begin()
            LET g_detail_cnt = g_stbc_d.getLength()
            
            IF g_detail_cnt >= l_ac 
               AND g_stbc_d[l_ac].stbc001 IS NOT NULL
               AND g_stbc_d[l_ac].stbc004 IS NOT NULL
               AND g_stbc_d[l_ac].stbc005 IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stbc_d_t.* = g_stbc_d[l_ac].*  #BACKUP
               LET g_stbc_d_o.* = g_stbc_d[l_ac].*  #BACKUP
               IF NOT astq530_lock_b("stbc_t") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astq530_bcl INTO g_stbc_d[l_ac].stbc001,g_stbc_d[l_ac].stbc002,g_stbc_d[l_ac].stbc003, 
                      g_stbc_d[l_ac].stbc004,g_stbc_d[l_ac].stbc005,g_stbc_d[l_ac].stbc040,g_stbc_d[l_ac].stbc006, 
                      g_stbc_d[l_ac].stbc007,g_stbc_d[l_ac].stbc028,g_stbc_d[l_ac].stbc045,g_stbc_d[l_ac].stbc046, 
                      g_stbc_d[l_ac].stbcsite,g_stbc_d[l_ac].stbc026,g_stbc_d[l_ac].stbc025,g_stbc_d[l_ac].stbc027, 
                      g_stbc_d[l_ac].stbc008,g_stbc_d[l_ac].stbc033,g_stbc_d[l_ac].stbc058,g_stbc_d[l_ac].stbc029, 
                      g_stbc_d[l_ac].stbc030,g_stbc_d[l_ac].stbc009,g_stbc_d[l_ac].stbc010,g_stbc_d[l_ac].stbc011, 
                      g_stbc_d[l_ac].stbc012,g_stbc_d[l_ac].stbc037,g_stbc_d[l_ac].stbc038,g_stbc_d[l_ac].stbc041, 
                      g_stbc_d[l_ac].stbc013,g_stbc_d[l_ac].stbc014,g_stbc_d[l_ac].stbc015,g_stbc_d[l_ac].stbc016, 
                      g_stbc_d[l_ac].stbc017,g_stbc_d[l_ac].stbc018,g_stbc_d[l_ac].stbc019,g_stbc_d[l_ac].stbc020, 
                      g_stbc_d[l_ac].stbc021,g_stbc_d[l_ac].stbc022,g_stbc_d[l_ac].stbc023,g_stbc_d[l_ac].stbc024, 
                      g_stbc_d[l_ac].stbc034,g_stbc_d[l_ac].stbc057,g_stbc_d[l_ac].stbc035,g_stbc_d[l_ac].stbc036, 
                      g_stbc_d[l_ac].stbc039,g_stbc_d[l_ac].stbc042,g_stbc_d[l_ac].stbcstus
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stbc_d_t.stbc001,":",SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stbc_d_mask_o[l_ac].* =  g_stbc_d[l_ac].*
                  CALL astq530_stbc_t_mask()
                  LET g_stbc_d_mask_n[l_ac].* =  g_stbc_d[l_ac].*
                  
                  CALL astq530_detail_show()
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            CALL astq530_set_entry_b(l_cmd)
            CALL astq530_set_no_entry_b(l_cmd)
            #add-point:modify段before row name="input.body.before_row"
  #add by liaolong 150619-00007 #15 15/07/28  --Begin--
            IF l_cmd = 'a' THEN               
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
            CALL astq530_set_entry_b("a")
            CALL astq530_set_no_entry_b("a")
  #add by liaolong 150619-00007 #15 15/07/28  --End--          
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
        
         BEFORE INSERT
            
            LET l_insert = TRUE
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stbc_d_t.* TO NULL
            INITIALIZE g_stbc_d_o.* TO NULL
            INITIALIZE g_stbc_d[l_ac].* TO NULL 
            #公用欄位給值(單身)
            #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stbc_d[l_ac].stbcstus = ''
 
 
 
            #自定義預設值(單身1)
                  LET g_stbc_d[l_ac].stbc017 = "0"
      LET g_stbc_d[l_ac].stbc018 = "0"
      LET g_stbc_d[l_ac].stbc019 = "0"
      LET g_stbc_d[l_ac].stbc020 = "0"
      LET g_stbc_d[l_ac].stbc021 = "0"
      LET g_stbc_d[l_ac].stbc022 = "0"
      LET g_stbc_d[l_ac].stbc023 = "0"
      LET g_stbc_d[l_ac].stbc024 = "0"
      LET g_stbc_d[l_ac].stbc034 = "0"
      LET g_stbc_d[l_ac].stbc057 = "0"
      LET g_stbc_d[l_ac].stbc035 = "0"
      LET g_stbc_d[l_ac].stbc036 = "0"
      LET g_stbc_d[l_ac].stbc039 = "0"
      LET g_stbc_d[l_ac].stbc042 = "0"
 
            #add-point:modify段before備份 name="input.body.before_bak"
            
            #end add-point
            LET g_stbc_d_t.* = g_stbc_d[l_ac].*     #新輸入資料
            LET g_stbc_d_o.* = g_stbc_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stbc_d[li_reproduce_target].* = g_stbc_d[li_reproduce].*
 
               LET g_stbc_d[g_stbc_d.getLength()].stbc001 = NULL
               LET g_stbc_d[g_stbc_d.getLength()].stbc004 = NULL
               LET g_stbc_d[g_stbc_d.getLength()].stbc005 = NULL
 
            END IF
            
 
            CALL astq530_set_entry_b(l_cmd)
            CALL astq530_set_no_entry_b(l_cmd)
            #add-point:modify段before insert name="input.body.before_insert"
            
            #end add-point  
  
         AFTER INSERT
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code   = 9001 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM stbc_t 
             WHERE stbcent = g_enterprise AND stbc001 = g_stbc_d[l_ac].stbc001
                                       AND stbc004 = g_stbc_d[l_ac].stbc004
                                       AND stbc005 = g_stbc_d[l_ac].stbc005
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbc_d[g_detail_idx].stbc001
               LET gs_keys[2] = g_stbc_d[g_detail_idx].stbc004
               LET gs_keys[3] = g_stbc_d[g_detail_idx].stbc005
               CALL astq530_insert_b('stbc_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_stbc_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code   = "std-00006" 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astq530_b_fill(g_wc2)
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               ##ERROR 'INSERT O.K'
               LET g_detail_cnt = g_detail_cnt + 1
               
               LET g_wc2 = g_wc2, " OR (stbc001 = '", g_stbc_d[l_ac].stbc001, "' "
                                  ," AND stbc004 = '", g_stbc_d[l_ac].stbc004, "' "
                                  ," AND stbc005 = '", g_stbc_d[l_ac].stbc005, "' "
 
                                  ,")"
            END IF                
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
            ELSE
               #add-point:單身刪除ask前 name="input.body.b_delete_ask"
               
               #end add-point   
               
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = -263 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               
               #add-point:單身刪除前 name="input.body.b_delete"
               
               #end add-point   
               
               DELETE FROM stbc_t
                WHERE stbcent = g_enterprise AND 
                      stbc001 = g_stbc_d_t.stbc001
                      AND stbc004 = g_stbc_d_t.stbc004
                      AND stbc005 = g_stbc_d_t.stbc005
 
                      
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point  
                      
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  CANCEL DELETE   
               ELSE
                  LET g_detail_cnt = g_detail_cnt-1
                  
 
                  #add-point:單身刪除後 name="input.body.a_delete"
                  
                  #end add-point
                  #修改歷程記錄(刪除)
                  CALL astq530_set_pk_array()
                  LET g_log1 = util.JSON.stringify(g_stbc_d[l_ac])   #(ver:38)
                  IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:38)
                     CALL s_transaction_end('N','0')
                  ELSE
                     CALL s_transaction_end('Y','0')
                  END IF
               END IF 
               CLOSE astq530_bcl
               #add-point:單身關閉bcl name="input.body.close"
               
               #end add-point
               LET l_count = g_stbc_d.getLength()
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbc_d_t.stbc001
               LET gs_keys[2] = g_stbc_d_t.stbc004
               LET gs_keys[3] = g_stbc_d_t.stbc005
 
               #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astq530_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
            END IF 
              
         AFTER DELETE 
            IF l_cmd <> 'd' THEN
               #add-point:單身刪除後2 name="input.body.after_delete"
               
               #end add-point
                              CALL astq530_delete_b('stbc_t',gs_keys,"'1'")
            END IF
            #如果是最後一筆
            IF l_ac = (g_stbc_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
            #add-point:單身刪除後3 name="input.body.after_delete3"
            
            #end add-point
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc001
            
            #add-point:AFTER FIELD stbc001 name="input.a.page1.stbc001"
            #此段落由子樣板a05產生
            IF  g_stbc_d[g_detail_idx].stbc001 IS NOT NULL AND g_stbc_d[g_detail_idx].stbc011 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbc_d[g_detail_idx].stbc001 != g_stbc_d_t.stbc001 OR g_stbc_d[g_detail_idx].stbc011 != g_stbc_d_t.stbc011)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbc_t WHERE "||"stbcent = '" ||g_enterprise|| "' AND "||"stbc001 = '"||g_stbc_d[g_detail_idx].stbc001 ||"' AND "|| "stbc011 = '"||g_stbc_d[g_detail_idx].stbc011 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc001
            #add-point:BEFORE FIELD stbc001 name="input.b.page1.stbc001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc001
            #add-point:ON CHANGE stbc001 name="input.g.page1.stbc001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc002
            #add-point:BEFORE FIELD stbc002 name="input.b.page1.stbc002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc002
            
            #add-point:AFTER FIELD stbc002 name="input.a.page1.stbc002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc002
            #add-point:ON CHANGE stbc002 name="input.g.page1.stbc002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc003
            #add-point:BEFORE FIELD stbc003 name="input.b.page1.stbc003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc003
            
            #add-point:AFTER FIELD stbc003 name="input.a.page1.stbc003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc003
            #add-point:ON CHANGE stbc003 name="input.g.page1.stbc003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc004
            #add-point:BEFORE FIELD stbc004 name="input.b.page1.stbc004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc004
            
            #add-point:AFTER FIELD stbc004 name="input.a.page1.stbc004"
            #此段落由子樣板a05產生
            IF  g_stbc_d[g_detail_idx].stbc001 IS NOT NULL AND g_stbc_d[g_detail_idx].stbc004 IS NOT NULL AND g_stbc_d[g_detail_idx].stbc005 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbc_d[g_detail_idx].stbc001 != g_stbc_d_t.stbc001 OR g_stbc_d[g_detail_idx].stbc004 != g_stbc_d_t.stbc004 OR g_stbc_d[g_detail_idx].stbc005 != g_stbc_d_t.stbc005)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbc_t WHERE "||"stbcent = '" ||g_enterprise|| "' AND "||"stbc001 = '"||g_stbc_d[g_detail_idx].stbc001 ||"' AND "|| "stbc004 = '"||g_stbc_d[g_detail_idx].stbc004 ||"' AND "|| "stbc005 = '"||g_stbc_d[g_detail_idx].stbc005 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc004
            #add-point:ON CHANGE stbc004 name="input.g.page1.stbc004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc005
            #add-point:BEFORE FIELD stbc005 name="input.b.page1.stbc005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc005
            
            #add-point:AFTER FIELD stbc005 name="input.a.page1.stbc005"
            #此段落由子樣板a05產生
            IF  g_stbc_d[g_detail_idx].stbc001 IS NOT NULL AND g_stbc_d[g_detail_idx].stbc004 IS NOT NULL AND g_stbc_d[g_detail_idx].stbc005 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbc_d[g_detail_idx].stbc001 != g_stbc_d_t.stbc001 OR g_stbc_d[g_detail_idx].stbc004 != g_stbc_d_t.stbc004 OR g_stbc_d[g_detail_idx].stbc005 != g_stbc_d_t.stbc005)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbc_t WHERE "||"stbcent = '" ||g_enterprise|| "' AND "||"stbc001 = '"||g_stbc_d[g_detail_idx].stbc001 ||"' AND "|| "stbc004 = '"||g_stbc_d[g_detail_idx].stbc004 ||"' AND "|| "stbc005 = '"||g_stbc_d[g_detail_idx].stbc005 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc005
            #add-point:ON CHANGE stbc005 name="input.g.page1.stbc005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc040
            #add-point:BEFORE FIELD stbc040 name="input.b.page1.stbc040"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc040
            
            #add-point:AFTER FIELD stbc040 name="input.a.page1.stbc040"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc040
            #add-point:ON CHANGE stbc040 name="input.g.page1.stbc040"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc006
            #add-point:BEFORE FIELD stbc006 name="input.b.page1.stbc006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc006
            
            #add-point:AFTER FIELD stbc006 name="input.a.page1.stbc006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc006
            #add-point:ON CHANGE stbc006 name="input.g.page1.stbc006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc007
            #add-point:BEFORE FIELD stbc007 name="input.b.page1.stbc007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc007
            
            #add-point:AFTER FIELD stbc007 name="input.a.page1.stbc007"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbc008
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbc008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbc008_desc


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc007
            #add-point:ON CHANGE stbc007 name="input.g.page1.stbc007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc028
            #add-point:BEFORE FIELD stbc028 name="input.b.page1.stbc028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc028
            
            #add-point:AFTER FIELD stbc028 name="input.a.page1.stbc028"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc028
            #add-point:ON CHANGE stbc028 name="input.g.page1.stbc028"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc045
            #add-point:BEFORE FIELD stbc045 name="input.b.page1.stbc045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc045
            
            #add-point:AFTER FIELD stbc045 name="input.a.page1.stbc045"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc045
            #add-point:ON CHANGE stbc045 name="input.g.page1.stbc045"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc046
            #add-point:BEFORE FIELD stbc046 name="input.b.page1.stbc046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc046
            
            #add-point:AFTER FIELD stbc046 name="input.a.page1.stbc046"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc046
            #add-point:ON CHANGE stbc046 name="input.g.page1.stbc046"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbcsite
            
            #add-point:AFTER FIELD stbcsite name="input.a.page1.stbcsite"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbcsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbcsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbcsite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbcsite
            #add-point:BEFORE FIELD stbcsite name="input.b.page1.stbcsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbcsite
            #add-point:ON CHANGE stbcsite name="input.g.page1.stbcsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc026
            #add-point:BEFORE FIELD stbc026 name="input.b.page1.stbc026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc026
            
            #add-point:AFTER FIELD stbc026 name="input.a.page1.stbc026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc026
            #add-point:ON CHANGE stbc026 name="input.g.page1.stbc026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc025
            #add-point:BEFORE FIELD stbc025 name="input.b.page1.stbc025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc025
            
            #add-point:AFTER FIELD stbc025 name="input.a.page1.stbc025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc025
            #add-point:ON CHANGE stbc025 name="input.g.page1.stbc025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc027
            #add-point:BEFORE FIELD stbc027 name="input.b.page1.stbc027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc027
            
            #add-point:AFTER FIELD stbc027 name="input.a.page1.stbc027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc027
            #add-point:ON CHANGE stbc027 name="input.g.page1.stbc027"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc008
            
            #add-point:AFTER FIELD stbc008 name="input.a.page1.stbc008"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbc008
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbc008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbc008_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc008
            #add-point:BEFORE FIELD stbc008 name="input.b.page1.stbc008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc008
            #add-point:ON CHANGE stbc008 name="input.g.page1.stbc008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc033
            
            #add-point:AFTER FIELD stbc033 name="input.a.page1.stbc033"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbc033
            CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbc033_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbc033_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc033
            #add-point:BEFORE FIELD stbc033 name="input.b.page1.stbc033"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc033
            #add-point:ON CHANGE stbc033 name="input.g.page1.stbc033"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc058
            #add-point:BEFORE FIELD stbc058 name="input.b.page1.stbc058"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc058
            
            #add-point:AFTER FIELD stbc058 name="input.a.page1.stbc058"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc058
            #add-point:ON CHANGE stbc058 name="input.g.page1.stbc058"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc029
            
            #add-point:AFTER FIELD stbc029 name="input.a.page1.stbc029"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbc029
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbc029_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbc029_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc029
            #add-point:BEFORE FIELD stbc029 name="input.b.page1.stbc029"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc029
            #add-point:ON CHANGE stbc029 name="input.g.page1.stbc029"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc030
            #add-point:BEFORE FIELD stbc030 name="input.b.page1.stbc030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc030
            
            #add-point:AFTER FIELD stbc030 name="input.a.page1.stbc030"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc030
            #add-point:ON CHANGE stbc030 name="input.g.page1.stbc030"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc009
            #add-point:BEFORE FIELD stbc009 name="input.b.page1.stbc009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc009
            
            #add-point:AFTER FIELD stbc009 name="input.a.page1.stbc009"



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc009
            #add-point:ON CHANGE stbc009 name="input.g.page1.stbc009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc010
            
            #add-point:AFTER FIELD stbc010 name="input.a.page1.stbc010"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbc010
            CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbc010_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbc010_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc010
            #add-point:BEFORE FIELD stbc010 name="input.b.page1.stbc010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc010
            #add-point:ON CHANGE stbc010 name="input.g.page1.stbc010"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc011
            
            #add-point:AFTER FIELD stbc011 name="input.a.page1.stbc011"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbc011
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbc011_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbc011_desc


            #此段落由子樣板a05產生
            IF  g_stbc_d[g_detail_idx].stbc001 IS NOT NULL AND g_stbc_d[g_detail_idx].stbc011 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbc_d[g_detail_idx].stbc001 != g_stbc_d_t.stbc001 OR g_stbc_d[g_detail_idx].stbc011 != g_stbc_d_t.stbc011)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbc_t WHERE "||"stbcent = '" ||g_enterprise|| "' AND "||"stbc001 = '"||g_stbc_d[g_detail_idx].stbc001 ||"' AND "|| "stbc011 = '"||g_stbc_d[g_detail_idx].stbc011 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc011
            #add-point:BEFORE FIELD stbc011 name="input.b.page1.stbc011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc011
            #add-point:ON CHANGE stbc011 name="input.g.page1.stbc011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc012
            
            #add-point:AFTER FIELD stbc012 name="input.a.page1.stbc012"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbc012
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbc012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbc012_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc012
            #add-point:BEFORE FIELD stbc012 name="input.b.page1.stbc012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc012
            #add-point:ON CHANGE stbc012 name="input.g.page1.stbc012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc037
            #add-point:BEFORE FIELD stbc037 name="input.b.page1.stbc037"
            #只有状态码是1未结算，纳入结算单否，票扣否栏位开放  #add by liaolong 150619-00007 --Begin--
            IF g_stbc_d[l_ac].stbcstus = '1' AND g_stbc_d[l_ac].stbc003 = '3'  THEN
               IF g_stbc_d[l_ac].stbc037 = 'N' THEN
                  LET g_stbc_d[l_ac].stbc038 = 'N'
               END IF
               CALL astq530_set_entry_b("a")
               CALL astq530_set_no_entry_b("a")
            ELSE 
               NEXT FIELD stbc015
            END IF
            #add by liaolong 150619-00007 --End--
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc037
            
            #add-point:AFTER FIELD stbc037 name="input.a.page1.stbc037"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc037
            #add-point:ON CHANGE stbc037 name="input.g.page1.stbc037"
#         #只有状态码是1未结算，纳入结算单否，票扣否栏位开放  #add by liaolong 150619-00007 --Begin--           
#            IF g_stbc_d[l_ac].stbc037 = 'N' THEN
#               LET g_stbc_d[l_ac].stbc038 = 'N'
#            END IF
#            CALL astq530_set_entry_b("a")
#            CALL astq530_set_no_entry_b("a")
#        #add by liaolong 150619-00007 --End--
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc038
            #add-point:BEFORE FIELD stbc038 name="input.b.page1.stbc038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc038
            
            #add-point:AFTER FIELD stbc038 name="input.a.page1.stbc038"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc038
            #add-point:ON CHANGE stbc038 name="input.g.page1.stbc038"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc041
            #add-point:BEFORE FIELD stbc041 name="input.b.page1.stbc041"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc041
            
            #add-point:AFTER FIELD stbc041 name="input.a.page1.stbc041"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc041
            #add-point:ON CHANGE stbc041 name="input.g.page1.stbc041"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc013
            
            #add-point:AFTER FIELD stbc013 name="input.a.page1.stbc013"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbc013
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbc013_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbc013_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc013
            #add-point:BEFORE FIELD stbc013 name="input.b.page1.stbc013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc013
            #add-point:ON CHANGE stbc013 name="input.g.page1.stbc013"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc014
            
            #add-point:AFTER FIELD stbc014 name="input.a.page1.stbc014"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbc014
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbc014_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbc014_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc014
            #add-point:BEFORE FIELD stbc014 name="input.b.page1.stbc014"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc014
            #add-point:ON CHANGE stbc014 name="input.g.page1.stbc014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc014_desc
            #add-point:BEFORE FIELD stbc014_desc name="input.b.page1.stbc014_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc014_desc
            
            #add-point:AFTER FIELD stbc014_desc name="input.a.page1.stbc014_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc014_desc
            #add-point:ON CHANGE stbc014_desc name="input.g.page1.stbc014_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc015
            #add-point:BEFORE FIELD stbc015 name="input.b.page1.stbc015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc015
            
            #add-point:AFTER FIELD stbc015 name="input.a.page1.stbc015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc015
            #add-point:ON CHANGE stbc015 name="input.g.page1.stbc015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc016
            #add-point:BEFORE FIELD stbc016 name="input.b.page1.stbc016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc016
            
            #add-point:AFTER FIELD stbc016 name="input.a.page1.stbc016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc016
            #add-point:ON CHANGE stbc016 name="input.g.page1.stbc016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc017
            #add-point:BEFORE FIELD stbc017 name="input.b.page1.stbc017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc017
            
            #add-point:AFTER FIELD stbc017 name="input.a.page1.stbc017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc017
            #add-point:ON CHANGE stbc017 name="input.g.page1.stbc017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc018
            #add-point:BEFORE FIELD stbc018 name="input.b.page1.stbc018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc018
            
            #add-point:AFTER FIELD stbc018 name="input.a.page1.stbc018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc018
            #add-point:ON CHANGE stbc018 name="input.g.page1.stbc018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc019
            #add-point:BEFORE FIELD stbc019 name="input.b.page1.stbc019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc019
            
            #add-point:AFTER FIELD stbc019 name="input.a.page1.stbc019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc019
            #add-point:ON CHANGE stbc019 name="input.g.page1.stbc019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc020
            #add-point:BEFORE FIELD stbc020 name="input.b.page1.stbc020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc020
            
            #add-point:AFTER FIELD stbc020 name="input.a.page1.stbc020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc020
            #add-point:ON CHANGE stbc020 name="input.g.page1.stbc020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc021
            #add-point:BEFORE FIELD stbc021 name="input.b.page1.stbc021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc021
            
            #add-point:AFTER FIELD stbc021 name="input.a.page1.stbc021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc021
            #add-point:ON CHANGE stbc021 name="input.g.page1.stbc021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc022
            #add-point:BEFORE FIELD stbc022 name="input.b.page1.stbc022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc022
            
            #add-point:AFTER FIELD stbc022 name="input.a.page1.stbc022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc022
            #add-point:ON CHANGE stbc022 name="input.g.page1.stbc022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc023
            #add-point:BEFORE FIELD stbc023 name="input.b.page1.stbc023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc023
            
            #add-point:AFTER FIELD stbc023 name="input.a.page1.stbc023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc023
            #add-point:ON CHANGE stbc023 name="input.g.page1.stbc023"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc024
            #add-point:BEFORE FIELD stbc024 name="input.b.page1.stbc024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc024
            
            #add-point:AFTER FIELD stbc024 name="input.a.page1.stbc024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc024
            #add-point:ON CHANGE stbc024 name="input.g.page1.stbc024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc034
            #add-point:BEFORE FIELD stbc034 name="input.b.page1.stbc034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc034
            
            #add-point:AFTER FIELD stbc034 name="input.a.page1.stbc034"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc034
            #add-point:ON CHANGE stbc034 name="input.g.page1.stbc034"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc057
            #add-point:BEFORE FIELD stbc057 name="input.b.page1.stbc057"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc057
            
            #add-point:AFTER FIELD stbc057 name="input.a.page1.stbc057"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc057
            #add-point:ON CHANGE stbc057 name="input.g.page1.stbc057"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc035
            #add-point:BEFORE FIELD stbc035 name="input.b.page1.stbc035"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc035
            
            #add-point:AFTER FIELD stbc035 name="input.a.page1.stbc035"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc035
            #add-point:ON CHANGE stbc035 name="input.g.page1.stbc035"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc036
            #add-point:BEFORE FIELD stbc036 name="input.b.page1.stbc036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc036
            
            #add-point:AFTER FIELD stbc036 name="input.a.page1.stbc036"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc036
            #add-point:ON CHANGE stbc036 name="input.g.page1.stbc036"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc039
            #add-point:BEFORE FIELD stbc039 name="input.b.page1.stbc039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc039
            
            #add-point:AFTER FIELD stbc039 name="input.a.page1.stbc039"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc039
            #add-point:ON CHANGE stbc039 name="input.g.page1.stbc039"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc042
            #add-point:BEFORE FIELD stbc042 name="input.b.page1.stbc042"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc042
            
            #add-point:AFTER FIELD stbc042 name="input.a.page1.stbc042"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc042
            #add-point:ON CHANGE stbc042 name="input.g.page1.stbc042"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbcstus
            #add-point:BEFORE FIELD stbcstus name="input.b.page1.stbcstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbcstus
            
            #add-point:AFTER FIELD stbcstus name="input.a.page1.stbcstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbcstus
            #add-point:ON CHANGE stbcstus name="input.g.page1.stbcstus"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stbc001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc001
            #add-point:ON ACTION controlp INFIELD stbc001 name="input.c.page1.stbc001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc002
            #add-point:ON ACTION controlp INFIELD stbc002 name="input.c.page1.stbc002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc003
            #add-point:ON ACTION controlp INFIELD stbc003 name="input.c.page1.stbc003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc004
            #add-point:ON ACTION controlp INFIELD stbc004 name="input.c.page1.stbc004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc005
            #add-point:ON ACTION controlp INFIELD stbc005 name="input.c.page1.stbc005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc040
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc040
            #add-point:ON ACTION controlp INFIELD stbc040 name="input.c.page1.stbc040"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc006
            #add-point:ON ACTION controlp INFIELD stbc006 name="input.c.page1.stbc006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc007
            #add-point:ON ACTION controlp INFIELD stbc007 name="input.c.page1.stbc007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc028
            #add-point:ON ACTION controlp INFIELD stbc028 name="input.c.page1.stbc028"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc045
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc045
            #add-point:ON ACTION controlp INFIELD stbc045 name="input.c.page1.stbc045"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc046
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc046
            #add-point:ON ACTION controlp INFIELD stbc046 name="input.c.page1.stbc046"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbcsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbcsite
            #add-point:ON ACTION controlp INFIELD stbcsite name="input.c.page1.stbcsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc026
            #add-point:ON ACTION controlp INFIELD stbc026 name="input.c.page1.stbc026"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc025
            #add-point:ON ACTION controlp INFIELD stbc025 name="input.c.page1.stbc025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc027
            #add-point:ON ACTION controlp INFIELD stbc027 name="input.c.page1.stbc027"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc008
            #add-point:ON ACTION controlp INFIELD stbc008 name="input.c.page1.stbc008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc033
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc033
            #add-point:ON ACTION controlp INFIELD stbc033 name="input.c.page1.stbc033"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc058
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc058
            #add-point:ON ACTION controlp INFIELD stbc058 name="input.c.page1.stbc058"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc029
            #add-point:ON ACTION controlp INFIELD stbc029 name="input.c.page1.stbc029"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc030
            #add-point:ON ACTION controlp INFIELD stbc030 name="input.c.page1.stbc030"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc009
            #add-point:ON ACTION controlp INFIELD stbc009 name="input.c.page1.stbc009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc010
            #add-point:ON ACTION controlp INFIELD stbc010 name="input.c.page1.stbc010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc011
            #add-point:ON ACTION controlp INFIELD stbc011 name="input.c.page1.stbc011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc012
            #add-point:ON ACTION controlp INFIELD stbc012 name="input.c.page1.stbc012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc037
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc037
            #add-point:ON ACTION controlp INFIELD stbc037 name="input.c.page1.stbc037"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc038
            #add-point:ON ACTION controlp INFIELD stbc038 name="input.c.page1.stbc038"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc041
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc041
            #add-point:ON ACTION controlp INFIELD stbc041 name="input.c.page1.stbc041"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc013
            #add-point:ON ACTION controlp INFIELD stbc013 name="input.c.page1.stbc013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc014
            #add-point:ON ACTION controlp INFIELD stbc014 name="input.c.page1.stbc014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc014_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc014_desc
            #add-point:ON ACTION controlp INFIELD stbc014_desc name="input.c.page1.stbc014_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc015
            #add-point:ON ACTION controlp INFIELD stbc015 name="input.c.page1.stbc015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc016
            #add-point:ON ACTION controlp INFIELD stbc016 name="input.c.page1.stbc016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc017
            #add-point:ON ACTION controlp INFIELD stbc017 name="input.c.page1.stbc017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc018
            #add-point:ON ACTION controlp INFIELD stbc018 name="input.c.page1.stbc018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc019
            #add-point:ON ACTION controlp INFIELD stbc019 name="input.c.page1.stbc019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc020
            #add-point:ON ACTION controlp INFIELD stbc020 name="input.c.page1.stbc020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc021
            #add-point:ON ACTION controlp INFIELD stbc021 name="input.c.page1.stbc021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc022
            #add-point:ON ACTION controlp INFIELD stbc022 name="input.c.page1.stbc022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc023
            #add-point:ON ACTION controlp INFIELD stbc023 name="input.c.page1.stbc023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc024
            #add-point:ON ACTION controlp INFIELD stbc024 name="input.c.page1.stbc024"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc034
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc034
            #add-point:ON ACTION controlp INFIELD stbc034 name="input.c.page1.stbc034"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc057
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc057
            #add-point:ON ACTION controlp INFIELD stbc057 name="input.c.page1.stbc057"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc035
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc035
            #add-point:ON ACTION controlp INFIELD stbc035 name="input.c.page1.stbc035"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc036
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc036
            #add-point:ON ACTION controlp INFIELD stbc036 name="input.c.page1.stbc036"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc039
            #add-point:ON ACTION controlp INFIELD stbc039 name="input.c.page1.stbc039"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc042
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc042
            #add-point:ON ACTION controlp INFIELD stbc042 name="input.c.page1.stbc042"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbcstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbcstus
            #add-point:ON ACTION controlp INFIELD stbcstus name="input.c.page1.stbcstus"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               CLOSE astq530_bcl
               CALL s_transaction_end('N','0')
               LET INT_FLAG = 0
               LET g_stbc_d[l_ac].* = g_stbc_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code   = 9001 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
               #add-point:單身取消時 name="input.body.cancel"
               
               #end add-point
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stbc_d[l_ac].stbc001 
               LET g_errparam.code   = -263 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               LET g_stbc_d[l_ac].* = g_stbc_d_t.*
            ELSE
               #寫入修改者/修改日期資訊(單身)
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL astq530_stbc_t_mask_restore('restore_mask_o')
 
               UPDATE stbc_t SET (stbc001,stbc002,stbc003,stbc004,stbc005,stbc040,stbc006,stbc007,stbc028, 
                   stbc045,stbc046,stbcsite,stbc026,stbc025,stbc027,stbc008,stbc033,stbc058,stbc029, 
                   stbc030,stbc009,stbc010,stbc011,stbc012,stbc037,stbc038,stbc041,stbc013,stbc014,stbc015, 
                   stbc016,stbc017,stbc018,stbc019,stbc020,stbc021,stbc022,stbc023,stbc024,stbc034,stbc057, 
                   stbc035,stbc036,stbc039,stbc042,stbcstus) = (g_stbc_d[l_ac].stbc001,g_stbc_d[l_ac].stbc002, 
                   g_stbc_d[l_ac].stbc003,g_stbc_d[l_ac].stbc004,g_stbc_d[l_ac].stbc005,g_stbc_d[l_ac].stbc040, 
                   g_stbc_d[l_ac].stbc006,g_stbc_d[l_ac].stbc007,g_stbc_d[l_ac].stbc028,g_stbc_d[l_ac].stbc045, 
                   g_stbc_d[l_ac].stbc046,g_stbc_d[l_ac].stbcsite,g_stbc_d[l_ac].stbc026,g_stbc_d[l_ac].stbc025, 
                   g_stbc_d[l_ac].stbc027,g_stbc_d[l_ac].stbc008,g_stbc_d[l_ac].stbc033,g_stbc_d[l_ac].stbc058, 
                   g_stbc_d[l_ac].stbc029,g_stbc_d[l_ac].stbc030,g_stbc_d[l_ac].stbc009,g_stbc_d[l_ac].stbc010, 
                   g_stbc_d[l_ac].stbc011,g_stbc_d[l_ac].stbc012,g_stbc_d[l_ac].stbc037,g_stbc_d[l_ac].stbc038, 
                   g_stbc_d[l_ac].stbc041,g_stbc_d[l_ac].stbc013,g_stbc_d[l_ac].stbc014,g_stbc_d[l_ac].stbc015, 
                   g_stbc_d[l_ac].stbc016,g_stbc_d[l_ac].stbc017,g_stbc_d[l_ac].stbc018,g_stbc_d[l_ac].stbc019, 
                   g_stbc_d[l_ac].stbc020,g_stbc_d[l_ac].stbc021,g_stbc_d[l_ac].stbc022,g_stbc_d[l_ac].stbc023, 
                   g_stbc_d[l_ac].stbc024,g_stbc_d[l_ac].stbc034,g_stbc_d[l_ac].stbc057,g_stbc_d[l_ac].stbc035, 
                   g_stbc_d[l_ac].stbc036,g_stbc_d[l_ac].stbc039,g_stbc_d[l_ac].stbc042,g_stbc_d[l_ac].stbcstus) 
 
                WHERE stbcent = g_enterprise AND
                  stbc001 = g_stbc_d_t.stbc001 #項次   
                  AND stbc004 = g_stbc_d_t.stbc004  
                  AND stbc005 = g_stbc_d_t.stbc005  
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbc_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                  WHEN SQLCA.SQLCODE #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbc_d[g_detail_idx].stbc001
               LET gs_keys_bak[1] = g_stbc_d_t.stbc001
               LET gs_keys[2] = g_stbc_d[g_detail_idx].stbc004
               LET gs_keys_bak[2] = g_stbc_d_t.stbc004
               LET gs_keys[3] = g_stbc_d[g_detail_idx].stbc005
               LET gs_keys_bak[3] = g_stbc_d_t.stbc005
               CALL astq530_update_b('stbc_t',gs_keys,gs_keys_bak,"'1'")
                     #資料多語言用-增/改
                     
                     #修改歷程記錄(修改)
                     LET g_log1 = util.JSON.stringify(g_stbc_d_t)
                     LET g_log2 = util.JSON.stringify(g_stbc_d[l_ac])
                     IF NOT cl_log_modified_record(g_log1,g_log2) THEN
                        CALL s_transaction_end('N','0')
                     END IF
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astq530_stbc_t_mask_restore('restore_mask_n')
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            CALL astq530_unlock_b("stbc_t")
            IF INT_FLAG THEN
               CALL s_transaction_end('N','0')
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code   = 9001 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stbc_d[l_ac].* = g_stbc_d_t.*
               END IF
               #add-point:單身after row name="input.body.a_close"
               
               #end add-point
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #其他table進行unlock
            
             #add-point:單身after row name="input.body.a_row"
            
            #end add-point
            
         AFTER INPUT
            #add-point:單身input後 name="input.body.a_input"
            
            #end add-point
            #錯誤訊息統整顯示
            #CALL cl_err_collect_show()
            #CALL cl_showmsg()
            
         ON ACTION controlo   
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stbc_d[li_reproduce_target].* = g_stbc_d[li_reproduce].*
 
               LET g_stbc_d[li_reproduce_target].stbc001 = NULL
               LET g_stbc_d[li_reproduce_target].stbc004 = NULL
               LET g_stbc_d[li_reproduce_target].stbc005 = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stbc_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stbc_d.getLength()+1
            END IF
            
      END INPUT
      
 
      
 
      
      #add-point:before_more_input name="input.more_input"
      
      #end add-point
      
      BEFORE DIALOG
         #CALL cl_err_collect_init()      
         IF g_temp_idx > 0 THEN
            LET l_ac = g_temp_idx
            CALL DIALOG.setCurrentRow("s_detail1",l_ac)
            LET g_temp_idx = 1
         END IF
         #LET g_curr_diag = ui.DIALOG.getCurrent()
         #add-point:before_dialog name="input.before_dialog"
         
         #end add-point
         CASE g_aw
            WHEN "s_detail1"
               NEXT FIELD stbc001
 
         END CASE
   
      ON ACTION accept
         ACCEPT DIALOG
      
      ON ACTION cancel
         LET INT_FLAG = TRUE 
         CANCEL DIALOG
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) 
              RETURNING g_fld_name,g_frm_name 
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) 
           
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   
   END DIALOG 
    
   #新增後取消
   IF l_cmd = 'a' THEN
      #當取消或無輸入資料按確定時刪除對應資料
      IF INT_FLAG OR cl_null(g_stbc_d[g_detail_idx].stbc001) THEN
         CALL g_stbc_d.deleteElement(g_detail_idx)
 
      END IF
   END IF
   
   #修改後取消
   IF l_cmd = 'u' AND INT_FLAG THEN
      LET g_stbc_d[g_detail_idx].* = g_stbc_d_t.*
   END IF
   
   #add-point:modify段修改後 name="modify.after_input"
   
   #end add-point
 
   CLOSE astq530_bcl
   CALL s_transaction_end('Y','0')
   
END FUNCTION
 
{</section>}
 
{<section id="astq530.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astq530_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point
   DEFINE li_idx          LIKE type_t.num10
   DEFINE li_ac_t         LIKE type_t.num10
   DEFINE li_detail_tmp   LIKE type_t.num10
   DEFINE l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak  DYNAMIC ARRAY OF STRING
   DEFINE l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE l_vars          DYNAMIC ARRAY OF STRING
   DEFINE l_fields        DYNAMIC ARRAY OF STRING
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="delete.body.before_delete"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET li_ac_t = l_ac
   
   LET li_detail_tmp = g_detail_idx
    
   #lock所有所選資料
   FOR li_idx = 1 TO g_stbc_d.getLength()
      LET g_detail_idx = li_idx
      #已選擇的資料
      IF g_curr_diag.isRowSelected(g_curr_diag.getCurrentItem(), li_idx) THEN 
         #確定是否有被鎖定
         IF NOT astq530_lock_b("stbc_t") THEN
            #已被他人鎖定
            CALL s_transaction_end('N','0')
            RETURN
         END IF
 
         #(ver:35) ---add start---
         #確定是否有刪除的權限
         #先確定該table有ownid
         IF cl_getField("stbc_t","stbcownid") THEN
            IF NOT cl_auth_chk_act_permission("delete") THEN
               #有目前權限無法刪除的資料
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         END IF
         #(ver:35) --- add end ---
      END IF
   END FOR
   
   #add-point:單身刪除詢問前 name="delete.body.b_delete_ask"
   
   #end add-point  
   
   #詢問是否確定刪除所選資料
   IF NOT cl_ask_del_detail() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   FOR li_idx = 1 TO g_stbc_d.getLength()
      IF g_stbc_d[li_idx].stbc001 IS NOT NULL
         AND g_stbc_d[li_idx].stbc004 IS NOT NULL
         AND g_stbc_d[li_idx].stbc005 IS NOT NULL
 
         AND g_curr_diag.isRowSelected(g_curr_diag.getCurrentItem(), li_idx) THEN 
         
         #add-point:單身刪除前 name="delete.body.b_delete"
         
         #end add-point   
         
         DELETE FROM stbc_t
          WHERE stbcent = g_enterprise AND 
                stbc001 = g_stbc_d[li_idx].stbc001
                AND stbc004 = g_stbc_d[li_idx].stbc004
                AND stbc005 = g_stbc_d[li_idx].stbc005
 
         #add-point:單身刪除中 name="delete.body.m_delete"
         
         #end add-point  
                
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            RETURN
         ELSE
            LET g_detail_cnt = g_detail_cnt-1
            LET l_ac = li_idx
            
 
 
            
 
 
            #add-point:單身同步刪除前(同層table) name="delete.body.a_delete"
            
            #end add-point
            LET g_detail_idx = li_idx
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbc_d_t.stbc001
               LET gs_keys[2] = g_stbc_d_t.stbc004
               LET gs_keys[3] = g_stbc_d_t.stbc005
 
            #add-point:單身同步刪除中(同層table) name="delete.body.a_delete2"
            
            #end add-point
                           CALL astq530_delete_b('stbc_t',gs_keys,"'1'")
            #add-point:單身同步刪除後(同層table) name="delete.body.a_delete3"
            
            #end add-point
            #刪除相關文件
            #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astq530_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove.func"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
            
         END IF 
      END IF 
    
   END FOR
   CALL s_transaction_end('Y','0')
   
   LET g_detail_idx = li_detail_tmp
            
   #add-point:單身刪除後 name="delete.after"
   
   #end add-point  
   
   LET l_ac = li_ac_t
   
   #刷新資料
   CALL astq530_b_fill(g_wc2)
            
END FUNCTION
 
{</section>}
 
{<section id="astq530.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq530_b_fill(p_wc2)              #BODY FILL UP
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point
   DEFINE p_wc2            STRING
   DEFINE ls_owndept_list  STRING  #(ver:35) add
   DEFINE ls_ownuser_list  STRING  #(ver:35) add
   #add-point:b_fill段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_ooef019  LIKE ooef_t.ooef019
   DEFINE l_where           STRING

   #end add-point
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   IF cl_null(p_wc2) THEN
      LET p_wc2 = " 1=1"
   END IF
   
   #add-point:b_fill段sql之前 name="b_fill.sql_before"
  
   LET p_wc2 = p_wc2  CLIPPED," AND stbc009='4'"

   CALL s_aooi500_sql_where(g_prog,'stbcsite') RETURNING l_where
   LET p_wc2 = p_wc2," AND ",l_where
   LET p_wc2  = p_wc2.trim() 
   
   #ADDED BY LANJJ 2015-10-15 ---s---
   IF cl_null(l_bdate) THEN 
      IF cl_null(l_edate) THEN 
         LET p_wc2 = p_wc2
      ELSE
         LET p_wc2 = p_wc2," AND stbc002 <= to_date('",l_edate,"','yy/mm/dd') "
      END IF 
   ELSE
      IF cl_null(l_edate) THEN 
         LET p_wc2 = p_wc2," AND stbc002 >= to_date('",l_bdate,"','yy/mm/dd') "
      ELSE
         LET p_wc2 = p_wc2," AND stbc002 BETWEEN to_date('",l_bdate,"','yy/mm/dd') AND to_date('",l_edate,"','yy/mm/dd') "
      END IF  
   END IF
   #ADDED BY LANJJ 2015-10-15 ---e--- 
   
   LET g_stbc037 = p_wc2 
   #end add-point
 
   LET g_sql = "SELECT  DISTINCT t0.stbc001,t0.stbc002,t0.stbc003,t0.stbc004,t0.stbc005,t0.stbc040,t0.stbc006, 
       t0.stbc007,t0.stbc028,t0.stbc045,t0.stbc046,t0.stbcsite,t0.stbc026,t0.stbc025,t0.stbc027,t0.stbc008, 
       t0.stbc033,t0.stbc058,t0.stbc029,t0.stbc030,t0.stbc009,t0.stbc010,t0.stbc011,t0.stbc012,t0.stbc037, 
       t0.stbc038,t0.stbc041,t0.stbc013,t0.stbc014,t0.stbc015,t0.stbc016,t0.stbc017,t0.stbc018,t0.stbc019, 
       t0.stbc020,t0.stbc021,t0.stbc022,t0.stbc023,t0.stbc024,t0.stbc034,t0.stbc057,t0.stbc035,t0.stbc036, 
       t0.stbc039,t0.stbc042,t0.stbcstus ,t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ,t4.mhael023 ,t5.pmaal004 , 
       t6.staal003 ,t7.oocql004 ,t8.stael003 ,t9.ooail003 FROM stbc_t t0",
               "",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbc001 AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stbcsite AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stbc008 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN mhael_t t4 ON t4.mhaelent="||g_enterprise||" AND t4.mhael001=t0.stbc033 AND t4.mhael022='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t5 ON t5.pmaalent="||g_enterprise||" AND t5.pmaal001=t0.stbc029 AND t5.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t6 ON t6.staalent="||g_enterprise||" AND t6.staal001=t0.stbc010 AND t6.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t7 ON t7.oocqlent="||g_enterprise||" AND t7.oocql001='2060' AND t7.oocql002=t0.stbc011 AND t7.oocql003='"||g_dlang||"' ",
               " LEFT JOIN stael_t t8 ON t8.staelent="||g_enterprise||" AND t8.stael001=t0.stbc012 AND t8.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t9 ON t9.ooailent="||g_enterprise||" AND t9.ooail001=t0.stbc013 AND t9.ooail002='"||g_dlang||"' ",
 
               " WHERE t0.stbcent= ?  AND  1=1 AND (", p_wc2, ") "
 
   #(ver:35) ---add start---
   
   #(ver:35) --- add end ---
 
   #add-point:b_fill段sql wc name="b_fill.sql_wc"
   LET g_sql = g_sql," AND stbc033 IS NOT NULL " 
   #end add-point
   LET g_sql = g_sql, cl_sql_add_filter("stbc_t"),
                      " ORDER BY t0.stbc001,t0.stbc004,t0.stbc005"
   
   #add-point:b_fill段sql之後 name="b_fill.sql_after"
   
   #end add-point
   
   #LET g_sql = cl_sql_add_tabid(g_sql,"stbc_t")            #WC重組
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq530_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq530_pb
   
   OPEN b_fill_curs USING g_enterprise
 
   CALL g_stbc_d.clear()
 
 
   LET g_cnt = l_ac
   LET l_ac = 1   
   ERROR "Searching!" 
 
   FOREACH b_fill_curs INTO g_stbc_d[l_ac].stbc001,g_stbc_d[l_ac].stbc002,g_stbc_d[l_ac].stbc003,g_stbc_d[l_ac].stbc004, 
       g_stbc_d[l_ac].stbc005,g_stbc_d[l_ac].stbc040,g_stbc_d[l_ac].stbc006,g_stbc_d[l_ac].stbc007,g_stbc_d[l_ac].stbc028, 
       g_stbc_d[l_ac].stbc045,g_stbc_d[l_ac].stbc046,g_stbc_d[l_ac].stbcsite,g_stbc_d[l_ac].stbc026, 
       g_stbc_d[l_ac].stbc025,g_stbc_d[l_ac].stbc027,g_stbc_d[l_ac].stbc008,g_stbc_d[l_ac].stbc033,g_stbc_d[l_ac].stbc058, 
       g_stbc_d[l_ac].stbc029,g_stbc_d[l_ac].stbc030,g_stbc_d[l_ac].stbc009,g_stbc_d[l_ac].stbc010,g_stbc_d[l_ac].stbc011, 
       g_stbc_d[l_ac].stbc012,g_stbc_d[l_ac].stbc037,g_stbc_d[l_ac].stbc038,g_stbc_d[l_ac].stbc041,g_stbc_d[l_ac].stbc013, 
       g_stbc_d[l_ac].stbc014,g_stbc_d[l_ac].stbc015,g_stbc_d[l_ac].stbc016,g_stbc_d[l_ac].stbc017,g_stbc_d[l_ac].stbc018, 
       g_stbc_d[l_ac].stbc019,g_stbc_d[l_ac].stbc020,g_stbc_d[l_ac].stbc021,g_stbc_d[l_ac].stbc022,g_stbc_d[l_ac].stbc023, 
       g_stbc_d[l_ac].stbc024,g_stbc_d[l_ac].stbc034,g_stbc_d[l_ac].stbc057,g_stbc_d[l_ac].stbc035,g_stbc_d[l_ac].stbc036, 
       g_stbc_d[l_ac].stbc039,g_stbc_d[l_ac].stbc042,g_stbc_d[l_ac].stbcstus,g_stbc_d[l_ac].stbc001_desc, 
       g_stbc_d[l_ac].stbcsite_desc,g_stbc_d[l_ac].stbc008_desc,g_stbc_d[l_ac].stbc033_desc,g_stbc_d[l_ac].stbc029_desc, 
       g_stbc_d[l_ac].stbc010_desc,g_stbc_d[l_ac].stbc011_desc,g_stbc_d[l_ac].stbc012_desc,g_stbc_d[l_ac].stbc013_desc 
 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH b_fill_curs:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
  
      #add-point:b_fill段資料填充 name="b_fill.fill"
      SELECT ooef019 INTO l_ooef019
        FROM ooef_t 
        WHERE ooefent = g_enterprise  AND ooef001 = g_site  
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = l_ooef019
      LET g_ref_fields[2] = g_stbc_d[l_ac].stbc014
      CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbc_d[l_ac].stbc014_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbc_d[l_ac].stbc014_desc
      
      SELECT DISTINCT stbddocno INTO g_stbc_d[l_ac].jsdocno
        FROM stbd_t,stbe_t
       WHERE stbdent=stbeent
         AND stbddocno=stbedocno
         AND stbe002=g_stbc_d[l_ac].stbc004
         AND stbe003=g_stbc_d[l_ac].stbc005
         AND stbdstus != 'X'  #lanjj add on 2016-04-05 过滤作废的单号
         
      IF cl_null(g_stbc_d[l_ac].jsdocno) THEN
         SELECT DISTINCT stbddocno INTO g_stbc_d[l_ac].jsdocno
           FROM stbd_t,stev_t
          WHERE stbdent=stevent
            AND stbddocno=stevdocno
            AND stev002=g_stbc_d[l_ac].stbc004
            AND stev003=g_stbc_d[l_ac].stbc005
      END IF
      
      #end add-point
      
      CALL astq530_detail_show()      
 
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code   = 9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
         END IF
         EXIT FOREACH
      END IF
 
      LET l_ac = l_ac + 1
      
   END FOREACH
 
   LET g_error_show = 0
   
 
   
   CALL g_stbc_d.deleteElement(g_stbc_d.getLength())   
 
   
   #將key欄位填到每個page
   FOR l_ac = 1 TO g_stbc_d.getLength()
 
      #add-point:b_fill段key值相關欄位 name="b_fill.keys.fill"
      
      #end add-point
   END FOR
   
   IF g_cnt > g_stbc_d.getLength() THEN
      LET l_ac = g_stbc_d.getLength()
   ELSE
      LET l_ac = g_cnt
   END IF
   LET g_cnt = l_ac
 
   #遮罩相關處理
   FOR l_ac = 1 TO g_stbc_d.getLength()
      LET g_stbc_d_mask_o[l_ac].* =  g_stbc_d[l_ac].*
      CALL astq530_stbc_t_mask()
      LET g_stbc_d_mask_n[l_ac].* =  g_stbc_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = g_cnt
 
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   
   #end add-point
   
   ERROR "" 
 
   LET g_detail_cnt = g_stbc_d.getLength()
   DISPLAY g_detail_idx TO FORMONLY.idx
   DISPLAY g_detail_cnt TO FORMONLY.cnt
   
   CLOSE b_fill_curs
   FREE astq530_pb
   
END FUNCTION
 
{</section>}
 
{<section id="astq530.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq530_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point
   #add-point:show段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="detail_show.before"
   
   #end add-point
   
   
   
   #帶出公用欄位reference值page1
   #應用 a12 樣板自動產生(Version:4)
 
 
 
    
 
   
   #讀入ref值
   #add-point:show段單身reference name="detail_show.reference"
                      

   #end add-point
   
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq530.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astq530_set_entry_b(p_cmd)                                                  
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1         
   #add-point:set_entry_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
   
   #end add-point
 
   IF p_cmd = "a" THEN
      CALL cl_set_comp_entry("",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry_b段欄位控制 name="set_entry_b.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_entry_b段control name="set_entry_b.set_entry_b"
   
   #end add-point                                                                   
                                                                                
END FUNCTION                                                                 
 
{</section>}
 
{<section id="astq530.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astq530_set_no_entry_b(p_cmd)                                               
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point   
   DEFINE p_cmd   LIKE type_t.chr1           
   #add-point:set_no_entry_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_no_entry_b段control name="set_no_entry_b.set_no_entry_b"
   
   #end add-point       
                                                                                
END FUNCTION
 
{</section>}
 
{<section id="astq530.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astq530_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization"
   
   #end add-point
   DEFINE li_idx  LIKE type_t.num10
   DEFINE li_cnt  LIKE type_t.num10
   DEFINE ls_wc   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="default_search.before"
   
   #end add-point  
   
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " stbc001 = '", g_argv[01], "' AND "
   END IF
   
   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = ls_wc, " stbc004 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET ls_wc = ls_wc, " stbc005 = '", g_argv[03], "' AND "
   END IF
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   IF NOT cl_null(ls_wc) THEN
      LET ls_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_wc2 = ls_wc
   ELSE
      LET g_wc2 = " 1=1"
      #預設查詢條件
      LET g_wc2 = cl_qbe_get_default_qryplan()
      IF cl_null(g_wc2) THEN
         LET g_wc2 = " 1=1"
      END IF
   END IF
 
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astq530.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astq530_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
   #判斷是否是同一群組的table
   LET ls_group = "stbc_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      IF ps_table <> 'stbc_t' THEN
         #add-point:delete_b段刪除前 name="delete_b.b_delete"
         
         #end add-point     
         
         DELETE FROM stbc_t
          WHERE stbcent = g_enterprise AND
            stbc001 = ps_keys_bak[1] AND stbc004 = ps_keys_bak[2] AND stbc005 = ps_keys_bak[3]
         
         #add-point:delete_b段刪除中 name="delete_b.m_delete"
         
         #end add-point  
            
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = ":",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = FALSE 
            CALL cl_err()
         END IF
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stbc_d.deleteElement(li_idx) 
      END IF 
 
      
      #add-point:delete_b段刪除後 name="delete_b.a_delete"
      
      #end add-point
      
      RETURN
   END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="astq530.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astq530_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   #add-point:insert_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
   #判斷是否是同一群組的table
   LET ls_group = "stbc_t,"
   #IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      
      #add-point:insert_b段新增前 name="insert_b.b_insert"
      
      #end add-point    
      INSERT INTO stbc_t
                  (stbcent,
                   stbc001,stbc004,stbc005
                   ,stbc002,stbc003,stbc040,stbc006,stbc007,stbc028,stbc045,stbc046,stbcsite,stbc026,stbc025,stbc027,stbc008,stbc033,stbc058,stbc029,stbc030,stbc009,stbc010,stbc011,stbc012,stbc037,stbc038,stbc041,stbc013,stbc014,stbc015,stbc016,stbc017,stbc018,stbc019,stbc020,stbc021,stbc022,stbc023,stbc024,stbc034,stbc057,stbc035,stbc036,stbc039,stbc042,stbcstus) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_stbc_d[l_ac].stbc002,g_stbc_d[l_ac].stbc003,g_stbc_d[l_ac].stbc040,g_stbc_d[l_ac].stbc006, 
                       g_stbc_d[l_ac].stbc007,g_stbc_d[l_ac].stbc028,g_stbc_d[l_ac].stbc045,g_stbc_d[l_ac].stbc046, 
                       g_stbc_d[l_ac].stbcsite,g_stbc_d[l_ac].stbc026,g_stbc_d[l_ac].stbc025,g_stbc_d[l_ac].stbc027, 
                       g_stbc_d[l_ac].stbc008,g_stbc_d[l_ac].stbc033,g_stbc_d[l_ac].stbc058,g_stbc_d[l_ac].stbc029, 
                       g_stbc_d[l_ac].stbc030,g_stbc_d[l_ac].stbc009,g_stbc_d[l_ac].stbc010,g_stbc_d[l_ac].stbc011, 
                       g_stbc_d[l_ac].stbc012,g_stbc_d[l_ac].stbc037,g_stbc_d[l_ac].stbc038,g_stbc_d[l_ac].stbc041, 
                       g_stbc_d[l_ac].stbc013,g_stbc_d[l_ac].stbc014,g_stbc_d[l_ac].stbc015,g_stbc_d[l_ac].stbc016, 
                       g_stbc_d[l_ac].stbc017,g_stbc_d[l_ac].stbc018,g_stbc_d[l_ac].stbc019,g_stbc_d[l_ac].stbc020, 
                       g_stbc_d[l_ac].stbc021,g_stbc_d[l_ac].stbc022,g_stbc_d[l_ac].stbc023,g_stbc_d[l_ac].stbc024, 
                       g_stbc_d[l_ac].stbc034,g_stbc_d[l_ac].stbc057,g_stbc_d[l_ac].stbc035,g_stbc_d[l_ac].stbc036, 
                       g_stbc_d[l_ac].stbc039,g_stbc_d[l_ac].stbc042,g_stbc_d[l_ac].stbcstus)
      #add-point:insert_b段新增中 name="insert_b.m_insert"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      #add-point:insert_b段新增後 name="insert_b.a_insert"
      
      #end add-point    
   #END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="astq530.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astq530_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   #add-point:update_b段define(客製用) name="update_b.define_customerization"
   
   #end add-point
   DEFINE ps_page          STRING
   DEFINE ps_table         STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num10
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="update_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="update_b.pre_function"
   
   #end add-point
   
   #比對新舊值, 判斷key是否有改變
   LET lb_chk = TRUE
   FOR li_idx = 1 TO ps_keys.getLength()
      IF ps_keys[li_idx] <> ps_keys_bak[li_idx] THEN
         LET lb_chk = FALSE
         EXIT FOR
      END IF
   END FOR
   
   #若key無變動, 不需要做處理
   IF lb_chk THEN
      RETURN
   END IF
    
   #若key有變動, 則連動其他table的資料   
   #判斷是否是同一群組的table
   LET ls_group = "stbc_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 AND ps_table <> "stbc_t" THEN
      #add-point:update_b段修改前 name="update_b.b_update"
      
      #end add-point     
      UPDATE stbc_t 
         SET (stbc001,stbc004,stbc005
              ,stbc002,stbc003,stbc040,stbc006,stbc007,stbc028,stbc045,stbc046,stbcsite,stbc026,stbc025,stbc027,stbc008,stbc033,stbc058,stbc029,stbc030,stbc009,stbc010,stbc011,stbc012,stbc037,stbc038,stbc041,stbc013,stbc014,stbc015,stbc016,stbc017,stbc018,stbc019,stbc020,stbc021,stbc022,stbc023,stbc024,stbc034,stbc057,stbc035,stbc036,stbc039,stbc042,stbcstus) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_stbc_d[l_ac].stbc002,g_stbc_d[l_ac].stbc003,g_stbc_d[l_ac].stbc040,g_stbc_d[l_ac].stbc006, 
                  g_stbc_d[l_ac].stbc007,g_stbc_d[l_ac].stbc028,g_stbc_d[l_ac].stbc045,g_stbc_d[l_ac].stbc046, 
                  g_stbc_d[l_ac].stbcsite,g_stbc_d[l_ac].stbc026,g_stbc_d[l_ac].stbc025,g_stbc_d[l_ac].stbc027, 
                  g_stbc_d[l_ac].stbc008,g_stbc_d[l_ac].stbc033,g_stbc_d[l_ac].stbc058,g_stbc_d[l_ac].stbc029, 
                  g_stbc_d[l_ac].stbc030,g_stbc_d[l_ac].stbc009,g_stbc_d[l_ac].stbc010,g_stbc_d[l_ac].stbc011, 
                  g_stbc_d[l_ac].stbc012,g_stbc_d[l_ac].stbc037,g_stbc_d[l_ac].stbc038,g_stbc_d[l_ac].stbc041, 
                  g_stbc_d[l_ac].stbc013,g_stbc_d[l_ac].stbc014,g_stbc_d[l_ac].stbc015,g_stbc_d[l_ac].stbc016, 
                  g_stbc_d[l_ac].stbc017,g_stbc_d[l_ac].stbc018,g_stbc_d[l_ac].stbc019,g_stbc_d[l_ac].stbc020, 
                  g_stbc_d[l_ac].stbc021,g_stbc_d[l_ac].stbc022,g_stbc_d[l_ac].stbc023,g_stbc_d[l_ac].stbc024, 
                  g_stbc_d[l_ac].stbc034,g_stbc_d[l_ac].stbc057,g_stbc_d[l_ac].stbc035,g_stbc_d[l_ac].stbc036, 
                  g_stbc_d[l_ac].stbc039,g_stbc_d[l_ac].stbc042,g_stbc_d[l_ac].stbcstus) 
         WHERE stbcent = g_enterprise AND stbc001 = ps_keys_bak[1] AND stbc004 = ps_keys_bak[2] AND stbc005 = ps_keys_bak[3]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point 
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            CALL s_transaction_end('N','0')
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbc_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
         OTHERWISE
            
      END CASE
      #add-point:update_b段修改後 name="update_b.a_update"
      
      #end add-point 
      RETURN
   END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="astq530.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astq530_lock_b(ps_table)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:lock_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
   
   #先刷新資料
   #CALL astq530_b_fill(g_wc2)
   
   #鎖定整組table
   #LET ls_group = ""
   #僅鎖定自身table
   LET ls_group = "stbc_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astq530_bcl USING g_enterprise,
                                       g_stbc_d[g_detail_idx].stbc001,g_stbc_d[g_detail_idx].stbc004, 
                                           g_stbc_d[g_detail_idx].stbc005
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astq530_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   
   END IF
                                    
 
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="astq530.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astq530_unlock_b(ps_table)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:unlock_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
   
   LET ls_group = ""
   
   #IF ls_group.getIndexOf(ps_table,1) THEN
      CLOSE astq530_bcl
   #END IF
   
 
   
   #add-point:unlock_b段結束前 name="unlock_b.after"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astq530.modify_detail_chk" >}
#+ 單身輸入判定(因應modify_detail)
PRIVATE FUNCTION astq530_modify_detail_chk(ps_record)
   #add-point:modify_detail_chk段define(客製用) name="modify_detail_chk.define_customerization"
   
   #end add-point
   DEFINE ps_record STRING
   DEFINE ls_return STRING
   #add-point:modify_detail_chk段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify_detail_chk.define"
   
   #end add-point
   
   #add-point:modify_detail_chk段開始前 name="modify_detail_chk.before"
   
   #end add-point
   
   #根據sr名稱確定該page第一個欄位的名稱
   CASE ps_record
      WHEN "s_detail1" 
         LET ls_return = "stbc001"
 
      #add-point:modify_detail_chk段自訂page控制 name="modify_detail_chk.page_control"
      
      #end add-point
   END CASE
    
   #add-point:modify_detail_chk段結束前 name="modify_detail_chk.after"
   
   #end add-point
   
   RETURN ls_return
   
END FUNCTION
 
{</section>}
 
{<section id="astq530.show_ownid_msg" >}
#+ 判斷是否顯示只能修改自己權限資料的訊息
#(ver:35) ---add start---
PRIVATE FUNCTION astq530_show_ownid_msg()
   #add-point:show_ownid_msg段define(客製用) name="show_ownid_msg.define_customerization"
   
   #end add-point
   #add-point:show_ownid_msg段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show_ownid_msg.define"
   
   #end add-point
  
 
   
 
END FUNCTION
#(ver:35) --- add end ---
 
{</section>}
 
{<section id="astq530.mask_functions" >}
&include "erp/ast/astq530_mask.4gl"
 
{</section>}
 
{<section id="astq530.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astq530_set_pk_array()
   #add-point:set_pk_array段define name="set_pk_array.define_customerization"
   
   #end add-point
   #add-point:set_pk_array段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_pk_array.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="set_pk_array.before"
   
   #end add-point  
   
   #若l_ac<=0代表沒有資料
   IF l_ac <= 0 THEN
      RETURN
   END IF
   
   CALL g_pk_array.clear()
   LET g_pk_array[1].values = g_stbc_d[l_ac].stbc001
   LET g_pk_array[1].column = 'stbc001'
   LET g_pk_array[2].values = g_stbc_d[l_ac].stbc004
   LET g_pk_array[2].column = 'stbc004'
   LET g_pk_array[3].values = g_stbc_d[l_ac].stbc005
   LET g_pk_array[3].column = 'stbc005'
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astq530.state_change" >}
   
 
{</section>}
 
{<section id="astq530.other_dialog" readonly="Y" >}
 
 
{</section>}
 
{<section id="astq530.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 更新纳入结算否
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量p_stbc037 为1时纳入结算 传入参数变量p_stbc037不为1时不纳入结算
# Date & Author..: 2015/07/27 By liaolong
################################################################################
PRIVATE FUNCTION astq530_stbc037_modify(p_stbc037)
DEFINE p_stbc037 LIKE type_t.chr10
DEFINE l_sqly                 STRING
DEFINE l_sqln                 STRING
DEFINE l_sql                  STRING
     
#   CALL astq530_b_fill(g_wc2)
#   LET l_ac = 1   
#   
#   FOR l_ac = 1 TO g_stbc_d.getLength() 
#       
##      IF  l_ac = 3 THEN 
##         CONTINUE FOR
##      END IF
#      IF g_stbc_d[l_ac].stbcstus = '1' AND g_stbc_d[l_ac].stbc003 = '3'  THEN               
#        
#         LET l_sqly = 
#          " UPDATE stbc_t             ",
#          "    SET stbc037 = 'Y'      " , 
#          "  WHERE stbcent    =       ","'",g_enterprise,"'", 
#          "    AND stbc004    =       ","'",g_stbc_d[l_ac].stbc004,"'",  
#          "    AND stbc005    =       ","'",g_stbc_d[l_ac].stbc005,"'",
#          "    AND stbcstus   = '1'   ",
#          "    AND stbc003    = '3'   ",
#          "    AND                    ", g_stbc037
#       
#         LET l_sqln = 
#          " UPDATE stbc_t             ",
#          "    SET stbc037 = 'N',       " , 
#          "        stbc038 = 'N'       " , 
#          "  WHERE stbcent    =       ","'",g_enterprise,"'", 
#          "    AND stbc004    =       ","'",g_stbc_d[l_ac].stbc004,"'", 
#          "    AND stbcstus   = '1'   ",
#          "    AND stbc003    = '3'   ",                
#          "    AND stbc005    =       ","'",g_stbc_d[l_ac].stbc005,"'",                    
#          "    AND                    ", g_stbc037
#              
#         IF p_stbc037='1'  THEN
#            EXECUTE  IMMEDIATE l_sqly
#            IF SQLCA.sqlcode THEN      
#               CALL cl_err()
#            END IF
#         END IF
#       
#         IF p_stbc037='0'  THEN
#            EXECUTE IMMEDIATE l_sqln
#         END IF 
#      END IF
#      
#   END FOR   
   LET l_ac = l_cnt
   IF g_stbc_d[l_ac].stbcstus = '1' AND g_stbc_d[l_ac].stbc003 = '3'  THEN                  
      LET l_sqly = 
       " UPDATE stbc_t             ",
       "    SET stbc037 = 'Y'      " , 
       "  WHERE stbcent    =       ","'",g_enterprise,"'", 
       "    AND stbc004    =       ","'",g_stbc_d[l_ac].stbc004,"'",  
       "    AND stbc005    =       ","'",g_stbc_d[l_ac].stbc005,"'",
       "    AND stbcstus   = '1'   ",
       "    AND stbc003    = '3'   ",
       "    AND                    ", g_stbc037
    
      LET l_sqln = 
       " UPDATE stbc_t             ",
       "    SET stbc037 = 'N',       " , 
       "        stbc038 = 'N'       " , 
       "  WHERE stbcent    =       ","'",g_enterprise,"'", 
       "    AND stbc004    =       ","'",g_stbc_d[l_ac].stbc004,"'", 
       "    AND stbcstus   = '1'   ",
       "    AND stbc003    = '3'   ",                
       "    AND stbc005    =       ","'",g_stbc_d[l_ac].stbc005,"'",                    
       "    AND                    ", g_stbc037
           
      IF p_stbc037='1'  THEN
         EXECUTE  IMMEDIATE l_sqly
         LET g_stbc_d[l_ac].stbc037 = "Y"
         DISPLAY BY NAME g_stbc_d[l_ac].stbc037
         IF SQLCA.sqlcode THEN      
            CALL cl_err()
         END IF
      END IF
    
      IF p_stbc037='0'  THEN
         LET g_stbc_d[l_ac].stbc037 = "N"
         LET g_stbc_d[l_ac].stbc038 = "N"
         DISPLAY BY NAME g_stbc_d[l_ac].stbc037
         DISPLAY BY NAME g_stbc_d[l_ac].stbc038
         EXECUTE IMMEDIATE l_sqln
      END IF 
   END IF 
   CALL astq530_b_fill(g_wc2)
END FUNCTION

################################################################################
# Descriptions...: 重写uidialog主要目的，dialog前不调用b_fill
# Date & Author..: 2015-10-13 by lanjj
# Modify.........:
################################################################################
PRIVATE FUNCTION astq530_ui_dialog2()
   DEFINE li_idx   LIKE type_t.num10
   DEFINE la_param  RECORD #串查用
             prog   STRING,
             param  DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING
   #add-point:ui_dialog段define
   DEFINE g_wc3     STRING
   #end add-point 
   #add-point:ui_dialog段define(客製用)

   #end add-point
   
   LET g_action_choice = " "  
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()      
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   
   LET g_detail_idx = 1
   
   #add-point:ui_dialog段before dialog 

   #end add-point
   
   WHILE TRUE
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stbc_d.clear()
 
         LET g_wc2 = ' 1=2'
         LET g_action_choice = ""
         CALL astq530_init()
      END IF
   
     # CALL astq530_b_fill(g_wc2)
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_stbc_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               #add-point:ui_dialog段before display 

               #end add-point
               #讓各頁籤能夠同步指到特定資料
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               #add-point:ui_dialog段before display2

               #end add-point
               
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               LET g_temp_idx = l_ac
               DISPLAY g_detail_idx TO FORMONLY.idx
               CALL cl_show_fld_cont() 
               #顯示followup圖示
               #應用 a48 樣板自動產生(Version:2)
   CALL astq530_set_pk_array()
   #add-point:ON ACTION agendum

   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
               #add-point:display array-before row

               #end add-point
         
            #自訂ACTION(detail_show,page_1)
            
               
         END DISPLAY
      
      CONSTRUCT g_wc3 ON stbcsite,stbc001,stbcstus,stbc003,stbc004,stbc040,stbc006,stbc007,
                         stbc026,stbc025,stbc027,stbc008,stbc033,stbc028,stbc058,stbc030,
                         stbc009,stbc010,stbc011,stbc012,stbc037,stbc038,stbc041,stbc013,
                         stbc014,stbc016,stbc024,stbc049,stbc054,stbcud001
 
         FROM h_stbcsite,h_stbc001,h_stbcstus,h_stbc003,h_stbc004,h_stbc040,h_stbc006,h_stbc007,
              h_stbc026,h_stbc025,h_stbc027,h_stbc008,h_stbc033,h_stbc028,h_stbc058,h_stbc030,
              h_stbc009,h_stbc010,h_stbc011,h_stbc012,h_stbc037,h_stbc038,h_stbc041,h_stbc013,
              h_stbc014,h_stbc016,h_stbc024,h_stbc049,h_stbc054,h_stbcud001
                      
         BEFORE CONSTRUCT
         
         ON ACTION controlp INFIELD h_stbcsite
            #add-point:ON ACTION controlp INFIELD stbcsite
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_14()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbcsite',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24() 
            DISPLAY g_qryparam.return1 TO h_stbcsite  #顯示到畫面上
            NEXT FIELD h_stbcsite                     #返回原欄位
         
         ON ACTION controlp INFIELD h_stbc001
            #add-point:ON ACTION controlp INFIELD stbc001
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_23()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stbc001') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbc001',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_23()  
            END IF
            DISPLAY g_qryparam.return1 TO h_stbc001  #顯示到畫面上
            NEXT FIELD h_stbc001                     #返回原欄位
            
         ON ACTION controlp INFIELD h_stbc004
            #add-point:ON ACTION controlp INFIELD stbc004
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stbc003()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO h_stbc004  #顯示到畫面上
            NEXT FIELD h_stbc004                     #返回原欄位
          
         ON ACTION controlp INFIELD h_stbc008
            #add-point:ON ACTION controlp INFIELD stbc008
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #160913-00034#3 -S
            #CALL q_pmaa001()                                       
            LET g_qryparam.arg1 = "('3')"            
            CALL q_pmaa001_1()                           #呼叫開窗
            #160913-00034#3 -E
            DISPLAY g_qryparam.return1 TO h_stbc008  #顯示到畫面上
            NEXT FIELD h_stbc008                     #返回原欄位
         
         ON ACTION controlp INFIELD h_stbc033
            #add-point:ON ACTION controlp INFIELD stbc033
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO h_stbc033  #顯示到畫面上
            NEXT FIELD h_stbc033                     #返回原欄位
         
         ON ACTION controlp INFIELD h_stbc029
            #add-point:ON ACTION controlp INFIELD stbc029
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO h_stbc029  #顯示到畫面上
            NEXT FIELD h_stbc029                     #返回原欄位
         
         ON ACTION controlp INFIELD h_stbc030
            #add-point:ON ACTION controlp INFIELD stbc030
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stce001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO h_stbc030  #顯示到畫面上
            NEXT FIELD h_stbc030                     #返回原欄位
         
         ON ACTION controlp INFIELD h_stbc010
            #add-point:ON ACTION controlp INFIELD stbc010
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO h_stbc010  #顯示到畫面上
            NEXT FIELD h_stbc010                     #返回原欄位 
         
         ON ACTION controlp INFIELD h_stbc011
            #add-point:ON ACTION controlp INFIELD stbc011
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2060'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO h_stbc011  #顯示到畫面上
            NEXT FIELD h_stbc011                     #返回原欄位     
         
         ON ACTION controlp INFIELD h_stbc012
            #add-point:ON ACTION controlp INFIELD stbc012
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO h_stbc012  #顯示到畫面上
            NEXT FIELD h_stbc012                     #返回原欄位
         
         ON ACTION controlp INFIELD h_stbc013
            #add-point:ON ACTION controlp INFIELD stbc013
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO h_stbc013  #顯示到畫面上
            NEXT FIELD h_stbc013                     #返回原欄位
         
         ON ACTION controlp INFIELD h_stbc014
            #add-point:ON ACTION controlp INFIELD stbc014
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
#            CALL q_oodb002()                           #呼叫開窗
            CALL q_oodb002_3()  
            DISPLAY g_qryparam.return1 TO h_stbc014  #顯示到畫面上
            NEXT FIELD h_stbc014                     #返回原欄位
          
          
         ON ACTION controlp INFIELD h_stbcud001
            #add-point:ON ACTION controlp INFIELD stbddocno
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " stbd000 = '1' AND stbdstus = 'Y' "
            CALL q_stbddocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO h_stbcud001  #顯示到畫面上
            NEXT FIELD h_stbcud001                     #返回原欄位
         
         #add by geza 20160304(S)
         ON ACTION controlp INFIELD h_stbc025
            #add-point:ON ACTION controlp INFIELD stbddocno
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1=cl_get_para(g_enterprise,g_site,'E-CIR-0001')
            CALL q_rtax001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO h_stbc025  #顯示到畫面上
            NEXT FIELD h_stbc025                     #返回原欄位
            
         ON ACTION controlp INFIELD h_stbc026
            #add-point:ON ACTION controlp INFIELD stbddocno
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE            
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO h_stbc026  #顯示到畫面上
            NEXT FIELD h_stbc026                     #返回原欄位   
         #add by geza 20160304(E)
         
#         #旧值写入
         AFTER FIELD h_stbcsite CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbcsite
         AFTER FIELD h_stbc001 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc001 
         AFTER FIELD h_stbcstus CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbcstus
         AFTER FIELD h_stbc003 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc003 
         AFTER FIELD h_stbc004 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc004 
         AFTER FIELD h_stbc040 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc040 
         AFTER FIELD h_stbc006 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc006 
         AFTER FIELD h_stbc007 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc007 
         AFTER FIELD h_stbc026 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc026 
         AFTER FIELD h_stbc025 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc025 
         AFTER FIELD h_stbc027 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc027 
         AFTER FIELD h_stbc008 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc008 
         AFTER FIELD h_stbc033 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc033 
         AFTER FIELD h_stbc028 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc028 
         AFTER FIELD h_stbc058 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc058 
         AFTER FIELD h_stbc030 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc030 
         AFTER FIELD h_stbc009 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc009 
         AFTER FIELD h_stbc010 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc010 
         AFTER FIELD h_stbc011 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc011 
         AFTER FIELD h_stbc012 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc012 
         AFTER FIELD h_stbc037 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc037 
         AFTER FIELD h_stbc038 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc038 
         AFTER FIELD h_stbc041 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc041 
         AFTER FIELD h_stbc013 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc013 
         AFTER FIELD h_stbc014 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc014 
         AFTER FIELD h_stbc016 CALL FGL_DIALOG_GETBUFFER() RETURNING head.stbc016 
 
      END CONSTRUCT
       
      INPUT l_bdate,l_edate FROM l_bdate,l_edate
         ATTRIBUTE(WITHOUT DEFAULTS)

#         AFTER FIELD bdate
#             IF NOT cl_null(bdate) THEN
#                      IF bdate > edate THEN
#                         INITIALIZE g_errparam TO NULL 
#                         LET g_errparam.extend = "" 
#                         LET g_errparam.code   = 'amr-00072' # 起始时间不可大于截止时间
#                         LET g_errparam.popup  = TRUE 
#                         CALL cl_err()
#                         NEXT FIELD bdate
#                      END IF
#                   END IF
          AFTER FIELD l_edate
             IF NOT cl_null(l_edate) THEN
                IF l_edate < l_bdate THEN
                   INITIALIZE g_errparam TO NULL 
                   LET g_errparam.extend = "" 
                   LET g_errparam.code   = 'amm-00094' # 结束时间必须大于等于开始时间
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()
                   NEXT FIELD l_edate
                   END IF
             END IF
         
         AFTER INPUT
            IF INT_FLAG THEN
#            	LET INT_FLAG=0
#               EXIT INPUT
            END IF
      END INPUT       
         #add-point:ui_dialog段自定義display array

         #end add-point
    
         BEFORE DIALOG
            IF g_temp_idx > 0 THEN
               LET l_ac = g_temp_idx
               CALL DIALOG.setCurrentRow("s_detail1",l_ac)
               LET g_temp_idx = 1
            END IF
            LET g_curr_diag = ui.DIALOG.getCurrent()         
            CALL DIALOG.setSelectionMode("s_detail1", 1)
 
            #add-point:ui_dialog段before
            DISPLAY head.stbcsite, 
                    head.stbc001, 
                    head.stbcstus,
                    head.stbc003, 
                    head.stbc004, 
                    head.stbc040, 
                    head.stbc006, 
                    head.stbc007, 
                    head.stbc026, 
                    head.stbc025, 
                    head.stbc027, 
                    head.stbc008, 
                    head.stbc033, 
                    head.stbc028, 
                    head.stbc058, 
                    head.stbc030, 
                    head.stbc009, 
                    head.stbc010, 
                    head.stbc011, 
                    head.stbc012, 
                    head.stbc037, 
                    head.stbc038, 
                    head.stbc041, 
                    head.stbc013, 
                    head.stbc014, 
                    head.stbc016
                 TO h_stbcsite,
                    h_stbc001,
                    h_stbcstus,
                    h_stbc003,
                    h_stbc004,
                    h_stbc040,
                    h_stbc006,
                    h_stbc007,
                    h_stbc026,
                    h_stbc025,
                    h_stbc027,
                    h_stbc008,
                    h_stbc033,
                    h_stbc028,
                    h_stbc058,
                    h_stbc030,
                    h_stbc009,
                    h_stbc010,
                    h_stbc011,
                    h_stbc012,
                    h_stbc037,
                    h_stbc038,
                    h_stbc041,
                    h_stbc013,
                    h_stbc014,
                    h_stbc016

            NEXT FIELD CURRENT
      
         
         #應用 a43 樣板自動產生(Version:2)
         ON ACTION change
            LET g_action_choice="change"
            IF cl_auth_chk_act("change") THEN
               
               #add-point:ON ACTION change
               LET g_aw = g_curr_diag.getCurrentItem()               
               LET l_cnt = g_stbc_d.getLength()
               IF l_cnt > 0 THEN                   
                  CALL astq530_modify()
               ELSE   
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00368'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_action_choice= ""
                  EXIT DIALOG
               END IF
               #END add-point
               
            END IF
 
 
 
         #應用 a43 樣板自動產生(Version:2)
         ON ACTION set_out2
            LET g_action_choice="set_out2"
            IF cl_auth_chk_act("set_out2") THEN
               
               #add-point:ON ACTION set_out2
                #add by liaolong     150629-00016 15/08/06 --Begin--
               LET p_stbc037='0'
               FOR l_cnt = 1 TO g_stbc_d.getLength()
                  IF DIALOG.isRowSelected("s_detail1", l_cnt) THEN
                     IF l_cnt > 0 THEN                   
                        CALL astq530_stbc037_modify(p_stbc037)
                     ELSE   
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00368'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET g_action_choice= ""
                        EXIT DIALOG
                     END IF
                  END IF
               END FOR
               #add by liaolong     150629-00016 15/08/06 --End--
               #END add-point
               
            END IF
 
 
 
         #應用 a43 樣板自動產生(Version:2)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output

               #END add-point
               
            END IF
 
 
 
         #應用 a43 樣板自動產生(Version:2)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               #CALL astq530_query()
               #add-point:ON ACTION query

               #END add-point
               #應用 a59 樣板自動產生(Version:2)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
            END IF
 
 
 
         #應用 a43 樣板自動產生(Version:2)
         ON ACTION datainfo
            LET g_action_choice="datainfo"
            IF cl_auth_chk_act("datainfo") THEN
               
               #add-point:ON ACTION datainfo

               #END add-point
               
            END IF
 
 
 
         #應用 a43 樣板自動產生(Version:2)
         ON ACTION set_in2
            LET g_action_choice="set_in2"
            IF cl_auth_chk_act("set_in2") THEN
               
               #add-point:ON ACTION set_in2
               #add by liaolong     150629-00016 15/08/06 --Begin--
               LET p_stbc037='1'
               FOR l_cnt = 1 TO g_stbc_d.getLength()
                  IF DIALOG.isRowSelected("s_detail1", l_cnt) THEN
                     IF l_cnt > 0 THEN                   
                        CALL astq530_stbc037_modify(p_stbc037)
                     ELSE   
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00368'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET g_action_choice= ""
                        EXIT DIALOG
                     END IF
                  END IF
               END FOR
               #add by liaolong     150629-00016 15/08/06 --End--

               #END add-point
               
            END IF
 
 
 
      
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               LET g_export_node[1] = base.typeInfo.create(g_stbc_d)
               LET g_export_id[1]   = "s_detail1"
 
               #add-point:ON ACTION exporttoexcel

               #END add-point
               CALL cl_export_to_excel_getpage()
               CALL cl_export_to_excel()
            END IF
            
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice="exit"
            CANCEL DIALOG
      
         ON ACTION exit
            LET g_action_choice="exit"
            CANCEL DIALOG
            
         
         
         #應用 a46 樣板自動產生(Version:2)
         #新增相關文件
         ON ACTION related_document
            CALL astq530_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document

               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astq530_set_pk_array()
            #add-point:ON ACTION agendum

            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astq530_set_pk_array()
            #add-point:ON ACTION followup

            #END add-point
            CALL cl_user_overview_follow('')
 
         ON ACTION accept
            ACCEPT DIALOG
          
         ON ACTION cancel
            CLEAR FORM
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
      
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前
         RETURN
         #end add-point
         EXIT WHILE
      END IF
      
      CALL astq530_b_fill(g_wc3)
   END WHILE
 
   CALL cl_set_act_visible("accept,cancel", TRUE)
 
END FUNCTION

 
{</section>}
 
