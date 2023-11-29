// This company bids for all tasks
// Strategy: bids a random value

// Inclusion of standards agent's behavior to make agents able to work in an JaCaMo environment
{ include("$jacamoJar/templates/common-cartago.asl") }
// Inclusion of common behaviors for this application
{ include("common.asl") }

// initial belief
my_task("SitePreparation").
my_task("Floors").
my_task("Walls").
my_task("Roof").
my_task("WindowsDoors").
my_task("Plumbing").
my_task("ElectricalSystem").
my_task("Painting").

// initial goal to discover artifact
!start.

+task(S)[artifact_id(Art)]
   <- .wait(math.random(500)+50);
      Bid = math.floor(math.random(10000))+800;
      //.print("my bid in auction artifact ", Art, " is ",Bid);
      bid( Bid )[artifact_id(Art)]. // recall that the artifact ignores if this
                                    // agent places a bid that is higher than
                                    // the current bid

/* plans for execution phase */

{ include("org_code.asl") }
{ include("skills.asl") }
