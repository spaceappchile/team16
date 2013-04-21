package cl.ingennia.wishmaker.service;

import android.content.Context;
import android.content.Intent;

import com.google.android.gcm.GCMBaseIntentService;
import com.googlecode.androidannotations.annotations.EService;

@EService
public class GCMIntentService extends GCMBaseIntentService{

	
	@Override
	protected void onError(Context context, String regId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void onMessage(Context context, Intent regId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void onRegistered(Context context, String regId) {

	}

	@Override
	protected void onUnregistered(Context context, String regId) {

	}

	


}
