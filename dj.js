//the vertices for our memo table
//I could also use a filter or map on the graph
//to avoid duplication; but this is nice
//and clear
const vertices = ["A", "B","C", "D", "E"];
//our graph
const graph = [
  {from : "S", to :"A", cost: 4},
  {from : "S", to :"E", cost: 2},
  {from : "A", to :"D", cost: 3},
  {from : "A", to :"C", cost: 6},
  {from : "A", to :"B", cost: 5},
  {from : "B", to :"A", cost: 3},
  {from : "C", to :"B", cost: 1},
  {from : "D", to :"C", cost: 3},
  {from : "D", to :"A", cost: 1},
  {from : "E", to: "D", cost: 1}
];

class MemoTable {
  //build the table using the vertices
  constructor(vertices) {
    //set the root manually
    this.S = { name: "S", cost: 0, visited: false };
    this.table = [this.S];
    for (var vertex of vertices) {
      this.table.push({
        name: vertex,
        cost: Number.POSITIVE_INFINITY,
        visited: false
      });
    }
  }
  //all non-visited vertices
  getCandidateVertices() {
    return this.table.filter(entry => {
      return entry.visited === false;
    });
  }
  //lowest cost, non-visited vertex
  nextVertex() {
    const candidates = this.getCandidateVertices();
    //if there are candidates, find the one
    //with lowest cost
    if (candidates.length > 0) {
      return candidates.reduce((prev, curr) => {
        return prev.cost < curr.cost ? prev : curr;
      });
    } else {
      //otherwise return null
      //this will help determine if we need to
      //iterate
      return null;
    }
  }
  //update current cost
  setCurrentCost(vertex, cost) {
    this.getEntry(vertex).cost = cost;
  }
  setAsVisited(vertex) {
    this.getEntry(vertex).visited = true;
  }
  getEntry(vertex) {
    return this.table.find(entry => entry.name == vertex);
  }
  getCost(vertex) {
    return this.getEntry(vertex).cost;
  }
  toString() {
    console.log(this.table);
  }
}

//create the table
const memo = new MemoTable(vertices);
console.log(memo);

//let's do this!
const evaluate = vertex => {
  //get the outgoing edges of the vertex
  const edges = graph.filter(path => {
    return path.from === vertex.name;
});
  //loop the edges...
  for(edge of edges){
    //calculate the costs
    const currentVertexCost = memo.getCost(edge.
from);
    const toVertexCost = memo.getCost(edge.to);
    const tentativeCost = currentVertexCost +
edge.cost;
    //if we can improve the cost to the
    //connected vertex...
    if(tentativeCost < toVertexCost){
//do it!
      memo.setCurrentCost(edge.to, tentativeCost);
    }
};
  //set this vertex as visited
memo.setAsVisited(vertex.name);

//get the next vertex
const next = memo.nextVertex();
//if there is a next vertex, let's do this
//again...
if(next) evaluate(next);
}
//kick it off from the source vertex
evaluate(memo.S);
memo.toString();
