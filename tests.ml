(* expects tag_parser to complete successfully
 * 'test' - original s-expression
 * 'expected_result' - output of (Tag_Parser.sprint_expr () (Tag_Parser.tag_parser (Reader.nt_sexpr test 0))) if tagged successfully
 * *)
 type cg_success_test = {test: string; expected_result: string};;

 (* expects tag_parser to raise exception during parsing
  * 'test' - original s-expression
  * *)
 
 let cg_success_tests = [
        {test = "#t" ; expected_result = "#t!!! Used 952 bytes of dynamically-allocated memory"} ;
        {test = "#f" ; expected_result = "#f!!! Used 952 bytes of dynamically-allocated memory"} ;
        {test = "((lambda (x) x) 1)" ; expected_result = "1!!! Used 985 bytes of dynamically-allocated memory"} ;
 ];;
 

 
