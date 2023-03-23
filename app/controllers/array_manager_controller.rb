class ArrayManagerController < ApplicationController
  skip_before_action :verify_authenticity_token

  def getarray
    lenght = params[:lenght]

    if lenght.to_i > 10 
      #Creating unique values within the array (we need to fix the lenght)
      arr =  generateArrayRangeV2(lenght, 0, 30) #Array.new(lenght.to_i) { rand(0...30) }.uniq
      render json: arr.to_json
    else
      not_allowed
    end
  end

  def getrange
    array = generateLargestRange( params[:_json])
    render json: array.to_json
  end


  private
 
  def not_allowed
    render text: "501 Not Allowed", status: 501
  end

  

  def generateArrayRangeV2(size, initial, final)

    array = Array.new
    if size.to_i>final.to_i
      size=final
    end

    for i in 0..final.to_i do
      value =i
      array.append(value)
    end

    for i in 1..(final.to_i - size.to_i) do
        value =rand(0...array.length-1)
        array.delete_at(value) 
    end

    return array
  end



  #Deprecated por performance!
  def generateLargestRange(array)

    array = array.sort
    cont=0
    contAux=0
    min=0
    max=0

    minAux=0
    maxAux=0
    for i in 0..array.length-1 do
      
      if cont>contAux || cont==0
        if(i<array.length-1)
          dif = array[i+1]-array[i]
          if(dif ==1)
            if(cont==0)
              min=array[i]
            end
            contAux =cont
            cont+=1

          else
            
            max=array[i]
            
              minAux=min
              maxAux=max

            cont=0
          end
        else
          
          if(cont>0)
            max=array[i]
            maxAux=max
            #contAux=0
            cont=0
          end
        end 
      end 
      

      
    end

    return [minAux,maxAux]

  end
 

end
