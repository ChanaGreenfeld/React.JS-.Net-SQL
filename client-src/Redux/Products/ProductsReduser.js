import  produce  from 'immer';
const PrudoctsInitialState = {
    PrudoctsFromServer: []
}

export const PrudoctsReducer = produce((state, action) => {
        switch (action.type) {
            case "LOAD_DATA":
                {
                    state.PrudoctsFromServer = action.payload;
                    break;
                }
        }
    }, PrudoctsInitialState)