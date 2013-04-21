package cl.ingennia.wishmaker.broadcastreceiver;

import android.content.Context;
import cl.ingennia.wishmaker.service.GCMIntentService_;

import com.google.android.gcm.GCMBroadcastReceiver;

public class GCMReceiver extends GCMBroadcastReceiver {
	@Override
	protected String getGCMIntentServiceClassName(Context context) { 
		return GCMIntentService_.class.getName(); 
	} 
}
