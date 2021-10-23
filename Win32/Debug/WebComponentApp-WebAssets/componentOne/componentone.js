var jsro = null;

var orionProgressObj = null;

const componentOneStyle = `@charset "utf-8";
.loading-overlay {
    background: rgba( 26,26,26,0.7 );
    /* position: fixed; */
    width: 100%;
    height: 100%;
    z-index: 5;
    top: 0;
}

.loading-overlay-img-container {
    position: absolute;
    z-index: 7;
    top: 50%;
    left: 50%;
    transform: translate( -50%, -50% );
}

.loading-overlay-img {
    width: 160px;
    height: 24px;
    border-radius: 5px;
}

.orion-working-hidden {
    display: none;
}

#orion-working-msg {
  text-align: center;
  color: white;
}

.spinning-box {
  background: #FFFFFF;
  width: 30px;
  height: 30px;
  margin: auto;
  border-radius: 4px;
  animation: rotate 3s linear infinite;
}

@keyframes rotate {
  from { transform: rotate(0deg);	}
  to { transform: rotate(359deg); }
}`;

const addCSS = codeToAdd => document.head.appendChild(document.createElement("style")).innerHTML = codeToAdd;
addCSS(componentOneStyle);

xtag.register('x-progress', {
  content: `<div class="loading-overlay orion-working-hidden"></div>
            <div class="loading-overlay-img-container orion-working-hidden">
                <div class="spinning-box"></div>
                <p id="orion-working-msg">Loading...</p>
            </div>`,
  lifecycle: {
    created  : function(){ 
      /* Called when the custom element is created */ 
    },
    inserted : function(){ 
      /* Called when the custom element is inserted into the DOM */ 
      orionProgressObj = this.querySelector(".loading-overlay");
      startJsRO(this.id);            
    },
    removed  : function(){ 
      /* Called when the custom element is removed from the DOM */ 
    },
    attributeChanged: function(attrName, oldValue, newValue){
      /* Called when the attribute of the custom element is changed */
    }
  },
  accessors : {},
  methods   : {},
  events    : {}
});

function startJsRO(controlId) {
  jsro = new Thinfinity.JsRO();

  jsro.on(controlId, "start", function () {
    const div =  document.querySelector('.loading-overlay');
    div.classList.remove('orion-working-hidden');
    const div2 =  document.querySelector('.loading-overlay-img-container');
    div2.classList.remove('orion-working-hidden');     
    console.trace('start');
  });


  jsro.on(controlId, "stop", function () {
    const div =  document.querySelector('.loading-overlay');
    div.classList.add('orion-working-hidden');
    const div2 =  document.querySelector('.loading-overlay-img-container');
    div2.classList.add('orion-working-hidden');           
  });

  jsro.on(controlId, "msgupdate", function (value) {
    console.trace('msgupdate');
    const element =  document.querySelector('#orion-working-msg');
    element.innerText = value;
  });  
};
