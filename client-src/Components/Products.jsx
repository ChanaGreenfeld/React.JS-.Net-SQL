import { useSelector, useDispatch } from "react-redux";
import {  GetAllPrudocts,GetPrudoctsByCategory} from "../Redux/Products/ProductsServ";
import {removeP} from '../Redux/Products/ProductsServ'
import {addNewUser, addProduct,ChangMan} from '../Redux/Users/userAction'
import { LoadData } from "../Redux/Products/ProductsAction";
import { useEffect } from "react"
import { useState } from "react";
import { Link,withRouter } from "react-router-dom"
import './product.css';

 export default withRouter(function Products(props){

    const [flagExist, setflagExist] = useState(false);
    const [flagAdToBag, setFlagAdToBag] = useState(false);


    var myDis = useDispatch()

    var myProducts;
    
    useEffect(async() => {
        await getProduct()
    }, [])

    const getProduct=async ()=>{
        debugger
        if(props.match.params.name=="allProducts")
              myProducts = await GetAllPrudocts()
        else 
              myProducts=await GetPrudoctsByCategory(props.match.params.name); 
        if(bagCurrent.nameC!="")
           setflagExist(true)
        myDis(LoadData(myProducts))
    }

    let bagCurrent = useSelector((store) => {
        debugger;
        
        return store.users.current
    })

    


   


    let product = useSelector((store) => {
        debugger;
        return store.prudocts.PrudoctsFromServer
    })

    // let isMan = useSelector((store) => {
    //     debugger;
    //     return store.users.man
    // })
const d=(item)=>{
        debugger
        let id=item.id
        props.history.push({pathname:'/byCategory/Products/details/'+id}) 
    }
    const addToBag=(e)=>{
        debugger

        let p={id: e.id , nameP :e.name , amount: 1,codeCategory:e.codeCategory,cost:e.cost,pic:e.pic}
            myDis(addProduct(p))
            setFlagAdToBag(true)        
    }

    const myArrayMin=(arr)=> {
        var len = arr.length
        let min = 100000
        let ind
        debugger
        while (len--) {
          if (parseInt(arr[len].cost) < min) {
             min = arr[len].cost;
            ind=len
          }
        }
        return ind;
      }

      const myArrayMax=(arr)=> {
        var len = arr.length
        let min = 0;
        let ind
        debugger
        while (len--) {
          if (parseInt(arr[len].cost) > min) {
             min = arr[len].cost;
            ind=len
          }
        }
        return ind;
      }

      const fromAtoZ=(arr)=> {
        var len = arr.length
        let letter ="ת";
        let ind
        debugger
        while (len--) {
          if (arr[len].name[0] < letter) {
             letter = arr[len].name[0];
            ind=len
          }
        }
        return ind;
      }

    const sortP =async (e)=>{
        let newP=[]
        let newProduct=[]
        if(e.target.value==e.target[2].innerHTML)
        {
            debugger
            
            while (product.length!=0) {
                    var i= myArrayMin(product)
                    newP.push(product[i])
                    debugger
                    for (let j = 0; j < product.length; j++) {
                        if(j!=i)
                            newProduct.push(product[j])
                    }
                    product=newProduct
                    newProduct=[]
                }
        }
        if(e.target.value==e.target[1].innerHTML)
        {
            debugger
            while (product.length!=0) {
                    var i= myArrayMax(product)
                    newP.push(product[i])
                    debugger
                    for (let j = 0; j < product.length; j++) {
                        if(j!=i)
                            newProduct.push(product[j])
                    }
                    product=newProduct
                    newProduct=[]
                }
        }
        if(e.target.value==e.target[3].innerHTML)
        {
            debugger
            while (product.length!=0) {
                    var i= fromAtoZ(product)
                    newP.push(product[i])
                    debugger
                    for (let j = 0; j < product.length; j++) {
                        if(j!=i)
                            newProduct.push(product[j])
                    }
                    product=newProduct
                    newProduct=[]
                }
        }
        if(e.target.value==e.target[0].innerHTML)
        {
            newP=product
        }
        
        myDis(LoadData(newP))
    }

    return<>
    
            <select onChange={async (e)=>sortP(e)}>
                <option></option>
                <option>מיון לפי מחיר מהגבוה לנמוך</option>
                <option>מיון לפי מחיר מהנמוך לגבוה</option>
                <option>לפי סדר האותיות'</option>

            </select>
            <br></br>
        
            {
                product != undefined &&
                product.length > 0 &&
                product.map((item) =>
                     <>
                     <div className="prdct">
                     <img src={`/${item.pic}`} onClick={()=>d(item)}/>
                         <p>{item.name}</p>
                         <p>{item.cost}</p>
                        <input type="button" value="הוספה לסל" className="addD" disabled={!flagExist} onClick={()=>addToBag(item)}/>
                     </div>
                         
                    </>
                )
            }

{
    flagAdToBag &&
    <div id="myModal" >
    <div class="modal-content">
        <div class="modal-header">
            {/* (click)="close()" */}
            <span  class="close">&times;</span>
            <h2>!{{myProduct.nameProduct}} נוסף לסל בהצלחה </h2>
        </div>
        <div class="modal-body">
            <img src={{myProduct.picture}}>
        </div>
        <div class="modal-footer">
            <h3>!המשך קניה מהנה</h3>
        </div>
    </div>
</div>
}


            
     </>
 })

//  const cssPic = { 
//      display:"flex",
//     width: "280px",
//     // hight:"380px",
//     float: "left",
//     margin: "15px",
//     alignItems: "block",
//     /* border: 3px darkgrey solid;
//     border-radius: 3px; */
//     padding: "10px",
//     display: "inline-block"}

    // const btn={
    // marginBottom: "2px",
    // padding: "16px 32px",
    // margin: "4px 2px",
    // opacity:"0.6",
    // transition: "0.3s",
    // display: "inline-block",
    // cursor: "pointer",
    // display: "inline-block"}