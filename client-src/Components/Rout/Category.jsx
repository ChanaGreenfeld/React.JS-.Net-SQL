import { Link,withRouter } from "react-router-dom"
import { GetAllCategory } from '../../Redux/Category/categoryServ'
import { useEffect } from "react"
import { useSelector, useDispatch } from "react-redux";
import {LoadData} from '../../Redux/Category/categoryAction'



export default withRouter(function Category(props){

    let myCategory
    var myDis = useDispatch()

    useEffect(async() => {
        debugger;
        myCategory = await GetAllCategory()
        myDis(LoadData(myCategory))
    }, [])

    let category = useSelector((store) => {
        debugger;
        return store.category.categoryFromServer
    })

    const goTo=(name)=>{
        debugger
        if(name!="allProducts")
        {
            let newName=name.nameCategory
             props.history.push({pathname:'/byCategory/Products/'+newName}) 
        }
        else
        props.history.push({pathname:'/byCategory/Products/'+name}) 
    }


    return<>
     <input type="button" value="כל המוצרים" onClick={()=>goTo("allProducts")}/>
   
   
    {
        
      category!=undefined && category.length>0 &&
      category.map((item) =>
         <>
         <input type="button" value={item.nameCategory} onClick={()=>goTo(item)}/>
         </>
                )   
    }


    </>
}
)

