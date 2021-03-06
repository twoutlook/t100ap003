#該程式未解開Section, 採用最新樣板產出!
{<section id="asrt300_02.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0001(2013-12-21 22:38:13), PR版次:0001(2014-04-29 10:20:01)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000160
#+ Filename...: asrt300_02
#+ Description: 重覆性生產製程資訊
#+ Creator....: 02482(2013-12-13 09:32:18)
#+ Modifier...: 02482 -SD/PR- 02482
 
{</section>}
 
{<section id="asrt300_02.global" >}
#應用 c02b 樣板自動產生(Version:10)
#add-point:填寫註解說明 name="global.memo"
#Memos
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單身 type 宣告
PRIVATE TYPE type_g_srac_d        RECORD
       srac001 LIKE srac_t.srac001, 
   srac002 LIKE srac_t.srac002, 
   srac004 LIKE srac_t.srac004, 
   srac005 LIKE srac_t.srac005, 
   srac006 LIKE srac_t.srac006, 
   srac007 LIKE srac_t.srac007, 
   srac008 LIKE srac_t.srac008, 
   srac008_desc LIKE type_t.chr500, 
   srac009 LIKE srac_t.srac009, 
   srac010 LIKE srac_t.srac010, 
   srac011 LIKE srac_t.srac011, 
   srac012 LIKE srac_t.srac012, 
   srac012_desc LIKE type_t.chr500, 
   srac013 LIKE srac_t.srac013, 
   srac014 LIKE srac_t.srac014, 
   srac014_desc LIKE type_t.chr500, 
   srac015 LIKE srac_t.srac015, 
   srac016 LIKE srac_t.srac016, 
   srac016_desc LIKE type_t.chr500, 
   srac017 LIKE srac_t.srac017, 
   srac018 LIKE srac_t.srac018, 
   srac019 LIKE srac_t.srac019, 
   srac020 LIKE srac_t.srac020, 
   srac036 LIKE srac_t.srac036, 
   srac037 LIKE srac_t.srac037, 
   srac021 LIKE srac_t.srac021, 
   srac022 LIKE srac_t.srac022, 
   srac023 LIKE srac_t.srac023, 
   srac024 LIKE srac_t.srac024, 
   srac025 LIKE srac_t.srac025, 
   srac026 LIKE srac_t.srac026, 
   srac046 LIKE srac_t.srac046, 
   srac047 LIKE srac_t.srac047, 
   srac048 LIKE srac_t.srac048, 
   srac027 LIKE srac_t.srac027, 
   srac028 LIKE srac_t.srac028, 
   srac029 LIKE srac_t.srac029
       END RECORD
 
 
#add-point:自定義模組變數(Module Variable)(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_srab000       LIKE srab_t.srab000
DEFINE g_srab001       LIKE srab_t.srab001
DEFINE g_srab002       LIKE srab_t.srab002
DEFINE g_srab003       LIKE srab_t.srab003
DEFINE g_srab004       LIKE srab_t.srab004
DEFINE g_srab005       LIKE srab_t.srab005
DEFINE g_srab006       LIKE srab_t.srab006
DEFINE g_srab007       LIKE srab_t.srab007
DEFINE g_srab008       LIKE srab_t.srab008
DEFINE g_srab004_desc  LIKE imaal_t.imaal003
DEFINE g_srab004_desc1 LIKE imaal_t.imaal004
DEFINE g_srab001_desc  LIKE type_t.chr80
DEFINE g_srab008_desc  LIKE type_t.chr80
DEFINE g_srac008_desc  LIKE type_t.chr80

 TYPE type_g_srac2_d RECORD
       srac001_2 LIKE srac_t.srac001, 
       srac002_2 LIKE srac_t.srac002, 
       srac004_2 LIKE srac_t.srac004, 
       srac005_2 LIKE srac_t.srac005, 
       srac006_2 LIKE srac_t.srac006, 
       srac007_2 LIKE srac_t.srac007, 
       srac030 LIKE srac_t.srac030, 
       srac031 LIKE srac_t.srac031, 
       srac032 LIKE srac_t.srac032, 
       srac033 LIKE srac_t.srac033, 
       srac034 LIKE srac_t.srac034, 
       srac035 LIKE srac_t.srac035, 
       srac038 LIKE srac_t.srac038, 
       srac039 LIKE srac_t.srac039, 
       srac040 LIKE srac_t.srac040, 
       srac041 LIKE srac_t.srac041, 
       srac042 LIKE srac_t.srac042, 
       srac043 LIKE srac_t.srac043, 
       srac044 LIKE srac_t.srac044, 
       srac045 LIKE srac_t.srac045
       END RECORD
       
 TYPE type_g_srac3_d RECORD
       srad009_i LIKE srad_t.srad009, 
       srad009_i_desc LIKE type_t.chr80, 
       srad010_i LIKE srad_t.srad010, 
       srad011_i LIKE srad_t.srad011, 
       srad012_i LIKE srad_t.srad012, 
       srad013_i LIKE srad_t.srad013, 
       srad014_i LIKE srad_t.srad014
       END RECORD
       
PRIVATE TYPE type_g_srac4_d RECORD
       srad009_o LIKE srad_t.srad009, 
       srad009_o_desc LIKE type_t.chr80, 
       srad010_o LIKE srad_t.srad010, 
       srad011_o LIKE srad_t.srad011, 
       srad012_o LIKE srad_t.srad012, 
       srad013_o LIKE srad_t.srad013, 
       srad014_o LIKE srad_t.srad014
       END RECORD      
       
DEFINE g_srac2_d             DYNAMIC ARRAY OF type_g_srac2_d
DEFINE g_srac2_d_t           type_g_srac2_d
          
DEFINE g_srac3_d             DYNAMIC ARRAY OF type_g_srac3_d
DEFINE g_srac3_d_t           type_g_srac3_d
          
DEFINE g_srac4_d             DYNAMIC ARRAY OF type_g_srac4_d
DEFINE g_srac4_d_t           type_g_srac4_d
          
DEFINE l_ac2                 LIKE type_t.num5
DEFINE l_ac3                 LIKE type_t.num5
DEFINE l_ac4                 LIKE type_t.num5
DEFINE g_curr_diag           ui.Dialog                     #Current Dialog
DEFINE g_current_page        LIKE type_t.num5              #目前所在頁數
DEFINE g_cnt                 LIKE type_t.num5
DEFINE g_sql                 STRING
#end add-point
 
DEFINE g_srac_d          DYNAMIC ARRAY OF type_g_srac_d
DEFINE g_srac_d_t        type_g_srac_d
 
 
DEFINE g_srac001_t   LIKE srac_t.srac001    #Key值備份
DEFINE g_srac002_t      LIKE srac_t.srac002    #Key值備份
DEFINE g_srac004_t      LIKE srac_t.srac004    #Key值備份
DEFINE g_srac005_t      LIKE srac_t.srac005    #Key值備份
DEFINE g_srac006_t      LIKE srac_t.srac006    #Key值備份
DEFINE g_srac007_t      LIKE srac_t.srac007    #Key值備份
 
 
DEFINE l_ac                  LIKE type_t.num10
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rec_b               LIKE type_t.num10 
DEFINE g_detail_idx          LIKE type_t.num10
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
    
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point    
 
{</section>}
 
{<section id="asrt300_02.input" >}
#+ 資料輸入
PUBLIC FUNCTION asrt300_02(--)
   #add-point:input段變數傳入 name="input.get_var"
   p_srab000,p_srab001,p_srab002,p_srab003,p_srab004,p_srab005,p_srab006,p_srab007,p_srab008
   #end add-point
   )
   #add-point:input段define name="input.define_customerization"
   
   #end add-point
   DEFINE l_ac_t          LIKE type_t.num10       #未取消的ARRAY CNT 
   DEFINE l_allow_insert  LIKE type_t.num5        #可新增否 
   DEFINE l_allow_delete  LIKE type_t.num5        #可刪除否  
   DEFINE l_count         LIKE type_t.num10
   DEFINE l_insert        LIKE type_t.num5
   DEFINE l_cmd           LIKE type_t.chr5
   #add-point:input段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE p_srab000       LIKE srab_t.srab000
   DEFINE p_srab001       LIKE srab_t.srab001
   DEFINE p_srab002       LIKE srab_t.srab002
   DEFINE p_srab003       LIKE srab_t.srab003
   DEFINE p_srab004       LIKE srab_t.srab004
   DEFINE p_srab005       LIKE srab_t.srab005
   DEFINE p_srab006       LIKE srab_t.srab006
   DEFINE p_srab007       LIKE srab_t.srab007
   DEFINE p_srab008       LIKE srab_t.srab008
   #end add-point
 
   #畫面開啟 (identifier)
   OPEN WINDOW w_asrt300_02 WITH FORM cl_ap_formpath("asr","asrt300_02")
 
   #瀏覽頁簽資料初始化
   CALL cl_ui_init()
   
   LET g_qryparam.state = "i"
   
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   
   #輸入前處理
   #add-point:單身前置處理 name="input.pre_input"
   LET g_srab000 = p_srab000
   LET g_srab001 = p_srab001
   LET g_srab002 = p_srab002
   LET g_srab003 = p_srab003
   LET g_srab004 = p_srab004
   LET g_srab005 = p_srab005
   LET g_srab006 = p_srab006
   LET g_srab007 = p_srab007
   LET g_srab008 = p_srab008
   SELECT imaal003,imaal004 
     INTO g_srab004_desc,g_srab004_desc1
     FROM imaal_t
    WHERE imaalent = g_enterprise
      AND imaal001 = g_srab004
      AND imaal002 = g_dlang
   SELECT srza002 INTO g_srab001_desc
     FROM srza_t
    WHERE srzaent = g_enterprise
      AND srzasite = g_site
      AND srza001 = g_srab001
   SELECT ecba003 INTO g_srab008_desc
     FROM ecba_t
    WHERE ecbaent = g_enterprise
      AND ecbasite = g_site
      AND ecba001 = g_srab004
      AND ecba002 = g_srab008
   LET l_ac = 1
   LET l_ac2 = 1 
   LET l_ac3 = 1 
   LET l_ac4 = 1
   LET g_detail_idx = 1
   CALL asrt300_02_b_fill_1()
   CALL asrt300_02_b_fill_2()
   CALL asrt300_02_b_fill_3(g_srac_d[1].srac007,g_srac_d[1].srac008,g_srac_d[1].srac009)  
   CALL asrt300_02_b_fill_4(g_srac_d[1].srac007,g_srac_d[1].srac008,g_srac_d[1].srac009)   
   CALL asrt300_02_show()
   RETURN
   #end add-point
  
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #輸入開始
      INPUT ARRAY g_srac_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert,
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
         
         #自訂ACTION
         #add-point:單身前置處理 name="input.action"
         
         #end add-point
         
         #自訂ACTION(detail_input)
         
         
         BEFORE INPUT
            #add-point:單身輸入前處理 name="input.before_input"
            
            #end add-point
          
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac001
            #add-point:BEFORE FIELD srac001 name="input.b.page1.srac001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac001
            
            #add-point:AFTER FIELD srac001 name="input.a.page1.srac001"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac001
            #add-point:ON CHANGE srac001 name="input.g.page1.srac001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac002
            #add-point:BEFORE FIELD srac002 name="input.b.page1.srac002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac002
            
            #add-point:AFTER FIELD srac002 name="input.a.page1.srac002"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac002
            #add-point:ON CHANGE srac002 name="input.g.page1.srac002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac004
            #add-point:BEFORE FIELD srac004 name="input.b.page1.srac004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac004
            
            #add-point:AFTER FIELD srac004 name="input.a.page1.srac004"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac004
            #add-point:ON CHANGE srac004 name="input.g.page1.srac004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac005
            #add-point:BEFORE FIELD srac005 name="input.b.page1.srac005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac005
            
            #add-point:AFTER FIELD srac005 name="input.a.page1.srac005"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac005
            #add-point:ON CHANGE srac005 name="input.g.page1.srac005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac006
            #add-point:BEFORE FIELD srac006 name="input.b.page1.srac006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac006
            
            #add-point:AFTER FIELD srac006 name="input.a.page1.srac006"
          
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac006
            #add-point:ON CHANGE srac006 name="input.g.page1.srac006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac007
            #add-point:BEFORE FIELD srac007 name="input.b.page1.srac007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac007
            
            #add-point:AFTER FIELD srac007 name="input.a.page1.srac007"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac007
            #add-point:ON CHANGE srac007 name="input.g.page1.srac007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac008
            
            #add-point:AFTER FIELD srac008 name="input.a.page1.srac008"
 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac008
            #add-point:BEFORE FIELD srac008 name="input.b.page1.srac008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac008
            #add-point:ON CHANGE srac008 name="input.g.page1.srac008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac009
            #add-point:BEFORE FIELD srac009 name="input.b.page1.srac009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac009
            
            #add-point:AFTER FIELD srac009 name="input.a.page1.srac009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac009
            #add-point:ON CHANGE srac009 name="input.g.page1.srac009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac010
            #add-point:BEFORE FIELD srac010 name="input.b.page1.srac010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac010
            
            #add-point:AFTER FIELD srac010 name="input.a.page1.srac010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac010
            #add-point:ON CHANGE srac010 name="input.g.page1.srac010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac011
            #add-point:BEFORE FIELD srac011 name="input.b.page1.srac011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac011
            
            #add-point:AFTER FIELD srac011 name="input.a.page1.srac011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac011
            #add-point:ON CHANGE srac011 name="input.g.page1.srac011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac012
            
            #add-point:AFTER FIELD srac012 name="input.a.page1.srac012"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_srac_d[l_ac].srac012
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_srac_d[l_ac].srac012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_srac_d[l_ac].srac012_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac012
            #add-point:BEFORE FIELD srac012 name="input.b.page1.srac012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac012
            #add-point:ON CHANGE srac012 name="input.g.page1.srac012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac013
            #add-point:BEFORE FIELD srac013 name="input.b.page1.srac013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac013
            
            #add-point:AFTER FIELD srac013 name="input.a.page1.srac013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac013
            #add-point:ON CHANGE srac013 name="input.g.page1.srac013"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac014
            
            #add-point:AFTER FIELD srac014 name="input.a.page1.srac014"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_srac_d[l_ac].srac014
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_srac_d[l_ac].srac014_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_srac_d[l_ac].srac014_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac014
            #add-point:BEFORE FIELD srac014 name="input.b.page1.srac014"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac014
            #add-point:ON CHANGE srac014 name="input.g.page1.srac014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac015
            #add-point:BEFORE FIELD srac015 name="input.b.page1.srac015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac015
            
            #add-point:AFTER FIELD srac015 name="input.a.page1.srac015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac015
            #add-point:ON CHANGE srac015 name="input.g.page1.srac015"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac016
            
            #add-point:AFTER FIELD srac016 name="input.a.page1.srac016"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_srac_d[l_ac].srac016
            CALL ap_ref_array2(g_ref_fields,"SELECT ecaa002 FROM ecaa_t WHERE ecaaent='"||g_enterprise||"' AND ecaa001=? ","") RETURNING g_rtn_fields
            LET g_srac_d[l_ac].srac016_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_srac_d[l_ac].srac016_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac016
            #add-point:BEFORE FIELD srac016 name="input.b.page1.srac016"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac016
            #add-point:ON CHANGE srac016 name="input.g.page1.srac016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac017
            #add-point:BEFORE FIELD srac017 name="input.b.page1.srac017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac017
            
            #add-point:AFTER FIELD srac017 name="input.a.page1.srac017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac017
            #add-point:ON CHANGE srac017 name="input.g.page1.srac017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac018
            #add-point:BEFORE FIELD srac018 name="input.b.page1.srac018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac018
            
            #add-point:AFTER FIELD srac018 name="input.a.page1.srac018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac018
            #add-point:ON CHANGE srac018 name="input.g.page1.srac018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac019
            #add-point:BEFORE FIELD srac019 name="input.b.page1.srac019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac019
            
            #add-point:AFTER FIELD srac019 name="input.a.page1.srac019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac019
            #add-point:ON CHANGE srac019 name="input.g.page1.srac019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac020
            #add-point:BEFORE FIELD srac020 name="input.b.page1.srac020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac020
            
            #add-point:AFTER FIELD srac020 name="input.a.page1.srac020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac020
            #add-point:ON CHANGE srac020 name="input.g.page1.srac020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac036
            #add-point:BEFORE FIELD srac036 name="input.b.page1.srac036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac036
            
            #add-point:AFTER FIELD srac036 name="input.a.page1.srac036"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac036
            #add-point:ON CHANGE srac036 name="input.g.page1.srac036"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac037
            #add-point:BEFORE FIELD srac037 name="input.b.page1.srac037"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac037
            
            #add-point:AFTER FIELD srac037 name="input.a.page1.srac037"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac037
            #add-point:ON CHANGE srac037 name="input.g.page1.srac037"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac021
            #add-point:BEFORE FIELD srac021 name="input.b.page1.srac021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac021
            
            #add-point:AFTER FIELD srac021 name="input.a.page1.srac021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac021
            #add-point:ON CHANGE srac021 name="input.g.page1.srac021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac022
            #add-point:BEFORE FIELD srac022 name="input.b.page1.srac022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac022
            
            #add-point:AFTER FIELD srac022 name="input.a.page1.srac022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac022
            #add-point:ON CHANGE srac022 name="input.g.page1.srac022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac023
            #add-point:BEFORE FIELD srac023 name="input.b.page1.srac023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac023
            
            #add-point:AFTER FIELD srac023 name="input.a.page1.srac023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac023
            #add-point:ON CHANGE srac023 name="input.g.page1.srac023"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac024
            #add-point:BEFORE FIELD srac024 name="input.b.page1.srac024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac024
            
            #add-point:AFTER FIELD srac024 name="input.a.page1.srac024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac024
            #add-point:ON CHANGE srac024 name="input.g.page1.srac024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac025
            #add-point:BEFORE FIELD srac025 name="input.b.page1.srac025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac025
            
            #add-point:AFTER FIELD srac025 name="input.a.page1.srac025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac025
            #add-point:ON CHANGE srac025 name="input.g.page1.srac025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac026
            #add-point:BEFORE FIELD srac026 name="input.b.page1.srac026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac026
            
            #add-point:AFTER FIELD srac026 name="input.a.page1.srac026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac026
            #add-point:ON CHANGE srac026 name="input.g.page1.srac026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac046
            #add-point:BEFORE FIELD srac046 name="input.b.page1.srac046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac046
            
            #add-point:AFTER FIELD srac046 name="input.a.page1.srac046"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac046
            #add-point:ON CHANGE srac046 name="input.g.page1.srac046"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac047
            #add-point:BEFORE FIELD srac047 name="input.b.page1.srac047"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac047
            
            #add-point:AFTER FIELD srac047 name="input.a.page1.srac047"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac047
            #add-point:ON CHANGE srac047 name="input.g.page1.srac047"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac048
            #add-point:BEFORE FIELD srac048 name="input.b.page1.srac048"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac048
            
            #add-point:AFTER FIELD srac048 name="input.a.page1.srac048"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac048
            #add-point:ON CHANGE srac048 name="input.g.page1.srac048"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac027
            #add-point:BEFORE FIELD srac027 name="input.b.page1.srac027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac027
            
            #add-point:AFTER FIELD srac027 name="input.a.page1.srac027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac027
            #add-point:ON CHANGE srac027 name="input.g.page1.srac027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac028
            #add-point:BEFORE FIELD srac028 name="input.b.page1.srac028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac028
            
            #add-point:AFTER FIELD srac028 name="input.a.page1.srac028"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac028
            #add-point:ON CHANGE srac028 name="input.g.page1.srac028"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srac029
            #add-point:BEFORE FIELD srac029 name="input.b.page1.srac029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srac029
            
            #add-point:AFTER FIELD srac029 name="input.a.page1.srac029"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srac029
            #add-point:ON CHANGE srac029 name="input.g.page1.srac029"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.srac001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac001
            #add-point:ON ACTION controlp INFIELD srac001 name="input.c.page1.srac001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac002
            #add-point:ON ACTION controlp INFIELD srac002 name="input.c.page1.srac002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac004
            #add-point:ON ACTION controlp INFIELD srac004 name="input.c.page1.srac004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac005
            #add-point:ON ACTION controlp INFIELD srac005 name="input.c.page1.srac005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac006
            #add-point:ON ACTION controlp INFIELD srac006 name="input.c.page1.srac006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac007
            #add-point:ON ACTION controlp INFIELD srac007 name="input.c.page1.srac007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac008
            #add-point:ON ACTION controlp INFIELD srac008 name="input.c.page1.srac008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac009
            #add-point:ON ACTION controlp INFIELD srac009 name="input.c.page1.srac009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac010
            #add-point:ON ACTION controlp INFIELD srac010 name="input.c.page1.srac010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac011
            #add-point:ON ACTION controlp INFIELD srac011 name="input.c.page1.srac011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac012
            #add-point:ON ACTION controlp INFIELD srac012 name="input.c.page1.srac012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac013
            #add-point:ON ACTION controlp INFIELD srac013 name="input.c.page1.srac013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac014
            #add-point:ON ACTION controlp INFIELD srac014 name="input.c.page1.srac014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac015
            #add-point:ON ACTION controlp INFIELD srac015 name="input.c.page1.srac015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac016
            #add-point:ON ACTION controlp INFIELD srac016 name="input.c.page1.srac016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac017
            #add-point:ON ACTION controlp INFIELD srac017 name="input.c.page1.srac017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac018
            #add-point:ON ACTION controlp INFIELD srac018 name="input.c.page1.srac018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac019
            #add-point:ON ACTION controlp INFIELD srac019 name="input.c.page1.srac019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac020
            #add-point:ON ACTION controlp INFIELD srac020 name="input.c.page1.srac020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac036
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac036
            #add-point:ON ACTION controlp INFIELD srac036 name="input.c.page1.srac036"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac037
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac037
            #add-point:ON ACTION controlp INFIELD srac037 name="input.c.page1.srac037"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac021
            #add-point:ON ACTION controlp INFIELD srac021 name="input.c.page1.srac021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac022
            #add-point:ON ACTION controlp INFIELD srac022 name="input.c.page1.srac022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac023
            #add-point:ON ACTION controlp INFIELD srac023 name="input.c.page1.srac023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac024
            #add-point:ON ACTION controlp INFIELD srac024 name="input.c.page1.srac024"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac025
            #add-point:ON ACTION controlp INFIELD srac025 name="input.c.page1.srac025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac026
            #add-point:ON ACTION controlp INFIELD srac026 name="input.c.page1.srac026"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac046
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac046
            #add-point:ON ACTION controlp INFIELD srac046 name="input.c.page1.srac046"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac047
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac047
            #add-point:ON ACTION controlp INFIELD srac047 name="input.c.page1.srac047"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac048
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac048
            #add-point:ON ACTION controlp INFIELD srac048 name="input.c.page1.srac048"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac027
            #add-point:ON ACTION controlp INFIELD srac027 name="input.c.page1.srac027"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac028
            #add-point:ON ACTION controlp INFIELD srac028 name="input.c.page1.srac028"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srac029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srac029
            #add-point:ON ACTION controlp INFIELD srac029 name="input.c.page1.srac029"
            
            #END add-point
 
 
 
 
         #自訂ACTION
         #add-point:單身其他段落處理(EX:on row change, etc...) name="input.other"
         
         #end add-point
 
         AFTER INPUT
            #add-point:單身輸入後處理 name="input.after_input"
            
            #end add-point
            
      END INPUT
      
 
      
      #add-point:自定義input name="input.more_input"
 
      #end add-point
    
      #公用action
      ON ACTION accept
         ACCEPT DIALOG
        
      ON ACTION cancel
         #add-point:cancel name="input.cancel"
         
         #end add-point
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION close
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit
         LET INT_FLAG = TRUE 
         EXIT DIALOG
   
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
 
   #add-point:畫面關閉前 name="input.before_close"
   
   #end add-point
   
   #畫面關閉
   CLOSE WINDOW w_asrt300_02 
   
   #add-point:input段after input name="input.post_input"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="asrt300_02.other_dialog" readonly="Y" >}

 
{</section>}
 
{<section id="asrt300_02.other_function" readonly="Y" >}
################################################################################
# Descriptions...: 單頭資料顯示
# Memo...........:
# Usage..........: CALL asrt300_02_show()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/18 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_02_show()
   
   DISPLAY g_srab001 TO srab001
   DISPLAY g_srab004 TO srab004
   DISPLAY g_srab004_desc TO srab004_desc 
   DISPLAY g_srab004_desc1 TO srab004_desc1
   DISPLAY g_srab005 TO srab005
   DISPLAY g_srab006 TO srab006
   DISPLAY g_srab008 TO srab008
   DISPLAY g_srab001_desc TO srab001_desc
   DISPLAY g_srab008_desc TO srab008_desc    
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)

   DISPLAY ARRAY g_srac_d TO s_detail1.* ATTRIBUTES(COUNT=l_ac)
      BEFORE ROW
         CALL asrt300_02_idx_chk()
         LET l_ac = DIALOG.getCurrentRow("s_detail1")
         LET g_detail_idx = l_ac
         CALL FGL_SET_ARR_CURR(g_detail_idx)
         LET l_ac = DIALOG.getCurrentRow("s_detail1")
         CALL asrt300_02_b_fill_2()
         CALL asrt300_02_b_fill_3(g_srac_d[l_ac].srac007,g_srac_d[l_ac].srac008,g_srac_d[l_ac].srac009)
         CALL asrt300_02_b_fill_4(g_srac_d[l_ac].srac007,g_srac_d[l_ac].srac008,g_srac_d[l_ac].srac009)
         DISPLAY ARRAY g_srac2_d TO s_detail2.* ATTRIBUTES(COUNT=l_ac2)
            BEFORE DISPLAY
              EXIT DISPLAY
         END DISPLAY
         DISPLAY ARRAY g_srac3_d TO s_detail3.* ATTRIBUTES(COUNT=l_ac3)
             BEFORE DISPLAY
              EXIT DISPLAY
         END DISPLAY
         DISPLAY ARRAY g_srac4_d TO s_detail4.* ATTRIBUTES(COUNT=l_ac4)
             BEFORE DISPLAY
              EXIT DISPLAY
         END DISPLAY
         
      BEFORE DISPLAY
         CALL FGL_SET_ARR_CURR(g_detail_idx)
         LET l_ac = DIALOG.getCurrentRow("s_detail1")
         CALL asrt300_02_idx_chk()
         LET g_current_page = 1
   END DISPLAY
   
   DISPLAY ARRAY g_srac2_d TO s_detail2.* ATTRIBUTES(COUNT=l_ac2)
      BEFORE ROW
         CALL asrt300_02_idx_chk()
         LET l_ac2 = DIALOG.getCurrentRow("s_detail2")
         LET g_detail_idx = l_ac2
         CALL FGL_SET_ARR_CURR(g_detail_idx)
         LET l_ac2 = DIALOG.getCurrentRow("s_detail2")
         CALL asrt300_02_b_fill_3(g_srac_d[l_ac2].srac007,g_srac_d[l_ac2].srac008,g_srac_d[l_ac2].srac009)
         CALL asrt300_02_b_fill_4(g_srac_d[l_ac2].srac007,g_srac_d[l_ac2].srac008,g_srac_d[l_ac2].srac009)
         DISPLAY ARRAY g_srac3_d TO s_detail3.* ATTRIBUTES(COUNT=l_ac3)
             BEFORE DISPLAY
              EXIT DISPLAY
         END DISPLAY
         DISPLAY ARRAY g_srac4_d TO s_detail4.* ATTRIBUTES(COUNT=l_ac4)
             BEFORE DISPLAY
              EXIT DISPLAY
         END DISPLAY
         
      BEFORE DISPLAY
         CALL FGL_SET_ARR_CURR(g_detail_idx)
         LET l_ac2 = DIALOG.getCurrentRow("s_detail2")
         CALL asrt300_02_idx_chk()
         LET g_current_page = 1
   END DISPLAY
   
   DISPLAY ARRAY g_srac3_d TO s_detail3.* ATTRIBUTES(COUNT=l_ac3)
      BEFORE ROW
         CALL asrt300_02_idx_chk()
         LET l_ac3 = DIALOG.getCurrentRow("s_detail3")
         LET g_detail_idx = l_ac3

      BEFORE DISPLAY
         CALL FGL_SET_ARR_CURR(g_detail_idx)
         LET l_ac3 = DIALOG.getCurrentRow("s_detail3")
         CALL asrt300_02_idx_chk()
         LET g_current_page = 1
   END DISPLAY
   
   DISPLAY ARRAY g_srac4_d TO s_detail4.* ATTRIBUTES(COUNT=l_ac4)
      BEFORE ROW
         CALL asrt300_02_idx_chk()
         LET l_ac4 = DIALOG.getCurrentRow("s_detail4")
         LET g_detail_idx = l_ac4

      BEFORE DISPLAY
         CALL FGL_SET_ARR_CURR(g_detail_idx)
         LET l_ac4 = DIALOG.getCurrentRow("s_detail4")
         CALL asrt300_02_idx_chk()
         LET g_current_page = 1
   END DISPLAY
   
   BEFORE DIALOG
      LET g_curr_diag = ui.DIALOG.getCurrent()
      
      
      ON ACTION stand
         IF cl_null(l_ac) OR l_ac = 0 THEN
            LET l_ac =1
         END IF
         IF NOT cl_null(g_srac_d[l_ac].srac007) THEN
            CALL asrt300_01(g_srab001,g_srab008,g_srab004,g_srab005,g_srab006,g_srac_d[l_ac].srac007,g_srac_d[l_ac].srac008,g_srac_d[l_ac].srac009)
         END IF
         
      ON ACTION accept
         ACCEPT DIALOG
        
      ON ACTION cancel
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION close
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit
         LET INT_FLAG = TRUE 
         EXIT DIALOG
   
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
 
   #add-point:畫面關閉前

   #end add-point
   
   #畫面關閉
   CLOSE WINDOW w_asrt300_02 
      
END FUNCTION
################################################################################
# Descriptions...: 單身筆數變更
# Memo...........:
# Usage..........: CALL asrt300_02_idx_chk()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/19 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_02_idx_chk()
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_srac_d.getLength() THEN
         LET g_detail_idx = g_srac_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_srac_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_srac_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_srac2_d.getLength() THEN
         LET g_detail_idx = g_srac2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_srac2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_srac2_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 3 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx > g_srac3_d.getLength() THEN
         LET g_detail_idx = g_srac3_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_srac3_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_srac3_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 4 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail4")
      IF g_detail_idx > g_srac4_d.getLength() THEN
         LET g_detail_idx = g_srac4_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_srac4_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_srac4_d.getLength() TO FORMONLY.cnt
   END IF
END FUNCTION
################################################################################
# Descriptions...: 制程資訊頁簽填充
# Memo...........:
# Usage..........: CALL asrt300_02_b_fill_1()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/19 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_02_b_fill_1()
   CALL g_srac_d.clear()
   LET g_sql = " SELECT UNIQUE srac001,srac002,srac004,srac005,srac006,srac007,srac008,'',srac009,srac010,srac011,srac012,'',srac013,srac014,'',srac015,srac016,'',srac017,srac018,srac019,srac020,",
               "               srac036,srac037,srac021,srac022,srac023,srac024,srac025,srac026,srac046,srac047,srac048,srac027,srac028,srac029 ",
               "   FROM srac_t",
               "  WHERE sracent = '",g_enterprise,"'",
               "    AND sracsite = '",g_site,"'",
               "    AND srac001 = '",g_srab001,"'",
               "    AND srac002 = '",g_srab008,"'",
               "    AND srac004 = '",g_srab004,"'",
               "    AND srac005 = '",g_srab005,"'",
               "    AND srac006 = '",g_srab006,"'"
   PREPARE asrt300_02_b_fill1_pb FROM g_sql
   DECLARE asrt300_02_b_fill1_cs CURSOR FOR asrt300_02_b_fill1_pb
   LET g_cnt = l_ac
   LET l_ac = 1
   FOREACH asrt300_02_b_fill1_cs INTO g_srac_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_srac_d[l_ac].srac008
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_srac_d[l_ac].srac008_desc =  g_rtn_fields[1]
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_srac_d[l_ac].srac012
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_srac_d[l_ac].srac012_desc =  g_rtn_fields[1]
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_srac_d[l_ac].srac014
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_srac_d[l_ac].srac014_desc =  g_rtn_fields[1]
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_srac_d[l_ac].srac016
      CALL ap_ref_array2(g_ref_fields,"SELECT ecaa002 FROM ecaa_t WHERE ecaaent='"||g_enterprise||"' AND ecaa001=? ","") RETURNING g_rtn_fields
      LET g_srac_d[l_ac].srac016_desc = g_rtn_fields[1]
      
      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_srac_d.deleteElement(g_srac_d.getLength())
   LET l_ac = g_cnt
   LET g_cnt = 0

   FREE asrt300_02_b_fill1_pb
END FUNCTION
################################################################################
# Descriptions...: 在制狀況頁簽填充
# Memo...........:
# Usage..........: CALL asrt300_02_b_fill_2()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/19 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_02_b_fill_2()
   CALL g_srac2_d.clear()
   LET g_sql = " SELECT UNIQUE srac001,srac002,srac004,srac005,srac006,srac007,srac030,srac031,srac032,srac033,srac034,srac035,srac038,srac039,",
               "               srac040,srac041,srac042,srac043,srac044,srac045 ",
               "   FROM srac_t",
               "  WHERE sracent = '",g_enterprise,"'",
               "    AND sracsite = '",g_site,"'",
               "    AND srac001 = '",g_srab001,"'",
               "    AND srac002 = '",g_srab008,"'",
               "    AND srac004 = '",g_srab004,"'",
               "    AND srac005 = '",g_srab005,"'",
               "    AND srac006 = '",g_srab006,"'"
   PREPARE asrt300_02_b_fill2_pb FROM g_sql
   DECLARE asrt300_02_b_fill2_cs CURSOR FOR asrt300_02_b_fill2_pb
   LET g_cnt = l_ac2
   LET l_ac2 = 1
   FOREACH asrt300_02_b_fill2_cs INTO g_srac2_d[l_ac2].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      LET l_ac2 = l_ac2 + 1
      IF l_ac2 > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_srac2_d.deleteElement(g_srac2_d.getLength())
   LET l_ac2 = g_cnt
   LET g_cnt = 0

   FREE asrt300_02_b_fill2_pb
END FUNCTION
################################################################################
# Descriptions...: Check in 頁簽填充
# Memo...........:
# Usage..........: CALL asrt300_02_b_fill_3(p_srac007,p_srac008,p_srac009)
# Input parameter: p_srac007 項次
#                : p_srac008 本站作業
#                : p_srac009 制程序
# Return code....: 無
# Date & Author..: 2013/12/19 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_02_b_fill_3(p_srac007,p_srac008,p_srac009)
DEFINE p_srac007       LIKE srac_t.srac007
DEFINE p_srac008       LIKE srac_t.srac008
DEFINE p_srac009       LIKE srac_t.srac009

   IF cl_null(p_srac007) THEN
      RETURN
   END IF
   CALL g_srac3_d.clear()
   DISPLAY p_srac007 TO srac007_i
   DISPLAY p_srac007 TO srac007_o
   DISPLAY p_srac008 TO srac008_i
   DISPLAY p_srac008 TO srac008_o
   DISPLAY p_srac009 TO srac009_i
   DISPLAY p_srac009 TO srac009_o
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = p_srac008
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_srac008_desc =  g_rtn_fields[1]
   DISPLAY g_srac008_desc TO srac008_i_desc
   DISPLAY g_srac008_desc TO srac008_o_desc
   
   LET g_sql = " SELECT UNIQUE srad009,'',srad010,srad011,srad012,srad013,srad014 ",
               "   FROM srad_t",
               "  WHERE sradent = '",g_enterprise,"'",
               "    AND sradsite = '",g_site,"'",
               "    AND srad001 = '",g_srab001,"'",
               "    AND srad002 = '",g_srab008,"'",
               "    AND srad004 = '",g_srab004,"'",
               "    AND srad005 = '",g_srab005,"'",
               "    AND srad006 = '",g_srab006,"'",
               "    AND srad007 = '",p_srac007,"'",
               "    AND srad008 = '1' "
   PREPARE asrt300_02_b_fill3_pb FROM g_sql
   DECLARE asrt300_02_b_fill3_cs CURSOR FOR asrt300_02_b_fill3_pb
   LET g_cnt = l_ac3
   LET l_ac3 = 1
   FOREACH asrt300_02_b_fill3_cs INTO g_srac3_d[l_ac3].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_srac3_d[l_ac3].srad009_i
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '223' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_srac3_d[l_ac3].srad009_i_desc =  g_rtn_fields[1]
      
      LET l_ac3 = l_ac3 + 1
      IF l_ac3 > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_srac3_d.deleteElement(g_srac3_d.getLength())
   LET l_ac3 = g_cnt
   LET g_cnt = 0

   FREE asrt300_02_b_fill3_pb
END FUNCTION
################################################################################
# Descriptions...: Check out 頁簽填充
# Memo...........:
# Usage..........: CALL asrt300_02_b_fill_4(p_srac007,p_srac008,p_srac009)
# Input parameter: p_srac007 項次
#                : p_srac008 本站作業
#                : p_srac009 制程序
# Return code....: 無
# Date & Author..: 2013/12/19 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_02_b_fill_4(p_srac007,p_srac008,p_srac009)
DEFINE p_srac007       LIKE srac_t.srac007
DEFINE p_srac008       LIKE srac_t.srac008
DEFINE p_srac009       LIKE srac_t.srac009

   IF cl_null(p_srac007) THEN
      RETURN
   END IF
   CALL g_srac4_d.clear()
   DISPLAY p_srac007 TO srac007_i
   DISPLAY p_srac007 TO srac007_o
   DISPLAY p_srac008 TO srac008_i
   DISPLAY p_srac008 TO srac008_o
   DISPLAY p_srac009 TO srac009_i
   DISPLAY p_srac009 TO srac009_o
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = p_srac008
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_srac008_desc =  g_rtn_fields[1]
   DISPLAY g_srac008_desc TO srac008_i_desc
   DISPLAY g_srac008_desc TO srac008_o_desc
   LET g_sql = " SELECT UNIQUE srad009,'',srad010,srad011,srad012,srad013,srad014 ",
               "   FROM srad_t",
               "  WHERE sradent = '",g_enterprise,"'",
               "    AND sradsite = '",g_site,"'",
               "    AND srad001 = '",g_srab001,"'",
               "    AND srad002 = '",g_srab008,"'",
               "    AND srad004 = '",g_srab004,"'",
               "    AND srad005 = '",g_srab005,"'",
               "    AND srad006 = '",g_srab006,"'",
               "    AND srad007 = '",p_srac007,"'",
               "    AND srad008 = '2' "
   PREPARE asrt300_02_b_fill4_pb FROM g_sql
   DECLARE asrt300_02_b_fill4_cs CURSOR FOR asrt300_02_b_fill4_pb
   LET g_cnt = l_ac4
   LET l_ac4 = 1
   FOREACH asrt300_02_b_fill4_cs INTO g_srac4_d[l_ac4].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_srac4_d[l_ac4].srad009_o
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '223' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_srac4_d[l_ac4].srad009_o_desc =  g_rtn_fields[1]
      
      LET l_ac4 = l_ac4 + 1
      IF l_ac4 > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_srac4_d.deleteElement(g_srac4_d.getLength())
   LET l_ac4 = g_cnt
   LET g_cnt = 0

   FREE asrt300_02_b_fill4_pb
END FUNCTION

 
{</section>}
 
