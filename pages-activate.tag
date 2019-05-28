<activate>

<div class="container center-block">

<br><br>

<h2 class="display-4">Activate Now</h2>

<div class="card" style="width: 30rem;">
  <div class="card-body">
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
				<input class="form-check-input" type="radio" name="data_package" id="data_package_5gb" checked={optionInternetPackage==20} value="20" data-gb=5 onclick={toggleInternetPackage}>
				<label class="form-check-label" for="data_package_5gb">5GB - ₪20 monthly</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="data_package" id="data_package_20gb" checked={optionInternetPackage==40} value="40" data-gb=20 onclick={toggleInternetPackage}>
				<label class="form-check-label" for="data_package_20gb">20GB - ₪40 monthly</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="data_package" id="data_package_50gb" checked={optionInternetPackage==60} value="60" checked={} data-gb=50 onclick={toggleInternetPackage}>
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
<br><br>
<div class="row">
<div class="form-group col-md-4 col-xs-12">
	<input type="tel" placeholder="SIM Number" class="form-control {is-invalid: showValid.sim==false, is-valid:showValid.sim}" ref="sim" maxlength=19 required onblur="{check_sim}" onkeyup="{check_sim}">
	</div>
	</div>

<div class="row">
<div class="form-group col-md-4 col-xs-12">
	<input type="text" placeholder="Name" class="form-control" ref="name" required>
	</div>
	</div>

<div class="row">
<div class="form-group col-md-4 col-xs-12">
	<input type="email" placeholder="Email address" class="form-control" ref="email" onblur={checkEmail} required>
		<div if={emailSuggestion} class="alert alert-danger" align="right"><i>Did you mean <a onclick={setEmail}>{emailSuggestion.address}@<b>{emailSuggestion.domain}</b></a>?</i></div>
	</div>
	</div>

<div class="row">
<div class="form-group col-md-4 col-xs-12">
Activation Date: 
<input ref="date" class="form-control" data-toggle="datepicker">
	</div>
	</div>

<div class="row">
<div class="form-group col-md-4 col-xs-12">
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="ongoing" id="ongoing-no" value="0">
  <label class="form-check-label" for="inlineRadio1">Just one month of service</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="ongoing" id="onging-yes" value="1">
  <label class="form-check-label" for="inlineRadio2">Ongoing Service (rebill monthly)</label>
</div>
</div>
</div>
<br>


<div class="row">
	<div class="form-group col-md-4 col-xs-12 has-feedback {has-success:showValid.number, has-error: showValid.number==false}">
		<div class="input-group">
			<div class="input-group-addon"><span class="pf pf-{cardType}"></span></div>
			<input type="tel" placeholder="Card number" class="form-control {is-valid:showValid.number, is-invalid: showValid.number==false}" autocomplete="cc-number"
			ref="cardNumber" onblur="{check_card}" onkeyup="{check_card}" size=20 required>
		<span if={showValid.number}>
			<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
			<span id="creditCardValid" class="sr-only">Valid card number</span>
			</span>
		<span if={showValid.number==false}>
			<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
			<span id="creditCardValid" class="sr-only">Invalid card number</span>
			</span>
		</div>
	</div>
	</div>

<div class="row">
	<div class="form-group col-md-4 col-xs-12 has-feedback {has-error: showValid.expiration==false}"><!--glyphicon glyphicon-calendar-->
		<input type="tel" placeholder="Expiration (MM/YY)" class="form-control {is-invalid: showValid.expiration==false}" ref="expiration" autocomplete="cc-exp" onblur="{check_expiration}" onkeyup="{check_expiration}" required>
		<span if={showValid.expiration==false}>
			<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
			<span id="creditCardExpirationValid" class="sr-only">Invalid card expiration</span>
			</span>
		</div>
	</div>

<div class="row">
	<div class="form-group col-md-4 col-xs-12">
		<input type="tel" placeholder="CVC security code{cvcMessage? ': '+cvcMessage : ''}" class="form-control" ref="cvc" maxlength={cvcLength||4} autocomplete="off">
			</div>
		</div>

<div class="row">
	<div class="form-group col-md-4 col-xs-12">
	<input type="tel" placeholder="ZIP or postal code for this credit card " class="form-control" ref="ccPostalCode">
		</div>
	</div>


</div><!--big container-->


<script>
var self = this//can't access "this" within $.ajax/jquery scope

var base=29;
this.totalPrice=base;;
this.discount=false;;

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

	//window.localStorage.setItem('totalPrice', this.totalPrice);
	//window.localStorage.setItem('discount', this.discount);
	this.update();
	}

this.optionCallUSA= false;
this.toggleCallNA =function(){
	this.optionCallUSA=!this.optionCallUSA;
	//window.localStorage.setItem('optionCallUSA', this.optionCallUSA);
	if(!this.optionCallUSA) this.optionVirtualNumber=false;//if turning off calls to NA, then turn off Virtual number
	this.updatePrice();
	}

this.optionVirtualNumber= false;
this.toggleVirtual =function(){
	this.optionVirtualNumber=!this.optionVirtualNumber;
	if(this.optionVirtualNumber) this.optionCallUSA=true;//if turning on virtual, then the calls to NA must me on.
	//window.localStorage.setItem('optionCallUSA', this.optionCallUSA);
	//window.localStorage.setItem('optionVirtualNumber', this.optionVirtualNumber);
	this.updatePrice();
	}


this.optionInternet=false;
this.toggleInternet=function(){
	this.optionInternet=!this.optionInternet;
	window.localStorage.setItem('optionInternet', this.optionInternet);
	if(!this.optionsInternet){
		this.optionInternetPackage=0;
		//window.localStorage.setItem('optionInternetPackage', 0);
		}
	this.updatePrice();
	}

this.optionInternetPackage=0;
this.toggleInternetPackage=function(){
	var price = $("input[name='data_package']:checked").attr('value');
	price =parseInt(price,10);
	this.optionInternetPackage=price;
	//window.localStorage.setItem('optionInternetPackage', price);
	if(price==0) {
		this.optionInternet=false;
		//window.localStorage.setItem('optionInternet', false);
		}
	self.updatePrice();
	}

function getParameterByName(name) {
	var match = RegExp('[?&]' + name + '=([^&]*)').exec(window.location.search);
	return match && decodeURIComponent(match[1].replace(/\+/g, ' '));
	}
this.on('mount', function(){
	//rebuild chosen based on the query string
	var queryStringParsed=route.query();
	this.optionCallUSA = queryStringParsed['longDistance'] == 'true' ?  true : false;
	this.optionVirtualNumber = queryStringParsed['virtualNumber'] == 'true' ? true : false;
	if(this.optionVirtualNumber) this.optionCallUSA=true; //enforce the double choice
	
	this.optionInternetPackage = parseInt(queryStringParsed['data'],10);
	if(this.optionInternetPackage) this.optionInternet=true;
	self.updatePrice();
	
	$('[data-toggle="datepicker"]').datepicker({autoHide: true, autoPick: true, startDate: 'today'}); //endDate -- how far in the future to offer?
	//Docs: https://github.com/fengyuanchen/datepicker Demo: https://fengyuanchen.github.io/datepicker/

	if(!this.cardType)	this.cardType="credit-card"; //start with generic card
	$(this.refs.cardNumber).payment('formatCardNumber');
	$(this.refs.expiration).payment('formatCardExpiry');
	$(this.refs.cvc).payment('formatCardCVC');


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



this.showValid={};
function ValidateSim (simNumber) {//source: HOT's website. Input: MUST be a string since the number overflows JS's numbers.
	if (!simNumber) return false;
	if (simNumber.length!==19) return false;

	var startIndex = 0;
	var test = 0;

	for (var index = startIndex; index < 19; index++) {
		var charIndex = index + simNumber.length - 19;
		var dig = parseInt(simNumber.charAt(charIndex), 10);
		var mul = parseInt(((index % 2) + 1) * dig, 10) + '';
		//mul.split('').forEach(function(val){test +=parseInt(val,10)});
		for (var i = 0; i < mul.length; i++) {
			test += parseInt(mul.charAt(i), 10);
			}
		}
	return test % 10 == 0;
	}
this.check_sim = function(event){
	if(self.refs.sim.value.length<1) return self.showValid.sim=null;
	else if(self.refs.sim.value.length==19) self.showValid.sim=ValidateSim(self.refs.sim.value);//when finished -- 19 digits
	else if (event && event.type=="blur") self.showValid.sim=ValidateSim(self.refs.sim.value);//or blur'ed from the field
	else self.showValid.sim=null;
	}
this.checkEmail = function(event){
	Mailcheck.run({
		email: this.refs.email.value
		,suggested: function(suggestion) {
			self.emailSuggestion=suggestion;
			self.update();
			}
		,empty: function() {
			self.emailSuggestion=null;
			self.update();
			}
		});
	}
this.setEmail = function(){
	self.refs.email.value=self.emailSuggestion.full;
	self.emailSuggestion=null;
	self.update();
	}

function showBrandFromStripe (brand){
	brand=brand && brand.toLowerCase() || "credit-card";//only stripe returns it capital
	//Returned from stripe: Visa, American Express, MasterCard, Discover, JCB, Diners Club, or Unknown. https://stripe.com/docs/api/node#cards
	//Card types in pf-icons: visa, american-express, mastercard, discover, jcb, diners, credit-card. http://paymentfont.io/
	if(brand=="unknown") return "credit-card";//stripe
	else if (brand=="american express") return "american-express";//stripe
	else if (brand=="amex") return "american-express";//stripe-jquery payments
	else if (brand=="diners club") return "diners";//stripe
	else if (brand=="dinersclub") return "diners";//stripe-jquery payments
	else return brand;
	}
this.check_card = function(event){//event
	var card = this.refs.cardNumber.value.replace(/\s+|-/g,'');//hah, we had spaces from the formatting.
	if(!card) return this.showValid.number=null;

	this.cardType=$.payment.cardType(card);
	
	if(this.cardType=="amex") {this.cvcMessage="4 digits on FRONT"; this.cvcLength=4}
	else if(this.cardType) {this.cvcMessage = "3 digits on BACK"; this.cvcLength=3}
	else {
		this.cvcMessage=null;
		this.cvcLength=4;
		}

	var valid=$.payment.validateCardNumber(card)
	if (valid) this.showValid.number=true;
	else if (card.length>=16 || (this.cardType=="amex" && card.length>=15)) {//don't show it's invalid if they didn't finish typing yet!
		this.showValid.number=false;
		}
	else if (event && event.type=="blur") this.showValid.number=false;//he lost left focus, so now show it's invalid.
	else this.showValid.number=null;

	this.cardType=showBrandFromStripe(this.cardType); //NOW, after using it, transform for paymentfont icon.
	self.update();
	}

this.check_expiration = function(event){
	if(this.refs.expiration.value.length<1) return this.showValid.expiration=null;

	var date =$.payment.cardExpiryVal(this.refs.expiration.value) || null
	var valid=date && $.payment.validateCardExpiry(date.month, date.year) || null
	if (valid) {
		this.showValid.expiration=null;
		//don't show success, almost anything can be valid
		}
	else if (date && date.month>12) this.showValid.expiration=false;
	else if (this.refs.expiration.value.length>=9) this.showValid.expiration=false;
	else if (event && event.type=="blur") this.showValid.expiration=false;//he lost left focus, so show it's invalid.
	else this.showValid.expiration=null;
	}
</script>
</activate>