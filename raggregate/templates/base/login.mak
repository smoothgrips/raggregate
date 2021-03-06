<%inherit file="base.mak"/>
		${message}
        <%
            temp = False
            if u and u.temporary:
                temp = True
        %>
        % if temp:
            <h3>You were assigned an anonymous account. When you register, this profile will be automatically converted into your newly-registered profile.</h3>
            <h3>If you don't want this to happen, please <a href="${request.route_url('login', _query = [('logout', 'y')])}">log out now.</a> Note that this will make it impossible for you to access any of the features, including edit or deletion, associated with the anonymous account you have been using.</h3>
        % else:
            <br />
            <br />
        % endif
			</div>
            % if not logged_in:
                <div id="login_form" style="">
                    <b>Login</b><br />
                    <form action="/login?act=login" method="POST">
                        Username: <input type="text" name="username"><br />
                        Password: <input type="password" name="password"><br />
                        <input type="submit" value="Login" />
                    </form>
                </div>
                <div id="reg_form" style="">
                    <b>Don't have an account? Register here.</b><br />
                    <form action="/login?act=register" method="POST">
                        Username: <input type="text" name="username"><br />
                        Password: <input type="password" name="password"><br />
                        <input type="submit" value="Login" />
                    </form>
                </div>
            % else:
                <div id="change_pass_form">
                    <b>Change Password for ${u.display_name()}</b>
                    <form action="${request.route_url('login', _query=[('act', 'update_pw')])}" method="POST">
                        Old Password: <input name="old_password" type="password"><br />
                        New Password: <input name="new_password" type="password"><br />
                        New Password (Confirm): <input name="new_password_confirm" type="password"><br />
                        <input type="submit" value="Update Password" />
                    </form>
                </div>
            % endif

