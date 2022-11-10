import { Link ,withRouter} from "react-router-dom"

export default withRouter(function Man(props){

    const goTo=(name)=>{
        debugger
        if(name=="updateProduct")
            props.history.push({pathname:'/updateProduct'}) 
        if(name=="man/customer")
           props.history.push({pathname:'/manager/allUser'}) 
        if(name=="updateCategory")
           props.history.push({pathname:'/updateCategory'}) 
    }
    
    return<>
    {/* אפשרות לראות לקוחות */}
    <input type="button" value="לקוחות" onClick={()=>goTo("man/customer")}/>
    {/* אפשרות לעדכן מוצרים */}
    <input type="button" value="המוצרים" onClick={()=>goTo("updateProduct")}/>
    {/* אפשרות לעדכן קטגוריות */}
    <input type="button" value="קטגוריות" onClick={()=>goTo("updateCategory")}/>
    </>
})