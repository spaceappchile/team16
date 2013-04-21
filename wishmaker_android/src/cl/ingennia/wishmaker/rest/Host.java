package cl.ingennia.wishmaker.rest;

public interface Host {
	public String URL = "http://172.16.0.66";
	public enum ConnectionStatus {
		CONNECTED,
		DISCONNECTED,
		UNKNOWN
	}
}
