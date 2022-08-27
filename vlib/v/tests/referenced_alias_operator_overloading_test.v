type Map = map[string]string
type Tuple = []f64

fn new_map() Map {
	return Map({
		'23': 'str'
	})
}

fn (a &Map) + (b &Map) Map {
	str := b['23']
	return Map({
		'34': str + '12'
	})
}

fn new_tuple(x f64, y f64, z f64, w f64) Tuple {
	return Tuple([x, y, z, w])
}

fn (a &Tuple) + (b &Tuple) Tuple {
	mut res := []f64{len: a.len}
	for i := 0; i < a.len; i++ {
		res[i] = a[i] + b[i]
	}
	return Tuple(res)
}

fn test_referenced_alias_operator_overloading() {
	mut m1 := new_map()
	m2 := new_map()
	assert (m1 + m2).str() == "Map({'34': 'str12'})"
	assert m1 + m2 == Map({
		'34': 'str12'
	})

	m1 += m1
	assert m1 == Map({
		'34': 'str12'
	})
	assert m1.str() == "Map({'34': 'str12'})"

	mut t1 := new_tuple(12, 4.5, 6.7, 6)
	t2 := new_tuple(12, 4.5, 6.7, 6)
	assert t1 + t2 == Tuple([24.0, 9.0, 13.4, 12.0])
	assert (t1 + t2).str() == 'Tuple([24, 9, 13.4, 12])'

	t1 += t2
	assert t1 == Tuple([24.0, 9.0, 13.4, 12.0])
	assert t1.str() == 'Tuple([24, 9, 13.4, 12])'
}
