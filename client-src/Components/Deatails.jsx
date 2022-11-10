import { useEffect } from "react"
import { withRouter } from "react-router-dom";
import { GetPrudoctsById } from "../Redux/Products/ProductsServ";
import { LoadData } from "../Redux/Products/ProductsAction";
import { useSelector, useDispatch } from "react-redux";

export default withRouter(function Deatails(props){
    
   
    var prod
 
   var myDis=useDispatch()

   useEffect(async() => {

     prod=await GetPrudoctsById(props.match.params.id)
     myDis(LoadData(prod))
}, [])

let product = useSelector((store) => {
    return store.prudocts.PrudoctsFromServer
})

const backs=()=>{
    props.history.back()
}

    return<>
   
    <p>{product[0].name} שם</p>
    <p>{product[0].cost} מחיר</p>
    <img src={`/${product[0].pic}`} width="200px"/>
    <input type="button" value="חזרה" onClick={async ()=>backs ()}/>

    </>
})