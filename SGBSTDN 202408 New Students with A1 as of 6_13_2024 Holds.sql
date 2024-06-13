-- This logic get New Students (SGBSTDN_STYP_CODE = 'A') with A1 Hold as of a given term.
-- At this time, the term is '202408'.
select spriden_id, spriden_last_name, spriden_first_name, spriden_mi 

from sgbstdn

inner join spriden
 on spriden_pidm = sgbstdn_pidm
 and spriden_change_ind is null

inner join sprhold
 on sprhold_pidm = sgbstdn_pidm
 and sprhold_hldd_code = 'A1'
 and sprhold_to_date >= sysdate

where sgbstdn_term_code_eff = '202408'
and substr(sgbstdn_term_code_eff, 5, 1) <> '9'
and sgbstdn_styp_code = 'N'
