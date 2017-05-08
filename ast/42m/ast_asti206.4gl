#該程式未解開Section, 採用最新樣板產出!
{<section id="asti206.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0008(2014-11-13 17:44:48), PR版次:0008(1900-01-01 00:00:00)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000127
#+ Filename...: asti206
#+ Description: 結算會計期設定作業
#+ Creator....: 03247(2014-06-05 15:11:52)
#+ Modifier...: 03247 -SD/PR- 00000
 
{</section>}
 
{<section id="asti206.global" >}
#應用 i02 樣板自動產生(Version:38)
#add-point:填寫註解說明 name="global.memo"
#160318-00025#46 2016/04/26 by 07959     將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
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
PRIVATE TYPE type_g_stau_d RECORD
       stausite LIKE stau_t.stausite, 
   stausite_desc LIKE type_t.chr500, 
   stau001 LIKE stau_t.stau001, 
   stau001_desc LIKE type_t.chr500, 
   stau002 LIKE stau_t.stau002, 
   stau003 LIKE stau_t.stau003, 
   stau004 LIKE stau_t.stau004
       END RECORD
PRIVATE TYPE type_g_stau2_d RECORD
       stausite LIKE stau_t.stausite, 
   stau001 LIKE stau_t.stau001, 
   stauownid LIKE stau_t.stauownid, 
   stauownid_desc LIKE type_t.chr500, 
   stauowndp LIKE stau_t.stauowndp, 
   stauowndp_desc LIKE type_t.chr500, 
   staucrtid LIKE stau_t.staucrtid, 
   staucrtid_desc LIKE type_t.chr500, 
   staucrtdp LIKE stau_t.staucrtdp, 
   staucrtdp_desc LIKE type_t.chr500, 
   staucrtdt DATETIME YEAR TO SECOND, 
   staumodid LIKE stau_t.staumodid, 
   staumodid_desc LIKE type_t.chr500, 
   staumoddt DATETIME YEAR TO SECOND
       END RECORD
 
 
 
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"

#end add-point
 
#模組變數(Module Variables)
DEFINE g_stau_d          DYNAMIC ARRAY OF type_g_stau_d #單身變數
DEFINE g_stau_d_t        type_g_stau_d                  #單身備份
DEFINE g_stau_d_o        type_g_stau_d                  #單身備份
DEFINE g_stau_d_mask_o   DYNAMIC ARRAY OF type_g_stau_d #單身變數
DEFINE g_stau_d_mask_n   DYNAMIC ARRAY OF type_g_stau_d #單身變數
DEFINE g_stau2_d   DYNAMIC ARRAY OF type_g_stau2_d
DEFINE g_stau2_d_t type_g_stau2_d
DEFINE g_stau2_d_o type_g_stau2_d
DEFINE g_stau2_d_mask_o DYNAMIC ARRAY OF type_g_stau2_d
DEFINE g_stau2_d_mask_n DYNAMIC ARRAY OF type_g_stau2_d
 
      
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
 
{<section id="asti206.main" >}
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
   
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
 
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = "SELECT stausite,stau001,stau002,stau003,stau004,stausite,stau001,stauownid,stauowndp, 
       staucrtid,staucrtdp,staucrtdt,staumodid,staumoddt FROM stau_t WHERE stauent=? AND stausite=?  
       AND stau001=? FOR UPDATE"
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asti206_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_asti206 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL asti206_init()   
 
      #進入選單 Menu (="N")
      CALL asti206_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_asti206
      
   END IF 
   
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="asti206.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION asti206_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5      #150308-00001#5  By benson 150309
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   
      CALL cl_set_combo_scc('stau002','6067') 
 
   LET g_error_show = 1
   
   #add-point:畫面資料初始化 name="init.init"
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   #end add-point
   
   CALL asti206_default_search()
   
END FUNCTION
 
{</section>}
 
{<section id="asti206.ui_dialog" >}
#+ 功能選單 
PRIVATE FUNCTION asti206_ui_dialog()
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
         CALL g_stau_d.clear()
         CALL g_stau2_d.clear()
 
         LET g_wc2 = ' 1=2'
         LET g_action_choice = ""
         CALL asti206_init()
      END IF
   
      CALL asti206_b_fill(g_wc2)
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_stau_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
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
               LET g_data_owner = g_stau2_d[g_detail_idx].stauownid   #(ver:35)
               LET g_data_dept = g_stau2_d[g_detail_idx].stauowndp  #(ver:35)
               CALL cl_show_fld_cont() 
               #顯示followup圖示
               #應用 a48 樣板自動產生(Version:3)
   CALL asti206_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
               #add-point:display array-before row name="ui_dialog.before_row"
               
               #end add-point
         
            #自訂ACTION(detail_show,page_1)
            
               
         END DISPLAY
      
         DISPLAY ARRAY g_stau2_d TO s_detail2.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               #add-point:ui_dialog段before display  name="ui_dialog.body2.before_display"
               
               #end add-point
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               #add-point:ui_dialog段before display2 name="ui_dialog.body2.before_display2"
               
               #end add-point
         
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx
               LET g_temp_idx = l_ac
               DISPLAY g_detail_idx TO FORMONLY.idx
               CALL cl_show_fld_cont() 
               #顯示followup圖示
               #應用 a48 樣板自動產生(Version:3)
   CALL asti206_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
               #add-point:display array-before row name="ui_dialog.before_row2"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_2)
            
               
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
            CALL DIALOG.setSelectionMode("s_detail2", 1)
 
            #add-point:ui_dialog段before name="ui_dialog.b_dialog"
            
            #end add-point
            NEXT FIELD CURRENT
      
         
         #應用 a67 樣板自動產生(Version:1)
         ON ACTION delete
            LET g_action_choice="delete"
            CALL asti206_show_ownid_msg()
            #因為不呼叫cl_auth_chk_act()，所以需另外紀錄log，
            #但紀錄log時需紀錄status，與鴻傑討論後，決議先一律紀錄成功
            CALL cl_log_act(g_action_choice,TRUE)
            CALL asti206_delete()
            #add-point:ON ACTION delete name="menu.delete"
            
            #END add-point
            
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL asti206_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
 
 
 
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
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
      
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               LET g_export_node[1] = base.typeInfo.create(g_stau_d)
               LET g_export_id[1]   = "s_detail1"
               LET g_export_node[2] = base.typeInfo.create(g_stau2_d)
               LET g_export_id[2]   = "s_detail2"
 
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
            CALL asti206_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL asti206_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL asti206_set_pk_array()
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
 
{<section id="asti206.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION asti206_query()
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
   CALL g_stau_d.clear()
   
   LET g_qryparam.state = "c"
   
   #wc備份
   LET ls_wc = g_wc2
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      CONSTRUCT g_wc2 ON stausite,stau001,stau002,stau003,stau004,stauownid,stauowndp,staucrtid,staucrtdp, 
          staucrtdt,staumodid,staumoddt 
 
         FROM s_detail1[1].stausite,s_detail1[1].stau001,s_detail1[1].stau002,s_detail1[1].stau003,s_detail1[1].stau004, 
             s_detail2[1].stauownid,s_detail2[1].stauowndp,s_detail2[1].staucrtid,s_detail2[1].staucrtdp, 
             s_detail2[1].staucrtdt,s_detail2[1].staumodid,s_detail2[1].staumoddt 
      
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<staucrtdt>>----
         AFTER FIELD staucrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<staumoddt>>----
         AFTER FIELD staumoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<staucnfdt>>----
         
         #----<<staupstdt>>----
 
 
 
      
                  #Ctrlp:construct.c.page1.stausite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stausite
            #add-point:ON ACTION controlp INFIELD stausite name="construct.c.page1.stausite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.where = " ooef212 = 'Y'"
#            CALL q_ooef001()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stausite',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stausite  #顯示到畫面上
            NEXT FIELD stausite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stausite
            #add-point:BEFORE FIELD stausite name="query.b.page1.stausite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stausite
            
            #add-point:AFTER FIELD stausite name="query.a.page1.stausite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stau001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stau001
            #add-point:ON ACTION controlp INFIELD stau001 name="construct.c.page1.stau001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '6072'
            CALL q_gzcb002_01()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stau001  #顯示到畫面上
            NEXT FIELD stau001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stau001
            #add-point:BEFORE FIELD stau001 name="query.b.page1.stau001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stau001
            
            #add-point:AFTER FIELD stau001 name="query.a.page1.stau001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stau002
            #add-point:BEFORE FIELD stau002 name="query.b.page1.stau002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stau002
            
            #add-point:AFTER FIELD stau002 name="query.a.page1.stau002"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stau002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stau002
            #add-point:ON ACTION controlp INFIELD stau002 name="query.c.page1.stau002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stau003
            #add-point:BEFORE FIELD stau003 name="query.b.page1.stau003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stau003
            
            #add-point:AFTER FIELD stau003 name="query.a.page1.stau003"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stau003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stau003
            #add-point:ON ACTION controlp INFIELD stau003 name="query.c.page1.stau003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stau004
            #add-point:BEFORE FIELD stau004 name="query.b.page1.stau004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stau004
            
            #add-point:AFTER FIELD stau004 name="query.a.page1.stau004"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.stau004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stau004
            #add-point:ON ACTION controlp INFIELD stau004 name="query.c.page1.stau004"
            
            #END add-point
 
 
  
         
                  #Ctrlp:construct.c.page2.stauownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stauownid
            #add-point:ON ACTION controlp INFIELD stauownid name="construct.c.page2.stauownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stauownid  #顯示到畫面上
            NEXT FIELD stauownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stauownid
            #add-point:BEFORE FIELD stauownid name="query.b.page2.stauownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stauownid
            
            #add-point:AFTER FIELD stauownid name="query.a.page2.stauownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stauowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stauowndp
            #add-point:ON ACTION controlp INFIELD stauowndp name="construct.c.page2.stauowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stauowndp  #顯示到畫面上
            NEXT FIELD stauowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stauowndp
            #add-point:BEFORE FIELD stauowndp name="query.b.page2.stauowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stauowndp
            
            #add-point:AFTER FIELD stauowndp name="query.a.page2.stauowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.staucrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD staucrtid
            #add-point:ON ACTION controlp INFIELD staucrtid name="construct.c.page2.staucrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO staucrtid  #顯示到畫面上
            NEXT FIELD staucrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD staucrtid
            #add-point:BEFORE FIELD staucrtid name="query.b.page2.staucrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD staucrtid
            
            #add-point:AFTER FIELD staucrtid name="query.a.page2.staucrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.staucrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD staucrtdp
            #add-point:ON ACTION controlp INFIELD staucrtdp name="construct.c.page2.staucrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO staucrtdp  #顯示到畫面上
            NEXT FIELD staucrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD staucrtdp
            #add-point:BEFORE FIELD staucrtdp name="query.b.page2.staucrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD staucrtdp
            
            #add-point:AFTER FIELD staucrtdp name="query.a.page2.staucrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD staucrtdt
            #add-point:BEFORE FIELD staucrtdt name="query.b.page2.staucrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.staumodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD staumodid
            #add-point:ON ACTION controlp INFIELD staumodid name="construct.c.page2.staumodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO staumodid  #顯示到畫面上
            NEXT FIELD staumodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD staumodid
            #add-point:BEFORE FIELD staumodid name="query.b.page2.staumodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD staumodid
            
            #add-point:AFTER FIELD staumodid name="query.a.page2.staumodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD staumoddt
            #add-point:BEFORE FIELD staumoddt name="query.b.page2.staumoddt"
            
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
    
   CALL asti206_b_fill(g_wc2)
   LET g_data_owner = g_stau2_d[g_detail_idx].stauownid   #(ver:35)
   LET g_data_dept = g_stau2_d[g_detail_idx].stauowndp   #(ver:35)
 
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
 
{<section id="asti206.insert" >}
#+ 資料新增
PRIVATE FUNCTION asti206_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point                
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #add-point:單身新增前 name="insert.b_insert"
   
   #end add-point
   
   LET g_insert = 'Y'
   CALL asti206_modify()
            
   #add-point:單身新增後 name="insert.a_insert"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="asti206.modify" >}
#+ 資料修改
PRIVATE FUNCTION asti206_modify()
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
      INPUT ARRAY g_stau_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_detail_cnt,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stau_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asti206_b_fill(g_wc2)
            LET g_detail_cnt = g_stau_d.getLength()
         
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
            DISPLAY g_stau_d.getLength() TO FORMONLY.cnt
         
            CALL s_transaction_begin()
            LET g_detail_cnt = g_stau_d.getLength()
            
            IF g_detail_cnt >= l_ac 
               AND g_stau_d[l_ac].stausite IS NOT NULL
               AND g_stau_d[l_ac].stau001 IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stau_d_t.* = g_stau_d[l_ac].*  #BACKUP
               LET g_stau_d_o.* = g_stau_d[l_ac].*  #BACKUP
               IF NOT asti206_lock_b("stau_t") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asti206_bcl INTO g_stau_d[l_ac].stausite,g_stau_d[l_ac].stau001,g_stau_d[l_ac].stau002, 
                      g_stau_d[l_ac].stau003,g_stau_d[l_ac].stau004,g_stau2_d[l_ac].stausite,g_stau2_d[l_ac].stau001, 
                      g_stau2_d[l_ac].stauownid,g_stau2_d[l_ac].stauowndp,g_stau2_d[l_ac].staucrtid, 
                      g_stau2_d[l_ac].staucrtdp,g_stau2_d[l_ac].staucrtdt,g_stau2_d[l_ac].staumodid, 
                      g_stau2_d[l_ac].staumoddt
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stau_d_t.stausite,":",SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stau_d_mask_o[l_ac].* =  g_stau_d[l_ac].*
                  CALL asti206_stau_t_mask()
                  LET g_stau_d_mask_n[l_ac].* =  g_stau_d[l_ac].*
                  
                  CALL asti206_detail_show()
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            CALL asti206_set_entry_b(l_cmd)
            CALL asti206_set_no_entry_b(l_cmd)
            #add-point:modify段before row name="input.body.before_row"
            
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
            INITIALIZE g_stau_d_t.* TO NULL
            INITIALIZE g_stau_d_o.* TO NULL
            INITIALIZE g_stau_d[l_ac].* TO NULL 
            #公用欄位給值(單身)
            #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stau2_d[l_ac].stauownid = g_user
      LET g_stau2_d[l_ac].stauowndp = g_dept
      LET g_stau2_d[l_ac].staucrtid = g_user
      LET g_stau2_d[l_ac].staucrtdp = g_dept 
      LET g_stau2_d[l_ac].staucrtdt = cl_get_current()
      LET g_stau2_d[l_ac].staumodid = g_user
      LET g_stau2_d[l_ac].staumoddt = cl_get_current()
 
 
 
            #自定義預設值(單身2)
                  LET g_stau_d[l_ac].stau002 = "1"
 
            #add-point:modify段before備份 name="input.body.before_bak"
            
            #end add-point
            LET g_stau_d_t.* = g_stau_d[l_ac].*     #新輸入資料
            LET g_stau_d_o.* = g_stau_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stau_d[li_reproduce_target].* = g_stau_d[li_reproduce].*
               LET g_stau2_d[li_reproduce_target].* = g_stau2_d[li_reproduce].*
 
               LET g_stau_d[g_stau_d.getLength()].stausite = NULL
               LET g_stau_d[g_stau_d.getLength()].stau001 = NULL
 
            END IF
            
 
 
            CALL asti206_set_entry_b(l_cmd)
            CALL asti206_set_no_entry_b(l_cmd)
            #add-point:modify段before insert name="input.body.before_insert"
            LET g_stau_d[l_ac].stau003 = g_today
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
            SELECT COUNT(1) INTO l_count FROM stau_t 
             WHERE stauent = g_enterprise AND stausite = g_stau_d[l_ac].stausite
                                       AND stau001 = g_stau_d[l_ac].stau001
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stau_d[g_detail_idx].stausite
               LET gs_keys[2] = g_stau_d[g_detail_idx].stau001
               CALL asti206_insert_b('stau_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_stau_d[l_ac].* TO NULL
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
               LET g_errparam.extend = "stau_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asti206_b_fill(g_wc2)
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               ##ERROR 'INSERT O.K'
               LET g_detail_cnt = g_detail_cnt + 1
               
               LET g_wc2 = g_wc2, " OR (stausite = '", g_stau_d[l_ac].stausite, "' "
                                  ," AND stau001 = '", g_stau_d[l_ac].stau001, "' "
 
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
               
               DELETE FROM stau_t
                WHERE stauent = g_enterprise AND 
                      stausite = g_stau_d_t.stausite
                      AND stau001 = g_stau_d_t.stau001
 
                      
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point  
                      
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stau_t:",SQLERRMESSAGE 
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
                  CALL asti206_set_pk_array()
                  LET g_log1 = util.JSON.stringify(g_stau_d[l_ac])   #(ver:38)
                  IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:38)
                     CALL s_transaction_end('N','0')
                  ELSE
                     CALL s_transaction_end('Y','0')
                  END IF
               END IF 
               CLOSE asti206_bcl
               #add-point:單身關閉bcl name="input.body.close"
               
               #end add-point
               LET l_count = g_stau_d.getLength()
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stau_d_t.stausite
               LET gs_keys[2] = g_stau_d_t.stau001
 
               #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL asti206_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
            END IF 
              
         AFTER DELETE 
            IF l_cmd <> 'd' THEN
               #add-point:單身刪除後2 name="input.body.after_delete"
               
               #end add-point
                              CALL asti206_delete_b('stau_t',gs_keys,"'1'")
            END IF
            #如果是最後一筆
            IF l_ac = (g_stau_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
            #add-point:單身刪除後3 name="input.body.after_delete3"
            
            #end add-point
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stausite
            
            #add-point:AFTER FIELD stausite name="input.a.page1.stausite"
            IF NOT cl_null(g_stau_d[l_ac].stausite) THEN 
#此段落由子樣板a19產生
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stau_d[l_ac].stausite
#               LET g_chkparam.arg2 = 'A'
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooef001_31") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
               ELSE
                  #檢查失敗時後續處理
                  LET g_stau_d[l_ac].stausite = g_stau_d_t.stausite
                  LET g_stau_d[l_ac].stausite_desc = ""
                  DISPLAY BY NAME g_stau_d[l_ac].stausite,g_stau_d[l_ac].stausite_desc
                  NEXT FIELD CURRENT
               END IF
            

            END IF
            
            #此段落由子樣板a05產生
            IF  g_stau_d[g_detail_idx].stausite IS NOT NULL AND g_stau_d[g_detail_idx].stau001 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stau_d[g_detail_idx].stausite != g_stau_d_t.stausite)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stau_t WHERE "||"stauent = '" ||g_enterprise|| "' AND "||"stausite = '"||g_stau_d[g_detail_idx].stausite ||"' AND "||"stau001 = '"||g_stau_d[g_detail_idx].stau001 ||"'",'std-00004',0) THEN
                     LET g_stau_d[g_detail_idx].stausite = g_stau_d_t.stausite
                     LET g_stau_d[g_detail_idx].stausite_desc = ""                    
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stau_d[l_ac].stausite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stau_d[l_ac].stausite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stau_d[l_ac].stausite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stausite
            #add-point:BEFORE FIELD stausite name="input.b.page1.stausite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stausite
            #add-point:ON CHANGE stausite name="input.g.page1.stausite"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stau001
            
            #add-point:AFTER FIELD stau001 name="input.a.page1.stau001"
            IF NOT cl_null(g_stau_d[l_ac].stau001) THEN 
#此段落由子樣板a19產生
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = '6072'
               LET g_chkparam.arg2 = g_stau_d[l_ac].stau001
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_gzcb002") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
               ELSE
                  #檢查失敗時後續處理
                  LET g_stau_d[l_ac].stau001 = g_stau_d_t.stau001
                  LET g_stau_d[l_ac].stau001_desc = ""
                  DISPLAY BY NAME g_stau_d[l_ac].stau001,g_stau_d[l_ac].stau001_desc
                  NEXT FIELD CURRENT
               END IF
            

            END IF 
            
            #此段落由子樣板a05產生
            IF  g_stau_d[g_detail_idx].stausite IS NOT NULL AND g_stau_d[g_detail_idx].stau001 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stau_d[g_detail_idx].stau001 != g_stau_d_t.stau001)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stau_t WHERE "||"stauent = '" ||g_enterprise|| "' AND "||"stausite = '"||g_stau_d[g_detail_idx].stausite ||"' AND "||"stau001 = '"||g_stau_d[g_detail_idx].stau001 ||"'",'std-00004',0) THEN
                     LET g_stau_d[g_detail_idx].stau001 = g_stau_d_t.stau001
                     LET g_stau_d[g_detail_idx].stau001_desc = ""                     
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = '6072'
            LET g_ref_fields[2] = g_stau_d[l_ac].stau001
            CALL ap_ref_array2(g_ref_fields,"SELECT gzcbl004 FROM gzcbl_t WHERE gzcbl001=? AND gzcbl002=? AND gzcbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stau_d[l_ac].stau001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stau_d[l_ac].stau001_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stau001
            #add-point:BEFORE FIELD stau001 name="input.b.page1.stau001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stau001
            #add-point:ON CHANGE stau001 name="input.g.page1.stau001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stau002
            #add-point:BEFORE FIELD stau002 name="input.b.page1.stau002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stau002
            
            #add-point:AFTER FIELD stau002 name="input.a.page1.stau002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stau002
            #add-point:ON CHANGE stau002 name="input.g.page1.stau002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stau003
            #add-point:BEFORE FIELD stau003 name="input.b.page1.stau003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stau003
            
            #add-point:AFTER FIELD stau003 name="input.a.page1.stau003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stau003
            #add-point:ON CHANGE stau003 name="input.g.page1.stau003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stau004
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stau_d[l_ac].stau004,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD stau004
            END IF 
 
 
 
            #add-point:AFTER FIELD stau004 name="input.a.page1.stau004"
            IF NOT cl_null(g_stau_d[l_ac].stau004) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stau004
            #add-point:BEFORE FIELD stau004 name="input.b.page1.stau004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stau004
            #add-point:ON CHANGE stau004 name="input.g.page1.stau004"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stausite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stausite
            #add-point:ON ACTION controlp INFIELD stausite name="input.c.page1.stausite"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stau_d[l_ac].stausite             #給予default值
            LET g_qryparam.default2 = g_stau_d[l_ac].stausite_desc #說明(簡稱)
            #給予arg
            LET g_qryparam.where = " ooef212 = 'Y'"

            
            CALL q_ooef001()                                #呼叫開窗

            LET g_stau_d[l_ac].stausite = g_qryparam.return1              
            LET g_stau_d[l_ac].stausite_desc = g_qryparam.return2 
            DISPLAY g_stau_d[l_ac].stausite TO stausite              #
            DISPLAY g_stau_d[l_ac].stausite_desc TO stausite_desc #說明(簡稱)
            NEXT FIELD stausite                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stau001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stau001
            #add-point:ON ACTION controlp INFIELD stau001 name="input.c.page1.stau001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stau_d[l_ac].stau001             #給予default值
            LET g_qryparam.default2 = g_stau_d[l_ac].stau001_desc  #程式名稱
            #給予arg
            LET g_qryparam.arg1 = "6072" #

            
            CALL q_gzcb002_01()                                #呼叫開窗

            LET g_stau_d[l_ac].stau001 = g_qryparam.return1              
            LET g_stau_d[l_ac].stau001_desc = g_qryparam.return2 
            DISPLAY g_stau_d[l_ac].stau001 TO stau001              #
            DISPLAY g_stau_d[l_ac].stau001_desc TO stau001_desc #程式名稱
            NEXT FIELD stau001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stau002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stau002
            #add-point:ON ACTION controlp INFIELD stau002 name="input.c.page1.stau002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stau003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stau003
            #add-point:ON ACTION controlp INFIELD stau003 name="input.c.page1.stau003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stau004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stau004
            #add-point:ON ACTION controlp INFIELD stau004 name="input.c.page1.stau004"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               CLOSE asti206_bcl
               CALL s_transaction_end('N','0')
               LET INT_FLAG = 0
               LET g_stau_d[l_ac].* = g_stau_d_t.*
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
               LET g_errparam.extend = g_stau_d[l_ac].stausite 
               LET g_errparam.code   = -263 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               LET g_stau_d[l_ac].* = g_stau_d_t.*
            ELSE
               #寫入修改者/修改日期資訊(單身)
               LET g_stau2_d[l_ac].staumodid = g_user 
LET g_stau2_d[l_ac].staumoddt = cl_get_current()
LET g_stau2_d[l_ac].staumodid_desc = cl_get_username(g_stau2_d[l_ac].staumodid)
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL asti206_stau_t_mask_restore('restore_mask_o')
 
               UPDATE stau_t SET (stausite,stau001,stau002,stau003,stau004,stauownid,stauowndp,staucrtid, 
                   staucrtdp,staucrtdt,staumodid,staumoddt) = (g_stau_d[l_ac].stausite,g_stau_d[l_ac].stau001, 
                   g_stau_d[l_ac].stau002,g_stau_d[l_ac].stau003,g_stau_d[l_ac].stau004,g_stau2_d[l_ac].stauownid, 
                   g_stau2_d[l_ac].stauowndp,g_stau2_d[l_ac].staucrtid,g_stau2_d[l_ac].staucrtdp,g_stau2_d[l_ac].staucrtdt, 
                   g_stau2_d[l_ac].staumodid,g_stau2_d[l_ac].staumoddt)
                WHERE stauent = g_enterprise AND
                  stausite = g_stau_d_t.stausite #項次   
                  AND stau001 = g_stau_d_t.stau001  
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stau_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                  WHEN SQLCA.SQLCODE #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stau_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stau_d[g_detail_idx].stausite
               LET gs_keys_bak[1] = g_stau_d_t.stausite
               LET gs_keys[2] = g_stau_d[g_detail_idx].stau001
               LET gs_keys_bak[2] = g_stau_d_t.stau001
               CALL asti206_update_b('stau_t',gs_keys,gs_keys_bak,"'1'")
                     #資料多語言用-增/改
                     
                     #修改歷程記錄(修改)
                     LET g_log1 = util.JSON.stringify(g_stau_d_t)
                     LET g_log2 = util.JSON.stringify(g_stau_d[l_ac])
                     IF NOT cl_log_modified_record(g_log1,g_log2) THEN
                        CALL s_transaction_end('N','0')
                     END IF
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL asti206_stau_t_mask_restore('restore_mask_n')
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            CALL asti206_unlock_b("stau_t")
            IF INT_FLAG THEN
               CALL s_transaction_end('N','0')
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code   = 9001 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stau_d[l_ac].* = g_stau_d_t.*
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
               LET g_stau_d[li_reproduce_target].* = g_stau_d[li_reproduce].*
               LET g_stau2_d[li_reproduce_target].* = g_stau2_d[li_reproduce].*
 
               LET g_stau_d[li_reproduce_target].stausite = NULL
               LET g_stau_d[li_reproduce_target].stau001 = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stau_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stau_d.getLength()+1
            END IF
            
      END INPUT
      
 
      
      DISPLAY ARRAY g_stau2_d TO s_detail2.*
         ATTRIBUTES(COUNT=g_detail_cnt)  
      
         BEFORE DISPLAY 
            CALL asti206_b_fill(g_wc2)
            CALL FGL_SET_ARR_CURR(g_detail_idx)
      
         BEFORE ROW
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail2")
            LET l_ac = g_detail_idx
            LET g_temp_idx = l_ac
            DISPLAY g_detail_idx TO FORMONLY.idx
            CALL cl_show_fld_cont() 
            
         #add-point:page2自定義行為 name="input.body2.action"
         
         #end add-point
            
      END DISPLAY
 
      
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
               NEXT FIELD stausite
            WHEN "s_detail2"
               NEXT FIELD stausite_2
 
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
      IF INT_FLAG OR cl_null(g_stau_d[g_detail_idx].stausite) THEN
         CALL g_stau_d.deleteElement(g_detail_idx)
         CALL g_stau2_d.deleteElement(g_detail_idx)
 
      END IF
   END IF
   
   #修改後取消
   IF l_cmd = 'u' AND INT_FLAG THEN
      LET g_stau_d[g_detail_idx].* = g_stau_d_t.*
   END IF
   
   #add-point:modify段修改後 name="modify.after_input"
   
   #end add-point
 
   CLOSE asti206_bcl
   CALL s_transaction_end('Y','0')
   
END FUNCTION
 
{</section>}
 
{<section id="asti206.delete" >}
#+ 資料刪除
PRIVATE FUNCTION asti206_delete()
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
   FOR li_idx = 1 TO g_stau_d.getLength()
      LET g_detail_idx = li_idx
      #已選擇的資料
      IF g_curr_diag.isRowSelected(g_curr_diag.getCurrentItem(), li_idx) THEN 
         #確定是否有被鎖定
         IF NOT asti206_lock_b("stau_t") THEN
            #已被他人鎖定
            CALL s_transaction_end('N','0')
            RETURN
         END IF
 
         #(ver:35) ---add start---
         #確定是否有刪除的權限
         #先確定該table有ownid
         IF cl_getField("stau_t","stauownid") THEN
            LET g_data_owner = g_stau2_d[g_detail_idx].stauownid
            LET g_data_dept = g_stau2_d[g_detail_idx].stauowndp
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
   
   FOR li_idx = 1 TO g_stau_d.getLength()
      IF g_stau_d[li_idx].stausite IS NOT NULL
         AND g_stau_d[li_idx].stau001 IS NOT NULL
 
         AND g_curr_diag.isRowSelected(g_curr_diag.getCurrentItem(), li_idx) THEN 
         
         #add-point:單身刪除前 name="delete.body.b_delete"
         
         #end add-point   
         
         DELETE FROM stau_t
          WHERE stauent = g_enterprise AND 
                stausite = g_stau_d[li_idx].stausite
                AND stau001 = g_stau_d[li_idx].stau001
 
         #add-point:單身刪除中 name="delete.body.m_delete"
         
         #end add-point  
                
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stau_t:",SQLERRMESSAGE 
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
               LET gs_keys[1] = g_stau_d_t.stausite
               LET gs_keys[2] = g_stau_d_t.stau001
 
            #add-point:單身同步刪除中(同層table) name="delete.body.a_delete2"
            
            #end add-point
                           CALL asti206_delete_b('stau_t',gs_keys,"'1'")
            #add-point:單身同步刪除後(同層table) name="delete.body.a_delete3"
            
            #end add-point
            #刪除相關文件
            #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL asti206_set_pk_array()
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
   CALL asti206_b_fill(g_wc2)
            
END FUNCTION
 
{</section>}
 
{<section id="asti206.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION asti206_b_fill(p_wc2)              #BODY FILL UP
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point
   DEFINE p_wc2            STRING
   DEFINE ls_owndept_list  STRING  #(ver:35) add
   DEFINE ls_ownuser_list  STRING  #(ver:35) add
   #add-point:b_fill段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_where           STRING
   #end add-point
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   IF cl_null(p_wc2) THEN
      LET p_wc2 = " 1=1"
   END IF
   
   #add-point:b_fill段sql之前 name="b_fill.sql_before"
   CALL s_aooi500_sql_where(g_prog,'stausite') RETURNING l_where
   #end add-point
 
   LET g_sql = "SELECT  DISTINCT t0.stausite,t0.stau001,t0.stau002,t0.stau003,t0.stau004,t0.stausite, 
       t0.stau001,t0.stauownid,t0.stauowndp,t0.staucrtid,t0.staucrtdp,t0.staucrtdt,t0.staumodid,t0.staumoddt , 
       t1.ooefl003 ,t2.gzcbl004 ,t3.ooag011 ,t4.ooefl003 ,t5.ooag011 ,t6.ooefl003 ,t7.ooag011 FROM stau_t t0", 
 
               "",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stausite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN gzcbl_t t2 ON t2.gzcbl001='6072' AND t2.gzcbl002=t0.stau001 AND t2.gzcbl003='"||g_lang||"' ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.stauownid  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.stauowndp AND t4.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.staucrtid  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.staucrtdp AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.staumodid  ",
 
               " WHERE t0.stauent= ?  AND  1=1 AND (", p_wc2, ") "
 
   #(ver:35) ---add start---
      #應用 a68 樣板自動產生(Version:1)
   #若是修改，須視權限加上條件
   IF g_action_choice = "modify" OR g_action_choice = "modify_detail" THEN
      LET ls_owndept_list = NULL
      LET ls_ownuser_list = NULL
 
      #若有設定部門權限
      CALL cl_get_owndept_list("stau_t","modify") RETURNING ls_owndept_list
      IF NOT cl_null(ls_owndept_list) THEN
         LET g_sql = g_sql, " AND stauowndp IN (",ls_owndept_list,")"
      END IF
 
      #若有設定個人權限
      CALL cl_get_ownuser_list("stau_t","modify") RETURNING ls_ownuser_list
      IF NOT cl_null(ls_ownuser_list) THEN
         LET g_sql = g_sql," AND stauownid IN (",ls_ownuser_list,")"
      END IF
   END IF
 
 
 
   #(ver:35) --- add end ---
 
   #add-point:b_fill段sql wc name="b_fill.sql_wc"
   LET g_sql = g_sql," AND ",l_where
   #end add-point
   LET g_sql = g_sql, cl_sql_add_filter("stau_t"),
                      " ORDER BY t0.stausite,t0.stau001"
   
   #add-point:b_fill段sql之後 name="b_fill.sql_after"
   
   #end add-point
   
   #LET g_sql = cl_sql_add_tabid(g_sql,"stau_t")            #WC重組
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE asti206_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR asti206_pb
   
   OPEN b_fill_curs USING g_enterprise
 
   CALL g_stau_d.clear()
   CALL g_stau2_d.clear()   
 
 
   LET g_cnt = l_ac
   LET l_ac = 1   
   ERROR "Searching!" 
 
   FOREACH b_fill_curs INTO g_stau_d[l_ac].stausite,g_stau_d[l_ac].stau001,g_stau_d[l_ac].stau002,g_stau_d[l_ac].stau003, 
       g_stau_d[l_ac].stau004,g_stau2_d[l_ac].stausite,g_stau2_d[l_ac].stau001,g_stau2_d[l_ac].stauownid, 
       g_stau2_d[l_ac].stauowndp,g_stau2_d[l_ac].staucrtid,g_stau2_d[l_ac].staucrtdp,g_stau2_d[l_ac].staucrtdt, 
       g_stau2_d[l_ac].staumodid,g_stau2_d[l_ac].staumoddt,g_stau_d[l_ac].stausite_desc,g_stau_d[l_ac].stau001_desc, 
       g_stau2_d[l_ac].stauownid_desc,g_stau2_d[l_ac].stauowndp_desc,g_stau2_d[l_ac].staucrtid_desc, 
       g_stau2_d[l_ac].staucrtdp_desc,g_stau2_d[l_ac].staumodid_desc
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH b_fill_curs:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
  
      #add-point:b_fill段資料填充 name="b_fill.fill"
      
      #end add-point
      
      CALL asti206_detail_show()      
 
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
   
 
   
   CALL g_stau_d.deleteElement(g_stau_d.getLength())   
   CALL g_stau2_d.deleteElement(g_stau2_d.getLength())
 
   
   #將key欄位填到每個page
   FOR l_ac = 1 TO g_stau_d.getLength()
      LET g_stau2_d[l_ac].stausite = g_stau_d[l_ac].stausite 
      LET g_stau2_d[l_ac].stau001 = g_stau_d[l_ac].stau001 
 
      #add-point:b_fill段key值相關欄位 name="b_fill.keys.fill"
      
      #end add-point
   END FOR
   
   IF g_cnt > g_stau_d.getLength() THEN
      LET l_ac = g_stau_d.getLength()
   ELSE
      LET l_ac = g_cnt
   END IF
   LET g_cnt = l_ac
 
   #遮罩相關處理
   FOR l_ac = 1 TO g_stau_d.getLength()
      LET g_stau_d_mask_o[l_ac].* =  g_stau_d[l_ac].*
      CALL asti206_stau_t_mask()
      LET g_stau_d_mask_n[l_ac].* =  g_stau_d[l_ac].*
   END FOR
   
   LET g_stau2_d_mask_o.* =  g_stau2_d.*
   FOR l_ac = 1 TO g_stau2_d.getLength()
      LET g_stau2_d_mask_o[l_ac].* =  g_stau2_d[l_ac].*
      CALL asti206_stau_t_mask()
      LET g_stau2_d_mask_n[l_ac].* =  g_stau2_d[l_ac].*
   END FOR
 
   
   LET l_ac = g_cnt
 
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   
   #end add-point
   
   ERROR "" 
 
   LET g_detail_cnt = g_stau_d.getLength()
   DISPLAY g_detail_idx TO FORMONLY.idx
   DISPLAY g_detail_cnt TO FORMONLY.cnt
   
   CLOSE b_fill_curs
   FREE asti206_pb
   
END FUNCTION
 
{</section>}
 
{<section id="asti206.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION asti206_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point
   #add-point:show段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="detail_show.before"
   
   #end add-point
   
   
   
   #帶出公用欄位reference值page1
   
    
   #帶出公用欄位reference值page2
   #應用 a12 樣板自動產生(Version:4)
 
 
 
 
   
   #讀入ref值
   #add-point:show段單身reference name="detail_show.reference"
 
   #end add-point
   
   #add-point:show段單身reference name="detail_show.body2.reference"
 
   #end add-point
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="asti206.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION asti206_set_entry_b(p_cmd)                                                  
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
 
{<section id="asti206.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION asti206_set_no_entry_b(p_cmd)                                               
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
 
{<section id="asti206.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION asti206_default_search()
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
      LET ls_wc = ls_wc, " stausite = '", g_argv[01], "' AND "
   END IF
   
   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = ls_wc, " stau001 = '", g_argv[02], "' AND "
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
 
{<section id="asti206.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION asti206_delete_b(ps_table,ps_keys_bak,ps_page)
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
   LET ls_group = "stau_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      IF ps_table <> 'stau_t' THEN
         #add-point:delete_b段刪除前 name="delete_b.b_delete"
         
         #end add-point     
         
         DELETE FROM stau_t
          WHERE stauent = g_enterprise AND
            stausite = ps_keys_bak[1] AND stau001 = ps_keys_bak[2]
         
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
         CALL g_stau_d.deleteElement(li_idx) 
      END IF 
      IF ps_page <> "'2'" THEN 
         CALL g_stau2_d.deleteElement(li_idx) 
      END IF 
 
      
      #add-point:delete_b段刪除後 name="delete_b.a_delete"
      
      #end add-point
      
      RETURN
   END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="asti206.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION asti206_insert_b(ps_table,ps_keys,ps_page)
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
   LET ls_group = "stau_t,"
   #IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      
      #add-point:insert_b段新增前 name="insert_b.b_insert"
      
      #end add-point    
      INSERT INTO stau_t
                  (stauent,
                   stausite,stau001
                   ,stau002,stau003,stau004,stauownid,stauowndp,staucrtid,staucrtdp,staucrtdt,staumodid,staumoddt) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stau_d[l_ac].stau002,g_stau_d[l_ac].stau003,g_stau_d[l_ac].stau004,g_stau2_d[l_ac].stauownid, 
                       g_stau2_d[l_ac].stauowndp,g_stau2_d[l_ac].staucrtid,g_stau2_d[l_ac].staucrtdp, 
                       g_stau2_d[l_ac].staucrtdt,g_stau2_d[l_ac].staumodid,g_stau2_d[l_ac].staumoddt) 
 
      #add-point:insert_b段新增中 name="insert_b.m_insert"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stau_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      #add-point:insert_b段新增後 name="insert_b.a_insert"
      
      #end add-point    
   #END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="asti206.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION asti206_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   LET ls_group = "stau_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 AND ps_table <> "stau_t" THEN
      #add-point:update_b段修改前 name="update_b.b_update"
      
      #end add-point     
      UPDATE stau_t 
         SET (stausite,stau001
              ,stau002,stau003,stau004,stauownid,stauowndp,staucrtid,staucrtdp,staucrtdt,staumodid,staumoddt) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stau_d[l_ac].stau002,g_stau_d[l_ac].stau003,g_stau_d[l_ac].stau004,g_stau2_d[l_ac].stauownid, 
                  g_stau2_d[l_ac].stauowndp,g_stau2_d[l_ac].staucrtid,g_stau2_d[l_ac].staucrtdp,g_stau2_d[l_ac].staucrtdt, 
                  g_stau2_d[l_ac].staumodid,g_stau2_d[l_ac].staumoddt) 
         WHERE stauent = g_enterprise AND stausite = ps_keys_bak[1] AND stau001 = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point 
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            CALL s_transaction_end('N','0')
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stau_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stau_t:",SQLERRMESSAGE 
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
 
{<section id="asti206.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION asti206_lock_b(ps_table)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:lock_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
   
   #先刷新資料
   #CALL asti206_b_fill(g_wc2)
   
   #鎖定整組table
   #LET ls_group = ""
   #僅鎖定自身table
   LET ls_group = "stau_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN asti206_bcl USING g_enterprise,
                                       g_stau_d[g_detail_idx].stausite,g_stau_d[g_detail_idx].stau001 
 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asti206_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   
   END IF
                                    
 
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="asti206.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION asti206_unlock_b(ps_table)
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
      CLOSE asti206_bcl
   #END IF
   
 
   
   #add-point:unlock_b段結束前 name="unlock_b.after"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asti206.modify_detail_chk" >}
#+ 單身輸入判定(因應modify_detail)
PRIVATE FUNCTION asti206_modify_detail_chk(ps_record)
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
         LET ls_return = "stausite"
      WHEN "s_detail2"
         LET ls_return = "stausite_2"
 
      #add-point:modify_detail_chk段自訂page控制 name="modify_detail_chk.page_control"
      
      #end add-point
   END CASE
    
   #add-point:modify_detail_chk段結束前 name="modify_detail_chk.after"
   
   #end add-point
   
   RETURN ls_return
   
END FUNCTION
 
{</section>}
 
{<section id="asti206.show_ownid_msg" >}
#+ 判斷是否顯示只能修改自己權限資料的訊息
#(ver:35) ---add start---
PRIVATE FUNCTION asti206_show_ownid_msg()
   #add-point:show_ownid_msg段define(客製用) name="show_ownid_msg.define_customerization"
   
   #end add-point
   #add-point:show_ownid_msg段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show_ownid_msg.define"
   
   #end add-point
  
 
   IF g_action_choice = 'modify' OR g_action_choice = 'modify_detail' THEN
      IF mc_data_owner_check THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ''
         LET g_errparam.code   = 'lib-00419'
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      END IF
   END IF
 
END FUNCTION
#(ver:35) --- add end ---
 
{</section>}
 
{<section id="asti206.mask_functions" >}
&include "erp/ast/asti206_mask.4gl"
 
{</section>}
 
{<section id="asti206.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION asti206_set_pk_array()
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
   LET g_pk_array[1].values = g_stau_d[l_ac].stausite
   LET g_pk_array[1].column = 'stausite'
   LET g_pk_array[2].values = g_stau_d[l_ac].stau001
   LET g_pk_array[2].column = 'stau001'
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asti206.state_change" >}
   
 
{</section>}
 
{<section id="asti206.other_dialog" readonly="Y" >}
 
 
{</section>}
 
{<section id="asti206.other_function" readonly="Y" >}

 
{</section>}
 
