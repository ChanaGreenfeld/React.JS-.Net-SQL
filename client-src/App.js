import logo from './logo.svg';
import './App.css';
import { Provider } from 'react-redux';
import  Login  from './Components/Login';
import { ourStore } from "./Redux/Store";
import Register from './Components/Register';
import {Open} from './Components/Rout/Open'
import {Bag} from './Components/Bag'
import Category from './Components/Rout/Category'
import  Products  from './Components/Products';
import { UpdateProduct } from './Components/UpdateProduct';
import { BrowserRouter, Route, Redirect, Switch } from 'react-router-dom';
import produce from 'immer';
import {AllUsers} from './Components/AllUsers'
import { InsertCategory } from './Components/insertCategory'

import Man from './Components/Rout/man'
import Deatails from './Components/Deatails';
import { UpdateCategory } from './Components/updateCategory';
import { UpCategory } from './Components/upCategory';

function App() {
  return <>
    <div className="App">
      <Provider store = {ourStore}>
      
      <BrowserRouter>
          <Open></Open>
          <Switch className="ss">
          {/* <Route path="/homePage" component={Open} exact></Route> */}
              <Route path="/Register" component={Register} exact></Route>
              <Route path="/Login" component={Login} exact></Route>
              <Route path="/bag" component={Bag} exact></Route>
              <Route path="/manager" component={Man} exact ></Route>
              <Route path="/manager/allUser" component={AllUsers} exact></Route>  
              <Route path="/updateCategory" component={UpdateCategory} exact></Route>  
              <Route path="/updateProduct" component={UpdateProduct} exact></Route>
              <Route path="/byCategory" component={Category} exact></Route>
              <Route path="/insertC" component={InsertCategory} exact></Route>
              <Route path="/insertC" component={InsertCategory} exact></Route>
              <Route path="/upCategory" component={UpCategory} exact></Route>
              <Route path="/byCategory/Products/:name" component={Products} exact></Route>
              <Route path="/byCategory/Products/details/:id" component={Deatails} exact></Route>

          </Switch>
        </BrowserRouter> 
        {/* <Login></Login> */}
     
      </Provider>
    </div>
 </>
}

export default App;
