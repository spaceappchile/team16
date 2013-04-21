package cl.ingennia.wishmaker.broadcastreceiver;

import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.location.Location;
import android.os.Bundle;

import com.commonsware.cwac.locpoll.LocationPollerResult;
import com.googlecode.androidannotations.annotations.EReceiver;
import com.googlecode.androidannotations.annotations.SystemService;

@EReceiver
public class LocationReceiver extends BroadcastReceiver {

	@SystemService
	NotificationManager notificationManager;

	@Override
	public void onReceive(Context context, Intent intent) {

		Bundle b = intent.getExtras();
		LocationPollerResult locationResult = new LocationPollerResult(b);
		Location location = locationResult.getLocation();

		double latitude = 0.0;
		double longitude = 0.0;

		try {
			location.getLatitude();
			location.getLongitude();
		} catch (NullPointerException e) {
		}

		if (latitude != 0.0 && longitude != 0.0) {
			
		}

	}

}
