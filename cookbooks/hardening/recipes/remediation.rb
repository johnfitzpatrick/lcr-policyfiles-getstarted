package "%w(rsyslog audit)

cookbook_file "/etc/audit/auditd.conf" do
  source "auditd.conf"
end
