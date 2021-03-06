#該程式未解開Section, 採用最新樣板產出!
{<section id="asrt335_01.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0003(2015-06-12 10:23:28), PR版次:0003(2017-01-20 15:58:08)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000116
#+ Filename...: asrt335_01
#+ Description: 條碼報工子程式
#+ Creator....: 00537(2014-04-21 11:25:28)
#+ Modifier...: 05795 -SD/PR- 02295
 
{</section>}
 
{<section id="asrt335_01.global" >}
#應用 c01b 樣板自動產生(Version:10)
#add-point:填寫註解說明 name="global.memo"
#+ Modifier...:   No.160318-00025#34   2016/04/14 BY pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#161228-00028#1  2016/12/30 By 02295    报工类型调整11-15
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc" name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_sffb_m        RECORD
       sffb001 LIKE sffb_t.sffb001, 
   sffb026 LIKE sffb_t.sffb026, 
   sffb026_desc LIKE type_t.chr80, 
   sffb026_desc_1 LIKE type_t.chr80, 
   sffb027 LIKE sffb_t.sffb027, 
   sffb028 LIKE sffb_t.sffb028, 
   sffb025 LIKE sffb_t.sffb025, 
   sffb025_desc LIKE type_t.chr80, 
   sffb007 LIKE sffb_t.sffb007, 
   sffb007_desc LIKE type_t.chr80, 
   sffb008 LIKE sffb_t.sffb008, 
   sffb002 LIKE sffb_t.sffb002, 
   sffb002_desc LIKE type_t.chr80, 
   sffb004 LIKE sffb_t.sffb004, 
   sffb004_desc LIKE type_t.chr80, 
   sffb010 LIKE sffb_t.sffb010, 
   sffb010_desc LIKE type_t.chr80, 
   sffbstus LIKE sffb_t.sffbstus, 
   sffbownid LIKE sffb_t.sffbownid, 
   sffbownid_desc LIKE type_t.chr80, 
   sffbowndp LIKE sffb_t.sffbowndp, 
   sffbowndp_desc LIKE type_t.chr80, 
   sffbcrtid LIKE sffb_t.sffbcrtid, 
   sffbcrtid_desc LIKE type_t.chr80, 
   sffbcrtdp LIKE sffb_t.sffbcrtdp, 
   sffbcrtdp_desc LIKE type_t.chr80, 
   sffbcrtdt LIKE sffb_t.sffbcrtdt, 
   sffbmodid LIKE sffb_t.sffbmodid, 
   sffbmodid_desc LIKE type_t.chr80, 
   sffbmoddt LIKE sffb_t.sffbmoddt, 
   sffbcnfid LIKE sffb_t.sffbcnfid, 
   sffbcnfid_desc LIKE type_t.chr80, 
   sffbcnfdt LIKE sffb_t.sffbcnfdt
       END RECORD
	   
#add-point:自定義模組變數(Module Variable)(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_sffbdocno     LIKE sffb_t.sffbdocno
#end add-point
 
DEFINE g_sffb_m        type_g_sffb_m
 
   
 
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point
 
{</section>}
 
{<section id="asrt335_01.input" >}
#+ 資料輸入
PUBLIC FUNCTION asrt335_01(--)
   #add-point:input段變數傳入 name="input.get_var"
 
   #end add-point
   )
   #add-point:input段define name="input.define_customerization"
   
   #end add-point
   DEFINE l_ac_t          LIKE type_t.num10       #未取消的ARRAY CNT 
   DEFINE l_allow_insert  LIKE type_t.num5        #可新增否 
   DEFINE l_allow_delete  LIKE type_t.num5        #可刪除否  
   DEFINE l_count         LIKE type_t.num10
   DEFINE l_insert        LIKE type_t.num5
   DEFINE p_cmd           LIKE type_t.chr5
   #add-point:input段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_sfaa010       LIKE sfaa_t.sfaa010
   DEFINE l_slip          LIKE sffb_t.sffbdocno
   DEFINE l_sffbdocdt     LIKE sffb_t.sffbdocdt
   DEFINE l_sffb009       LIKE sffb_t.sffb009
   DEFINE l_sffb011       LIKE sffb_t.sffb011
   DEFINE l_sffb012       LIKE sffb_t.sffb012
   DEFINE l_sffb013       LIKE sffb_t.sffb013
   DEFINE l_sffb014       LIKE sffb_t.sffb014
   DEFINE l_sffb015       LIKE sffb_t.sffb015
   DEFINE l_sffb016       LIKE sffb_t.sffb016
   DEFINE l_sffb017       LIKE sffb_t.sffb017
   DEFINE l_sffb018       LIKE sffb_t.sffb018
   DEFINE l_sffb019       LIKE sffb_t.sffb019
   DEFINE l_sffb020       LIKE sffb_t.sffb020
   DEFINE l_sffb024       LIKE sffb_t.sffb024
   DEFINE l_sffbseq       LIKE sffb_t.sffbseq
   #end add-point
   
   #畫面開啟 (identifier)
   OPEN WINDOW w_asrt335_01 WITH FORM cl_ap_formpath("asr","asrt335_01")
 
   #瀏覽頁簽資料初始化
   CALL cl_ui_init()
   
   LET g_qryparam.state = "i"
   LET p_cmd = 'a'
   
   #輸入前處理
   #add-point:單頭前置處理 name="input.pre_input"
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log

   #CALL cl_set_combo_scc('sffb001','4020')  #161228-00028#1
   CALL cl_set_combo_scc('sffb001','4021')  #161228-00028#1
   #end add-point
  
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #輸入開始
      INPUT BY NAME g_sffb_m.sffb001,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb025, 
          g_sffb_m.sffb007,g_sffb_m.sffb008,g_sffb_m.sffb002,g_sffb_m.sffb004,g_sffb_m.sffb010,g_sffb_m.sffbstus  
          ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION
         #add-point:單頭前置處理 name="input.action"
         
         #end add-point
         
         #自訂ACTION(master_input)
         
         
         BEFORE INPUT
            #add-point:單頭輸入前處理 name="input.before_input"
            CALL s_transaction_begin() 
            #LET g_sffb_m.sffb001 = "3"  #161228-00028#1
            LET g_sffb_m.sffb001 = "13"  #161228-00028#1
            LET g_sffb_m.sffb002 = g_user
            LET g_sffb_m.sffb002_desc = s_desc_get_person_desc(g_sffb_m.sffb002)
            LET g_sffbdocno = cl_get_para(g_enterprise,g_site,'S-MFG-0035')
            LET l_sffbdocdt = cl_get_today()
            CALL s_aooi200_gen_docno(g_site,g_sffbdocno,l_sffbdocdt,g_prog) RETURNING l_success,g_sffbdocno
            IF NOT l_success THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'apm-00003'
               LET g_errparam.extend = g_sffbdocno
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_sffbdocno = NULL
               RETURN g_sffbdocno
            END IF
            LET l_sffbseq   = 0
            LET l_sffb011   = 1
            LET l_sffb012   = cl_get_today()
            LET l_sffb013   = cl_get_time()
            LET l_sffb013   = l_sffb013[1,5]
            LET l_sffb014 = s_asrt335_get_working_time(g_sffb_m.sffb001,g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008,l_sffb012,l_sffb013) * l_sffb011
            LET l_sffb015 = s_asrt335_get_working_time(g_sffb_m.sffb001,g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008,l_sffb012,l_sffb013)
            LET l_sffb018 = 0      
            LET l_sffb019 = 0
            LET l_sffb020 = 0
            LET g_sffb_m.sffbownid = g_user
            LET g_sffb_m.sffbowndp = g_dept
            LET g_sffb_m.sffbcrtid = g_user
            LET g_sffb_m.sffbcrtdp = g_dept 
            LET g_sffb_m.sffbcrtdt = cl_get_current()
            LET g_sffb_m.sffbmodid = ""
            LET g_sffb_m.sffbmoddt = ""
            LET g_sffb_m.sffbstus = "N"            
            DISPLAY BY NAME g_sffb_m.*
            #end add-point
          
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sffb001
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sffb_m.sffb001,"1.000","0","5.000","0","azz-00087",1) THEN
               NEXT FIELD sffb001
            END IF 
 
 
 
            #add-point:AFTER FIELD sffb001 name="input.a.sffb001"
            IF NOT cl_null(g_sffb_m.sffb001) THEN 
               IF p_cmd = 'a'  THEN
                  IF NOT s_asrt335_chk_sffb(g_sffb_m.sffb001,g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008) THEN
                     LET g_sffb_m.sffb001 = NULL
                     NEXT FIELD CURRENT
                  END IF                  
               END IF
               
            END IF 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sffb001
            #add-point:BEFORE FIELD sffb001 name="input.b.sffb001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sffb001
            #add-point:ON CHANGE sffb001 name="input.g.sffb001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sffb026
            
            #add-point:AFTER FIELD sffb026 name="input.a.sffb026"
            IF NOT cl_null(g_sffb_m.sffb026) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sffb_m.sffb026

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_imaf001_1") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF


            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sffb026
            #add-point:BEFORE FIELD sffb026 name="input.b.sffb026"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sffb026
            #add-point:ON CHANGE sffb026 name="input.g.sffb026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sffb027
            #add-point:BEFORE FIELD sffb027 name="input.b.sffb027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sffb027
            
            #add-point:AFTER FIELD sffb027 name="input.a.sffb027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sffb027
            #add-point:ON CHANGE sffb027 name="input.g.sffb027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sffb028
            #add-point:BEFORE FIELD sffb028 name="input.b.sffb028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sffb028
            
            #add-point:AFTER FIELD sffb028 name="input.a.sffb028"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sffb028
            #add-point:ON CHANGE sffb028 name="input.g.sffb028"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sffb025
            
            #add-point:AFTER FIELD sffb025 name="input.a.sffb025"
            IF NOT cl_null(g_sffb_m.sffb025) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sffb_m.sffb025
               LET g_chkparam.err_str[1] = "asr-00014:sub-01302|asri001|",cl_get_progname("asri001",g_lang,"2"),"|:EXEPROGasri001"  #160318-00025#34  add
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_srza001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sffb_m.sffb025
            CALL ap_ref_array2(g_ref_fields,"SELECT srza002 FROM srza_t WHERE srzaent='"||g_enterprise||"' AND srza001=? ","") RETURNING g_rtn_fields
            LET g_sffb_m.sffb025_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sffb_m.sffb025_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sffb025
            #add-point:BEFORE FIELD sffb025 name="input.b.sffb025"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sffb025
            #add-point:ON CHANGE sffb025 name="input.g.sffb025"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sffb007
            
            #add-point:AFTER FIELD sffb007 name="input.a.sffb007"

            IF NOT cl_null(g_sffb_m.sffb007) THEN 
               IF p_cmd = 'a'  THEN
#共用检查逻辑搬到同一个function内
                  IF NOT s_asrt335_chk_sffb(g_sffb_m.sffb001,g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008) THEN
                     LET g_sffb_m.sffb007 = NULL
                     NEXT FIELD CURRENT
                  END IF
                  CALL s_asrt335_default_sffb(g_sffb_m.sffb001,g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008)
                  RETURNING g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008,l_sffb009  
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sffb_m.sffb007
                  CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
                  LET g_sffb_m.sffb007_desc = '', g_rtn_fields[1] , ''
                  DISPLAY BY NAME g_sffb_m.sffb007_desc 
               END IF
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sffb_m.sffb007
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sffb_m.sffb007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sffb_m.sffb007_desc           


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sffb007
            #add-point:BEFORE FIELD sffb007 name="input.b.sffb007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sffb007
            #add-point:ON CHANGE sffb007 name="input.g.sffb007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sffb008
            
            #add-point:AFTER FIELD sffb008 name="input.a.sffb008"
            IF NOT cl_null(g_sffb_m.sffb008) THEN 
               IF p_cmd = 'a'  THEN
#共用检查逻辑搬到同一个function内
                  IF NOT s_asrt335_chk_sffb(g_sffb_m.sffb001,g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008) THEN
                     LET g_sffb_m.sffb008 = NULL
                     NEXT FIELD CURRENT
                  END IF

                  CALL s_asrt335_default_sffb(g_sffb_m.sffb001,g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008)
                  RETURNING g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008,l_sffb009  
               END IF
# #预设待处理数量
               CALL s_asrt335_set_qty(g_sffbdocno,l_sffbseq,g_sffb_m.sffb001,g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008) RETURNING l_sffb017,l_sffb016
               
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sffb008
            #add-point:BEFORE FIELD sffb008 name="input.b.sffb008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sffb008
            #add-point:ON CHANGE sffb008 name="input.g.sffb008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sffb002
            
            #add-point:AFTER FIELD sffb002 name="input.a.sffb002"
            IF NOT cl_null(g_sffb_m.sffb002) THEN 
               IF p_cmd = 'a' THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sffb_m.sffb002
                  LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooag001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
   
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sffb_m.sffb002 = NULL
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            LET g_sffb_m.sffb002_desc = s_desc_get_person_desc(g_sffb_m.sffb002)
            DISPLAY BY NAME g_sffb_m.sffb002_desc
            CALL s_aooi200_get_slip(g_sffbdocno) RETURNING l_success,l_slip
            IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0068') ='Y' THEN 
               IF p_cmd ='a'  THEN
                  SELECT TOP oogf001 INTO l_sffb024
                    FROM oogf_t 
                   WHERE oogfent  = g_enterprise
                     AND oogfsite = g_site
                     AND oogf002  = l_sffb002
                     AND oogfstus = 'Y'
                     AND oogf003 <= l_sffbdocdt
 
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sffb002
            #add-point:BEFORE FIELD sffb002 name="input.b.sffb002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sffb002
            #add-point:ON CHANGE sffb002 name="input.g.sffb002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sffb004
            
            #add-point:AFTER FIELD sffb004 name="input.a.sffb004"
            IF NOT cl_null(g_sffb_m.sffb004) THEN 
               IF p_cmd = 'a'  THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_site
                  LET g_chkparam.arg2 = g_sffb_m.sffb004
                  
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_oogd001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
                  
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sffb_m.sffb004 = NULL
                     NEXT FIELD CURRENT
                  END IF
               END IF

            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_site
            LET g_ref_fields[2] = g_sffb_m.sffb004
            CALL ap_ref_array2(g_ref_fields,"SELECT oogd002 FROM oogd_t WHERE oogdent='"||g_enterprise||"' AND oogdsite=? AND oogd001=? ","") RETURNING g_rtn_fields
            LET g_sffb_m.sffb004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sffb_m.sffb004_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sffb004
            #add-point:BEFORE FIELD sffb004 name="input.b.sffb004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sffb004
            #add-point:ON CHANGE sffb004 name="input.g.sffb004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sffb010
            
            #add-point:AFTER FIELD sffb010 name="input.a.sffb010"
            IF NOT cl_null(g_sffb_m.sffb010) THEN 
               IF p_cmd ='a'  THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sffb_m.sffb010
			      
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_mrba001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
			      
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sffb_m.sffb010 = NULL
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sffb_m.sffb010
            CALL ap_ref_array2(g_ref_fields,"SELECT mrba004 FROM mrba_t WHERE mrbaent='"||g_enterprise||"' AND mrbasite = '"||g_site||"' AND mrba001=? ","") RETURNING g_rtn_fields
            LET g_sffb_m.sffb010_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sffb_m.sffb010_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sffb010
            #add-point:BEFORE FIELD sffb010 name="input.b.sffb010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sffb010
            #add-point:ON CHANGE sffb010 name="input.g.sffb010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sffbstus
            #add-point:BEFORE FIELD sffbstus name="input.b.sffbstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sffbstus
            
            #add-point:AFTER FIELD sffbstus name="input.a.sffbstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sffbstus
            #add-point:ON CHANGE sffbstus name="input.g.sffbstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.sffb001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sffb001
            #add-point:ON ACTION controlp INFIELD sffb001 name="input.c.sffb001"
            
            #END add-point
 
 
         #Ctrlp:input.c.sffb026
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sffb026
            #add-point:ON ACTION controlp INFIELD sffb026 name="input.c.sffb026"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb026             #給予default值
            LET g_qryparam.default2 = "" #g_sffb_m.imaal004 #規格
            LET g_qryparam.default3 = "" #g_sffb_m.bmaa001 #主件料號
            LET g_qryparam.default4 = "" #g_sffb_m.bmaa002 #特性
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_bmaa001_4()                                #呼叫開窗

            LET g_sffb_m.sffb026 = g_qryparam.return1              
            #LET g_sffb_m.imaal004 = g_qryparam.return2 
            #LET g_sffb_m.bmaa001 = g_qryparam.return3 
            #LET g_sffb_m.bmaa002 = g_qryparam.return4 
            DISPLAY g_sffb_m.sffb026 TO sffb026              #
            #DISPLAY g_sffb_m.imaal004 TO imaal004 #規格
            #DISPLAY g_sffb_m.bmaa001 TO bmaa001 #主件料號
            #DISPLAY g_sffb_m.bmaa002 TO bmaa002 #特性
            NEXT FIELD sffb026                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sffb027
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sffb027
            #add-point:ON ACTION controlp INFIELD sffb027 name="input.c.sffb027"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb027             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #


            CALL q_bmaa002()                                #呼叫開窗

            LET g_sffb_m.sffb027 = g_qryparam.return1              

            DISPLAY g_sffb_m.sffb027 TO sffb027              #

            NEXT FIELD sffb027                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sffb028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sffb028
            #add-point:ON ACTION controlp INFIELD sffb028 name="input.c.sffb028"
            
            #END add-point
 
 
         #Ctrlp:input.c.sffb025
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sffb025
            #add-point:ON ACTION controlp INFIELD sffb025 name="input.c.sffb025"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb025             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #


            CALL q_srza001()                                #呼叫開窗

            LET g_sffb_m.sffb025 = g_qryparam.return1              

            DISPLAY g_sffb_m.sffb025 TO sffb025              #

            NEXT FIELD sffb025                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sffb007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sffb007
            #add-point:ON ACTION controlp INFIELD sffb007 name="input.c.sffb007"
                                   #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb007             #給予default值
            LET g_qryparam.default2 = g_sffb_m.sffb008             #製程序

            #給予arg
#            LET g_qryparam.arg1 = g_site
#            LET g_qryparam.arg2 = g_sffb_m.sffb005
#            LET g_qryparam.arg3 = g_sffb_m.sffb006

            CALL q_sfcb003_4()                                #呼叫開窗

            LET g_sffb_m.sffb007 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sffb_m.sffb008 = g_qryparam.return2 #製程序

            DISPLAY g_sffb_m.sffb007 TO sffb007              #顯示到畫面上
            DISPLAY g_sffb_m.sffb008 TO sffb008 #製程序

            NEXT FIELD sffb007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sffb008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sffb008
            #add-point:ON ACTION controlp INFIELD sffb008 name="input.c.sffb008"
                                    #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb007             #給予default值
            LET g_qryparam.default2 = g_sffb_m.sffb008             #製程序

            #給予arg
#            LET g_qryparam.arg1 = g_site
#            LET g_qryparam.arg2 = g_sffb_m.sffb005
#            LET g_qryparam.arg3 = g_sffb_m.sffb006

            CALL q_sfcb003_4()                                #呼叫開窗

            LET g_sffb_m.sffb007 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sffb_m.sffb007_desc = g_qryparam.return2         #说明
            LET g_sffb_m.sffb008 = g_qryparam.return3 #製程序

            DISPLAY g_sffb_m.sffb007 TO sffb007              #顯示到畫面上
            DISPLAY g_sffb_m.sffb007_desc
            DISPLAY g_sffb_m.sffb008 TO sffb008 #製程序

            NEXT FIELD sffb008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sffb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sffb002
            #add-point:ON ACTION controlp INFIELD sffb002 name="input.c.sffb002"
                                    #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb002             #給予default值

            #給予arg

            CALL q_ooag001_4()                                #呼叫開窗

            LET g_sffb_m.sffb002 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sffb_m.sffb002 TO sffb002              #顯示到畫面上

            NEXT FIELD sffb002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sffb004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sffb004
            #add-point:ON ACTION controlp INFIELD sffb004 name="input.c.sffb004"
                                    #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb004             #給予default值

            #給予arg

            CALL q_oogd001_01()                                #呼叫開窗

            LET g_sffb_m.sffb004 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sffb_m.sffb004 TO sffb004              #顯示到畫面上

            NEXT FIELD sffb004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sffb010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sffb010
            #add-point:ON ACTION controlp INFIELD sffb010 name="input.c.sffb010"
                                    #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb010             #給予default值
            LET g_qryparam.where = " mrbasite ='",g_site,"' "
            #給予arg

            CALL q_mrba001()                                #呼叫開窗

            LET g_sffb_m.sffb010 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sffb_m.sffb010 TO sffb010              #顯示到畫面上

            NEXT FIELD sffb010                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sffbstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sffbstus
            #add-point:ON ACTION controlp INFIELD sffbstus name="input.c.sffbstus"
            
            #END add-point
 
 
 #欄位開窗
 
         AFTER INPUT
            #add-point:單頭輸入後處理 name="input.after_input"
        
            CALL s_asrt335_set_qty(g_sffbdocno,l_sffbseq,g_sffb_m.sffb001,g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008) 
            RETURNING l_sffb017,l_sffb016
               
            LET l_sffb014 = s_asrt335_get_working_time(g_sffb_m.sffb001,g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008,l_sffb012,l_sffb013) * l_sffb011
            LET l_sffb015 = s_asrt335_get_working_time(g_sffb_m.sffb001,g_sffb_m.sffb025,g_sffb_m.sffb026,g_sffb_m.sffb027,g_sffb_m.sffb028,g_sffb_m.sffb007,g_sffb_m.sffb008,l_sffb012,l_sffb013)
            IF g_sffb_m.sffb007 IS NULL THEN LET g_sffb_m.sffb007 = ' ' END IF
            IF g_sffb_m.sffb008 IS NULL THEN LET g_sffb_m.sffb008 = ' ' END IF

            INSERT INTO sffb_t (sffbent,sffbsite,sffbdocno,sffbseq,sffb001,sffb007,sffb008,sffb002,
                                sffb004,sffb010,sffb009,sffb011,sffb003,sffb012,sffb013,sffb014,sffb015,sffb016,
                                sffb017,sffb018,sffb019,sffb020,sffb024,sffbdocdt,sffbstus,sffbownid,sffbowndp,
                                sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,sffbmoddt,sffbcnfid,sffbcnfdt)
            VALUES (g_enterprise,g_site,g_sffbdocno,l_sffbseq,g_sffb_m.sffb001,g_sffb_m.sffb007,g_sffb_m.sffb008,g_sffb_m.sffb002,
                    g_sffb_m.sffb004,g_sffb_m.sffb010,l_sffb009,l_sffb011,g_dept,l_sffb012,l_sffb013,l_sffb014,l_sffb015,l_sffb016,
                    l_sffb017,l_sffb018,l_sffb019,l_sffb020,l_sffb024,l_sffbdocdt,g_sffb_m.sffbstus,g_sffb_m.sffbownid,g_sffb_m.sffbowndp,
                    g_sffb_m.sffbcrtid,g_sffb_m.sffbcrtdp,g_sffb_m.sffbcrtdt,g_sffb_m.sffbmodid,g_sffb_m.sffbmoddt,g_sffb_m.sffbcnfid,g_sffb_m.sffbcnfdt)
            
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "asrt335_01 ins sffb"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               LET g_sffbdocno = NULL               
               CALL s_transaction_end('N','0')
            ELSE
               IF NOT s_asrt335_ins_sffc(g_sffbdocno,l_sffbseq) THEN
                  CALL s_transaction_end('N','0')
                  LET g_sffbdocno = NULL 
               END IF
               CALL s_transaction_end('Y','0')
            END IF

            #end add-point
            
      END INPUT
    
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      #公用action
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
 
   #add-point:畫面關閉前 name="input.before_close"
   
   #end add-point
   
   #畫面關閉
   CLOSE WINDOW w_asrt335_01 
   
   #add-point:input段after input name="input.post_input"
   IF s_transaction_chk('Y',0) THEN
      CALL s_transaction_end('Y','0')
   END IF
   IF INT_FLAG THEN
      LET g_sffbdocno = NULL
   END IF
                  
   RETURN g_sffbdocno
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="asrt335_01.other_dialog" readonly="Y" >}

 
{</section>}
 
{<section id="asrt335_01.other_function" readonly="Y" >}

 
{</section>}
 
