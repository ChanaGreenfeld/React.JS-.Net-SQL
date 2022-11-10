import {PrudoctsReducer} from './Products/ProductsReduser'
import {UsersReducer} from './Users/userReduser'
import {CategoryReducer} from './Category/categoryReduser'
import { combineReducers, createStore } from "redux";

let info  = combineReducers({
    users:UsersReducer,
    prudocts:PrudoctsReducer,
    category:CategoryReducer
});


export const ourStore = createStore(info) 
