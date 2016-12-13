const initialState = {
  is_shown: 0
}

export default function reducer(state = initialState, action) {
  switch(action.type) {
    case 'SHOW': {
    	return { is_shown: 1 }
    }
    case 'HIDE': {
    	return { is_shown: 0 }
    }
    default:
      return state
  }
}