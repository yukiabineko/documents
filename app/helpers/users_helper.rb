module UsersHelper
#教員提出保護者から何件提出されたか？
  def reply_count(memo,randam)
    documents = Document.where(memo: memo, randam: randam) #条件の提出抽出
    count = 0                                              #保護者の提出数

    documents.each do |document|
      if document.answers.all.count > 0
        count += 1
      end    
    end    
    return count
  end 
#保護者の場合、レコードが一の場合でpublic falseの場合th非表示
  def public_check
    result = false
    if !@user.id == 1 && @user.documents.all.count == 1
      document = @user.documents.all.last
      if document.public == false
        result = false
      end
    #複数レコードがある場合public trueが一つでもあればtrue  
    elsif @user.documents.all.count > 1 
      count = 0
      documents = @user.documents.all
      documents.each do |document|
        if document.public == true
          count += 1
        end  
        if count > 0
          result = true
        end  
      end 
    end  
    return result
  end
       
end
