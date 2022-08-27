struct Generic<T> {
	f T
}

struct NonGeneric {
	f int
}

fn (f &Generic<T>) + (f1 &Generic<T>) &Generic<T> {
	return &Generic<T>{
		f: f.f + f1.f
	}
}

fn (f &NonGeneric) + (f1 &NonGeneric) &NonGeneric {
	return &NonGeneric{
		f: f.f + f1.f
	}
}

fn test_referenced_generic_operator_overloading() {
	mut generic := &Generic<int>{2}
	generic += &Generic<int>{6}

	assert generic.f == 8
	assert (generic + &Generic<int>{2}).f == 10
}

fn test_referenced_operator_overloading() {
	mut non_generic := &NonGeneric{2}
	non_generic += &NonGeneric{6}

	assert non_generic.f == 8
	assert (non_generic + &NonGeneric{2}).f == 10

}

