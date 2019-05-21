<main>

<div class="container center-block">

<h2 class="display-3">Build Your Own Monthly Plan</h2>

<div class="card" style="width: 30rem;">

<div class="card-header text-center">
	Your Price: ₪ {totalPrice} per month 
	<small class="card-subtitle mb-2 text-muted">(approx ${(totalPrice/rateUSD).toFixed(2)})</small>
	<i class="card-subtitle mb-2 text-muted" if={discount}> discount applied!</i>
  </div>
  <div class="card-body">
  <ul class="list-group">
	<li class="list-group-item"><i class="fas fa-check text-success"></i> Israeli phone number</li>
	<li class="list-group-item"><i class="fas fa-check text-success"></i> Unlimited outgoing calls and text messages to Israeli phone numbers</li>
	<li class="list-group-item"><i class="fas fa-check text-success"></i> Unlimited incoming calls and text messages from anywhere in the world</li>
	<li class="list-group-item"><i class="fas fa-2x fa-toggle-{optionCallUSA ? 'on' : 'off'} {optionCallUSA ? 'text-success' : 'text-danger'}" onclick={toggleCallNA}></i>
			Unlimited calls to the USA and Canada (₪20 per month )</li>
	<li class="list-group-item"><i class="fas fa-2x fa-toggle-{optionVirtualNumber ? 'on' : 'off'} {optionVirtualNumber ? 'text-success' : 'text-danger'}" onclick={toggleVirtual}></i>
			USA phone number that rings on your phone (₪20 per month)</li>

	<li class="list-group-item">
		<select ref='internet' onchange={toggleInternet}>
		<option value='not chosen'>--Select Internet package--</option>
		<option value=20> 5GB: ₪20 per month</option>
		<option value=40>20GB: ₪40 per month</option>
		<option value=60>50GB: ₪60 per month</option>
		<option value=0> None: ₪0 per month</option>
		 </select>
			{refs.internet.value==0 ? 'You will have no Internet data on your phone. You can still connect to WiFi when available.' : 
			'High-speed 4G/LTE Internet data'}</li>

<!--No, I do not need calls to the USA/Canada
No, I do not need a USA number
-->

  </ul>

    <p class="card-text"><i>Select all 3 add-on options and get 10 Shekels off your monthly price!</i></p>
  </div><!--end card body-->

  <div class="card-header text-center">
	Your Price: ₪ {totalPrice} per month 
	<small class="card-subtitle mb-2 text-muted">(approx ${(totalPrice/rateUSD).toFixed(2)})</small>
	<i class="card-subtitle mb-2 text-muted" if={discount}> discount applied!</i>
  </div>
  
</div><!--end card-->

<Br><Br>
<div class="card" style="width: 30rem;">
<ul class="list-group list-group-flush">
	<li class="list-group-item"><i class="fas fa-check"></i> No activation fee!</li>
	<li class="list-group-item"><i class="fas fa-check"></i> No additional fees!</li>
	<li class="list-group-item"><i class="fas fa-check"></i> No long term contract!</li>
	<li class="list-group-item"><i class="fas fa-check"></i> Fully prepaid, renewable monthly!</li>
	</ul>
</div>

<br>
<button type="button" class="btn btn-primary btn-lg">
	<span class="fa-stack fa-2x">
		<i class="fas fa-sim-card fa-stack-1x"></i>
		<i class="fas fa-ban fa-stack-2x" style="color:Tomato"></i>
	</span>
	I do not have a SIM card. I’d like to order one now >
	</button><br><br>
<button type="button" class="btn btn-primary btn-lg">
		<span class="fa-stack fa-2x">
		<i class="fas fa-check fa-stack-2x" style="color:green"></i>
		<i class="fas fa-sim-card fa-stack-1x"></i>
		</span>
	I have a SIM card. Activate it now >
	</button>


</div><!--big container-->


<script>
var self = this//can't access "this" within $.ajax/jquery scope


this.active=this.opts.active || 'home';
var base=29;
this.totalPrice=base;
this.discount=false;
this.updatePrice=function(){
	this.totalPrice=base;
	this.discount=false;
	if(this.optionCallUSA) this.totalPrice+=20;
	if(this.optionVirtualNumber) this.totalPrice+=20;
	if(this.optionsInternet) this.totalPrice+=this.optionsInternet;

	if(this.optionCallUSA && this.optionVirtualNumber && this.optionsInternet) {
		this.totalPrice-=10;
		this.discount=true;
		}
	this.update();
	}

this.optionCallUSA=false;
this.toggleCallNA =function(){
	this.optionCallUSA=!this.optionCallUSA;
	this.updatePrice();
	}

this.optionVirtualNumber=false;
this.toggleVirtual =function(){
	this.optionVirtualNumber=!this.optionVirtualNumber;
	this.updatePrice();
	}

this.optionsInternet=0;
this.toggleInternet=function(){
	this.optionsInternet=parseInt(this.refs.internet.value,10);
	this.updatePrice();
	}


this.on('mount', function(){
	self.update();
	});

function getValueTrimmed(field){
	if(typeof self.refs[field] === 'undefined') return null;
	var value = self.refs[field].value;
	return value.trim();
	}
function getValueNumeric(field){
	var value = getValueTrimmed(field);
	if(value) return value.replace(/\s+|-/g,'');
	else return null;
	}



</script>
</main>
