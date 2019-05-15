package fjtimp;

import com.mercadopago.callbacks.Callback;
import com.mercadopago.core.MercadoPago;
import com.mercadopago.model.ApiException;
import com.mercadopago.model.CardToken;
import com.mercadopago.model.Token;
import com.mercadopago.mpconnect.util.JsonUtil;
import com.mercadopago.model.ApiException;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


/**
 * This class echoes a string called from JavaScript.
 */
public class MP extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
      if (action.equals("createToken")) {
        createToken(args, callbackContext);
        return true;
      }
        return false;
    }

  private void createToken(JSONArray data, CallbackContext callbackContext) throws JSONException {
    cordova.setActivityResultCallback(this);

    CardToken cardToken = new CardToken(data.getString(1), data.getInt(2), data.getInt(3), data.getString(4), data.getString(5), data.getString(6), data.getString(7));

    MercadoPago mercadoPago = new MercadoPago.Builder()
      .setContext(this.cordova.getActivity())
      .setPublicKey(data.getString(0))
      .build();

    mercadoPago.createToken(cardToken, new Callback<Token>() {
      @Override
      public void success(Token token) {

        String mptoken = JsonUtil.getInstance().toJson(token);
        callbackContext.success(mptoken);
      }

      @Override
      public void failure(ApiException error) {
        callbackContext.error(error.toString());
      }
    });
  }

}
