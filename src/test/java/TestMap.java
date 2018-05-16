import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

public class TestMap {
	public static void main(String[] args) {
		Map<String, String> param = new HashMap<String, String>();
		param.put(null, null);
		Map<String, String> hparam = new TreeMap<String, String>();
		hparam.put("", null);
		Map<String, String> lhparam = new LinkedHashMap<String, String>();
		lhparam.put(null, null);
	}
}
