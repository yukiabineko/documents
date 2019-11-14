module DocumentsHelper
  def select_zerocount?
    result = true
    @document.document_items.all.each do |item|
       if item.document_selects.all.count == 0
          next
       elsif item.document_selects.all.count >0
          result = false
          break
       end 
    end    
      return result
  end
#外部リンクセレクト用
  def service_select
     @array = ["Google Drive","One Drive"]
  end
#外部リンク処理  
  def view_url(url,link)
   #ﾘﾝｸが空入力なら
     if link.blank?
      url == nil
      link == nil
      return nil
     else 
       if url == "Google Drive"
         #https://drive.google.com/open?id=1zAOyAZ0bksdecO6Dtn1R6Lir7XGupf9o
         #https://drive.google.com/open?id=14DUd1bx79G-ZBGB0QNwJ9m_vQbxADVsA
         array = link.split("=")
         view_url = "https://drive.google.com/file/d/"+array[1]+"/preview"
         return view_url
       elsif url == "One Drive" 
       end  
     end 
  end
  
  
end
