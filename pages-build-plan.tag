<prices>

<div class="container center-block">

<br><br>

<h2 class="display-4">View Monthly Plans</h2>

<div class="card" style="width: 30rem;">

<div class="card-header text-center">
	Total Price per Month: {totalPrice} Shekels
	<small class="card-subtitle mb-2 text-muted">(current dollar rate: ${(totalPrice/rateUSD).toFixed(2)})</small>
	<i class="card-subtitle mb-2 text-muted" if={discount}> discount applied!</i>
  </div>
  <div class="card-body">
<ul class="list-group">
	<li class="list-group-item"><i class="fas fa-check text-success"></i> Israeli phone number</li>
	<li class="list-group-item"><i class="fas fa-check text-success"></i> Unlimited outgoing calls and text messages to Israeli phone numbers</li>
	<li class="list-group-item"><i class="fas fa-check text-success"></i> Unlimited incoming calls and text messages from anywhere in the world</li>
	</ul>

	<br>
	<center><small class="card-text"><i>Select all 3 add-on options and get 10 Shekels off your monthly price!</i></small></center>

<ul class="list-group">
	<li class="list-group-item"><i class="fas fa-2x fa-toggle-{optionCallUSA ? 'on' : 'off'} {optionCallUSA ? 'text-success' : 'text-danger'}" onclick={toggleCallNA}></i>
			Unlimited calls to the USA and Canada (₪20 per month)</li>
	<li class="list-group-item"><i class="fas fa-2x fa-toggle-{optionVirtualNumber ? 'on' : 'off'} {optionVirtualNumber ? 'text-success' : 'text-danger'}" onclick={toggleVirtual}></i>
			USA phone number for calls and text to and from the USA (₪20 per month) <small><i>Must also choose calls to USA/CA</small></i></li>

	<li class="list-group-item"><i class="fas fa-2x fa-toggle-{optionInternet ? 'on' : 'off'} {optionInternet ? 'text-success' : 'text-danger'}" onclick={toggleInternet}></i>
			High-speed 4G/LTE Internet data

		<div if={optionInternet}>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="data_package" id="data_package_5gb" value="20" data-gb=5 onclick={toggleInternetPackage}>
				<label class="form-check-label" for="data_package_5gb">5GB - ₪20 monthly</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="data_package" id="data_package_20gb" value="40" data-gb=20 onclick={toggleInternetPackage}>
				<label class="form-check-label" for="data_package_20gb">20GB - ₪40 monthly</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="data_package" id="data_package_50gb" value="60" data-gb=50 onclick={toggleInternetPackage}>
				<label class="form-check-label" for="data_package_50gb">50GB - ₪60 monthly</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="data_package" id="data_package_none" value="0" data-gb=0 onclick={toggleInternetPackage}>
				<label class="form-check-label" for="data_package_none">None: You will have no Internet data on your phone. You can still connect to WiFi when available</label>
			</div>
 <br>
			<i>If you run out of data, you can always add more for 10 Shekels per 1GB.</i>
			</div>
		</li>

  </ul>

  </div><!--end card body-->

  <div class="card-header text-center">
	Total Price per Month: {totalPrice} Shekels 
	<small class="card-subtitle mb-2 text-muted">(current dollar rate: ${(totalPrice/rateUSD).toFixed(2)})</small>
	<i class="card-subtitle mb-2 text-muted" if={discount}> discount applied!</i>
  </div>
  
</div><!--end card-->

<br>
<a href="https://fs28.formsite.com/simforisrael/neqjpdbygw/index.html?1558638441110" target="_blank" class="btn btn-primary btn-lg">
	I do not have a SIM card. Get one now >
	</a><br><br>
<button type="button" class="btn btn-primary btn-lg" onclick={activatePage}>
	I have a SIM card. Activate it now >
	</button>

<br><br>
<div class="card" style="width: 30rem;">
<ul class="list-group list-group-flush">
	<li class="list-group-item"><i class="fas fa-check"></i> No activation fee!</li>
	<li class="list-group-item"><i class="fas fa-check"></i> No additional fees!</li>
	<li class="list-group-item"><i class="fas fa-check"></i> No long term contract!</li>
	<li class="list-group-item"><i class="fas fa-check"></i> Fully prepaid, renewable monthly!</li>
	</ul>
</div>


</div><!--big container-->


<script>
var self = this//can't access "this" within $.ajax/jquery scope

var base=29;
this.totalPrice=base;;
this.discount=false;;

this.activatePage=function(){
	var data = {
		longDistance: this.optionCallUSA
		,virtualNumber: this.optionVirtualNumber
		,data: this.optionInternetPackage
		}
	route('activate?' + $.param(data));
	}

this.updatePrice=function(){
	this.totalPrice=base;
	if(this.optionCallUSA) this.totalPrice+=20;
	if(this.optionVirtualNumber) this.totalPrice+=20;
	if(this.optionInternetPackage) this.totalPrice+=this.optionInternetPackage;

	if(this.optionCallUSA && this.optionVirtualNumber && this.optionInternetPackage) {
		this.totalPrice-=10;
		this.discount=true;
		}
	else this.discount=false;
	this.update();
	}

this.optionCallUSA=false;
this.toggleCallNA =function(){
	this.optionCallUSA=!this.optionCallUSA;
	if(!this.optionCallUSA) this.optionVirtualNumber=false;//if turning off calls to NA, then turn off Virtual number
	this.updatePrice();
	}

this.optionVirtualNumber=false;
this.toggleVirtual =function(){
	this.optionVirtualNumber=!this.optionVirtualNumber;
	if(this.optionVirtualNumber) this.optionCallUSA=true;//if turning on virtual, then the calls to NA must me on.
	this.updatePrice();
	}

this.optionInternet=false;
this.toggleInternet=function(){
	this.optionInternet=!this.optionInternet;
	window.localStorage.setItem('optionInternet', this.optionInternet);
	if(!this.optionsInternet){
		this.optionInternetPackage=0;
		}
	this.updatePrice();
	}
this.optionInternetPackage=0;
this.toggleInternetPackage=function(){
	var price = $("input[name='data_package']:checked").attr('value');
	price =parseInt(price,10);
	this.optionInternetPackage=price;
	if(price==0) this.optionInternet=false;
	self.updatePrice();
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
</prices>