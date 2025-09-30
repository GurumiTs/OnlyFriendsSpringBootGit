# OnlyFriendsSpringBootGit
# 資策會專題 - OnlyFriends
- 專題成員: 洪巧恩、高境良、曾俊翔、蕭文婷、陳靖、江衍奎
- 專題構思: 網路發達的時代已經不僅限於面對面擴展人脈了，所以希望能透過此網站讓大家認識更多的各行各業的朋友。
# 使用工具:
後端:
- Java
- Spring boot
- Ms sql
- Spring Security
- JSP
- JPA

前端:
- HTML / CSS
- JavaScript
- jQuery

# 功能概述: 
- 登入系統(境良)：搭配spring security實作登入驗證機制，拼圖滑塊機器人驗證、註冊激活信箱寄送、忘記密碼，以及提供第三方登入之服務。
- 會員抽卡配對遊戲(境良)：加入會員可透過代幣進行抽卡配對遊戲進而對會員提出交友邀請，對方接受邀請後即可成為好友進行線上聊天等，及串接paypal金流進行代幣儲值。
- 好友聊天系統(境良)：成為好友的會員實現線上聊天、歷史訊息紀載以及訊息通知等功能。
- 線上客服系統(境良)：會員可透過此功能即時與客服進行溝通。
- 後臺管理首頁(境良，巧恩):動態圖表呈現以及報表下載。
- 管理者舉辦活動(衍奎)：後台創建活動CRUD，前端使用者參加活動確認及資料登記並使用googlemap顯示活動地點，且提供路徑規劃
- 使用者舉辦活動(陳靖)：會員可新增活動、修改與刪除個人所創辦活動、後端管理者可決定活動遊覽權限、紀錄遊覽人數、會員報名活動機制、報名後也可以在個人遊覽介面看到自己參加的活動，在活動介面也可看見創辦人資訊。
- 論壇(俊翔)：管理者針對文章作CRUD管理，使用者投稿文章後需要管理者到後台審核文章，才能至文章主頁查看新文章。
- 留言板(俊翔)：使用者能針對會員文章做留言動作，以及分享文章和點讚系統。
- 優惠券(文婷)：後端管理者CRUD、領用優惠券分類及細項統計圖表。前端優惠券分類、會員領取優惠券的判斷及購物車使用折抵消費的邏輯。
- 廣告(文婷): 後端管理者CRUD、前端廣告顯示上下架。
- 商品(巧恩)：從管理者後台可CRUD商品至商品主頁，商品主頁可查看商品詳細資訊及相關商品等功能。
- 購物車及訂單(巧恩)：使用者將商品加入購物車可修改數量或整筆刪除，也可至個人頁面觀看購買商品確認結帳後串接paypal進行結帳且於paypal中可察看詳細商品資訊及折扣並於結帳後寄信告知使用者。使用者可查看歷史訂單資訊、訂單狀態以及取消訂單，後臺管理者可改變訂單狀態及確認取消訂單。

## 免責聲明 / Disclaimer

本專案/程式碼僅供學習與研究之用，**使用風險請自行承擔**。作者/貢獻者對因使用本專案所造成的任何直接、間接、偶發、特殊或衍生之損害（包含但不限於資料遺失、系統故障、商業中斷或其他損失）**概不負責**。本專案以 **「現狀（AS IS）」** 提供，不附帶任何明示或暗示之保證，包括但不限於適銷性、特定目的適用性與非侵權之保證。  
使用者應自行確保遵守所在國家/地區之法律法規與相關第三方服務條款。若您不同意上述條款，請勿使用本專案。


This project/code is provided **for learning and research purposes only** and is used **at your own risk**. The author(s)/contributors **shall not be liable** for any direct, indirect, incidental, special, or consequential damages arising from the use of this project, including but not limited to data loss, system failure, business interruption, or other losses. The project is provided **“AS IS”**, **without warranty of any kind**, express or implied, including but not limited to warranties of merchantability, fitness for a particular purpose, and noninfringement.  
You are responsible for complying with applicable laws and any third-party terms. If you do not agree with these terms, do not use this project.

