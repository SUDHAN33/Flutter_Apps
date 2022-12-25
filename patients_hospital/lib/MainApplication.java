import io.flutter.app.FlutterApplication;
import io.flutter.view.FlutterMain;
import io.radar.sdk.Radar;

public class MainApplication extends FlutterApplication {

    @Override
    public void onCreate() {
        super.onCreate();
        Radar.initialize(this, "prj_live_pk_7c19990cbc80e8bf0b5a96eae9aa1b298703ae9a");
        FlutterMain.startInitialization(this);
    }

}